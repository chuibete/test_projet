function [chemin, distance] = dijkstra(depart,arrivee, G,L)
% L'algorithme de Dijkstra, mis en oeuvre par Yi Wang en 2005.

% L=[0 0 1 1 ; 1 0 0 1 ; 1 1 0 1;1 1 0 0 ];
% [k,l]=size(L);
% G = creerGraph(L);
% depart=1 ; 
% arrivee=k*l ; 

% On s'assure que la matrice est carrée

if ( size(G,1) ~= size(G,2) )
  error( 'detect_cycles:Dijkstra_SC', ...
         'transmat has different width and heights' );
end



noOfNode = size(G, 1);

for i = 1:noOfNode
  parent(i) = 0;
  distance(i) = Inf;
end

queue = [];


% Start from 'entrée'

for i=1:noOfNode
  if G(1, i)~=Inf
    distance(i) = G(1, i);
    parent(i)   = 1;
    queue       = [queue i];
  end
end



% Width-first exploring the whole graph

while length(queue) ~= 0
  
  hopS  = queue(1);
  queue = queue(2:end);
  
  for hopE = 1:noOfNode
    if distance(hopE) > distance(hopS) + G(hopS,hopE)
      distance(hopE) = distance(hopS) + G(hopS,hopE);
      parent(hopE)   = hopS;
      queue          = [queue hopE];
    end
  end
  
end


% Back-trace the shortest-path

chemin = [arrivee];    
i = parent(arrivee);


while i~=depart && i~=0
  chemin = [i chemin];
  i      = parent(i);
end

if i==depart
  chemin = [i chemin];
else
  chemin = []
end
  

% Return cost

distance = distance(arrivee);


fprintf('Le chemin est:');
disp(chemin);
fprintf('La distance est:');
disp(distance);
end 
