function [edges, cost] = prim_v_heap(A)
    n = length(A(:,1)); z=1:n;
    adj = A; adj(adj>0)=1;
    n_in_tree = [1,zeros(1,n-1)]; c_node = n_in_tree(1);
    heap=[];edges=zeros(n-1,2);
    
    for i=2:n
        if adj(c_node,i)==1
            cost = A(c_node,i);
        else cost = Inf; 
        end
        heap = [heap, struct('v',i,'e',[c_node i],'c',cost)];
    end
    
    cost = 0;
    while ~isempty(heap)
        heap = heapify(heap);
        min = heap(1);
        heap = heap(2:end);
        i = z(n_in_tree==0);  n_in_tree(i(1)) = min.v;
        i = z(edges(:,1)==0); edges(i(1),:) = min.e;
        cost = cost + min.c;
        p=[heap.v];
        for i=z(adj(min.v,:)==1)
            if ~isempty(p(p-i==0))
                j=z(p==i);
                if A(i,min.v) < heap(j).c && A(i,min.v)~=0; heap(j).e = [min.v i]; heap(j).c=A(i,min.v); end
            end
        end
    end
end
