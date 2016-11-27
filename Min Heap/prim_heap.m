function [edges, cost] = prim_heap(A)
    % Some needed variables definition
    n           = length(A(:,1));
    z           = 1:n;
    adj         = A;
    adj(adj>0)  = 1;
    edges       = zeros(n-1,2);
    n_in_tree   = [1,zeros(1,n-1)];
    c_node      = n_in_tree(1);
    heap        = [];
    % Build initial min heap starting on node 1
    for i=2:n
        if adj(c_node,i)==1
            cost = A(c_node,i);
        else cost = Inf; 
        end
        heap = insert_heap(heap,struct('v',i,'e',[c_node i],'c',cost));
    end
    % Obtain MST
    cost = 0; 
    while ~isempty(heap)
        % Extract edge with minimum cost
        min = heap(1); heap(1)=heap(end);
        heap = heap(1:length(heap)-1);
        heap = heapify_root(heap);
        % Add node to nodes already in the MST and edge to MST edges
        i = z(n_in_tree==0);  n_in_tree(i(1)) = min.v;
        i = z(edges(:,1)==0); edges(i(1),:) = min.e;
        % Update cost
        cost = cost + min.c;
        p=[heap.v];
        % For the nodes not in the MST that are connected with the last
        % node added to the MST, update if necessary the min cost edge
        % that connects them to the MST 
        
        % Iterate through nodes connected with the last node added to MST
        for i=z(adj(min.v,:)==1)
            % Check if node is already in MST
            if ~isempty(p(p-i==0))
                j=z(p==i); % if not, get min heap index of node
                if A(i,min.v) < heap(j).c && A(i,min.v)~=0
                    % Update min cost edge
                    heap(j).e = [min.v i]; heap(j).c = A(i,min.v);
                    % Update heap
                    heap = decrease_heap_key(heap,j);
                    p=[heap.v];
                end
            end
        end
    end
end
