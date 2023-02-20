function [distance, previous] = dijkstra(G,source) 
%% Dijkstra algortim
%{
    G - structure
        G{i} - node
            node.neighbours
%}

N = height(G.Nodes) % Number of nodes
E = [G.Edges.EndNodes G.Edges.Weight];
% E ( en1 en2 w12 )

%% Initialization
distance = zeros(N,1);
previous = zeros(N,1);
nonesearched = ones(N,1);
for i = 1:N
   distance(i) = inf;   
end

distance(source) = 0;

while any(nonesearched)
    i_ = find(nonesearched);
    left_dist = distance(i_);
    [~, ii] = min(left_dist);
    ii = ii(1);
    i = i_(ii);
    for j = neighbors(G,i)'
        ei = findedge(G,i,j);
        if distance(j ) > distance(i) + G.Edges.Weight(ei)
            distance(j) = distance(i) + G.Edges.Weight(ei)
            previous(j) = i;
        end
    end
    nonesearched(i) = 0;
    
   
end

end





