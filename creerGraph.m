function [G] = creerGraph(L,k,l)

% L=[0 0 1 1 ; 1 0 0 1 ; 1 1 0 1;1 1 0 0 ];
[k,l]=size(L);

for i=1:k
    for j=1:l
        N(i,j)=i+k*(j-1);
    end
end
N=N';

G=ones(k*l,k*l)*inf;
for i=1:k*l;
   G(i,i)=0;
end



    
for i=1:k
    for j=1:l
        if L(i,j)==0
            if i~=1
                if L(i-1,j)==0;
                    G((N(i-1,j)),N(i,j))=1;
                end
            end
            if j~=1
                 if L(i,j-1)==0;
                     G(N(i,j-1),N(i,j))=1;
                 end
            end
            if i~=k
                if L(i+1,j)==0;
                    G(N(i+1,j),N(i,j))=1;
                end
            end
            if j~=l
                if L(i,j+1)==0;
                    G(N(i,j+1),N(i,j))=1;
                end
            end
        end
    end
end


end
 