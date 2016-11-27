function [mst, cost] = iterative_prim(A)
    [n,n] = size(A);                                             % The matrix is n by n, where n = # nodes.
    intree = 1; nintree=1;                                       % intree = nodes selected. nintree= #intree
    k = 0;                                                       % k is the number of edges selected
    notintree = [2:n]'; nnotintree=n-1;                          % notintree = nodes not selected. nnotintree=#notintree
    while nintree < n
        mincost = Inf;
        for i=1:nintree
            for j=1:nnotintree
                ni = intree(i); nj= notintree(j);
                if A(ni,nj) < mincost && A(ni,nj)~=0,
                    mincost = A(ni,nj); ei = ni; ej = nj;        % Save nodes and edge selected
                end
            end
        end
        k = k + 1;                                               % Increment number of edges in tree.
        mst(k,:) = [ei,ej];                                      % Add this edge to tree.
        costs(k,1) = mincost;                                    % Add the cost of this edge
        nintree = nintree+ 1;                                    % Increment number of nodes that tree connects.
        nnotintree = nnotintree-1;                               % Decrement number of nodes that tree connects.
        intree = [intree; ej];                                   % Add this node to tree.
        notintree = setdiff(notintree,ej);                       % Delete node to the notintree list
    end;
    cost = sum(costs);
end
