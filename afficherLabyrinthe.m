function [] = afficherLabyrinthe(L,chemin)

[k,l] = size(L);
N=k+1;
L = rot90(L,3);

G=zeros(N);
[r,c]=meshgrid(1:size(G,2),1:size(G,1));
figure;
hold on
line(r,c,'color','k');
line(c,r,'color','k');
fill(1,1,'black');
axis square
title('Le chemin le plus court est:')

 for i=1:k
    for j=1:l
        if L(i,j)==1
            verts=[i j+1;i j ; i+1 j; i+1 j+1 ];
            faces=[1 2 3; 1 4 3];
            p = patch('Faces',faces,'Vertices',verts,'FaceColor','b');
            set(p,'FaceColor','k')
         end
    end    
    
 end
 
 
 if isempty(chemin)
     h = msgbox('Aucun Chemin Existant !','Try Again !','warn');
 else
     for i=1:k
         for j=1:l
             if ~isempty(find(chemin==(i+k*(j-1))))==1;
                 verts=[i j;i j+1 ; i+1 j; i+1 j+1 ];
                 faces=[1 2 4; 1 3 4];
                 p = patch('Faces',faces,'Vertices',verts,'FaceColor','r');
                 set(p,'EdgeColor','r','FaceColor','r')
             end
         end
     end
 end
 
end


 
 