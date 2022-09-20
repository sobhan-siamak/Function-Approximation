function [ pb ] = possible( board,pb )

[m,n]=size(board);

for i=1:m
    for j=1:n
        if(board(i,j)==0)
            pb(i,j)=1;
        end
    end
end



end

