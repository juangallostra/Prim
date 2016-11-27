function [mst, cost] = recursive_prim(A,visited,edges,mst,cost)    % A is connectivity matrix with edge cost
    % Recursive prim algorithm
    if nargin < 5; cost=0;    
        if nargin < 4; mst = [];
            if nargin < 3; edges = [];
                if nargin<2; visited = 1;end
            end
        end
    end
    
    % Get current node (endpoint of last added edge)
    current_node = visited(end);
    % Get the costs of its edges
    potential_edges = A(:, current_node);
    % Filter 0 or Inf edges and return endpoint (index) of each feasible potential edge
    new_edges = find(potential_edges~=Inf & potential_edges~=0);
    % Check if endpoint of new potential edge is already in the mst
    new_edges = new_edges.*~ismember(new_edges,visited);
    % Delete all new edges whose endpoint is already in the mst
    new_edges = new_edges(new_edges~=0);
    
    % Add the new edges to the feasible edge list, where the feasible edges
    % satisfy that: startnode is in mst, endnode is not in mst
    for i=1:length(new_edges); edges = [edges; current_node, new_edges(i)];end
    
    % For the updated list of possible edges get their costs 
    costs = diag(A(edges(:,1)',edges(:,2)'));
    % Find the edge with minimum cost
    i = costs == min(costs);
    % Select that edge as the edge to add to the mst
    selected_edge = edges(i,:);
    
    % If there is more than one edge that satisfy that its cost is minimum
    % select the first of them
    if length(selected_edge(1,:))>1; selected_edge = selected_edge(1,:); end
    
    % Get the end node of the edge added to the mst
    next_node = selected_edge(1,2);
    % Delete from possible edges any edge whose endpoint whas the endpoint
    % of the selected edge
    i = edges(:,2)==next_node;
    edges(i,:)=[];
    
    % Update total cost and mst with new edge
    cost = cost+min(costs);
    mst = [mst;selected_edge];
    visited = [visited, next_node];
    
    % if the mst contains all tree nodes, return
    if length(visited) == length(A(1,:)); return
    % else keep look for next edge in a recursive manner
    else [mst,cost] = recursive_prim(A,visited, edges, mst, cost);
    end
end