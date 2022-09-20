function [ x ] = Fset( x,board )


[m,n]=size(board);

%%%%%%%% set x2
for i=1:m
    for j=1:n
        if(board(i,j)==1000)
            x(2)=x(2)+1;
        end        
    end
end


%%%%%%%% set x3

for i=1:m
    for j=1:n
        if(board(i,j)==2000)
            x(3)=x(3)+1;
        end        
    end
end

%%%%%%% set x4
if(board(2,2)==1000)
      x(4)=x(4)+1;
end

%%%%% set x5
if(board(2,2)==2000)
      x(5)=x(5)+1;
end
%%%%%%%% set X6

  if(board(1,1)==1000)
      x(6)=x(6)+1;
  end  
  if(board(1,3)==1000)
      x(6)=x(6)+1; 
  end  
  if(board(3,1)==1000)
      x(6)=x(6)+1;
  end  
  if(board(3,3)==1000)
       x(6)=x(6)+1;
  end
  
 %%%%%%%% set X7
  
  if(board(1,1)==2000)
      x(7)=x(7)+1;
  end  
  if(board(1,3)==2000)
      x(7)=x(7)+1; 
  end  
  if(board(3,1)==2000)
      x(7)=x(7)+1;
  end  
  if(board(3,3)==2000)
       x(7)=x(7)+1;
  end





end

