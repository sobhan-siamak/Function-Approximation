function [ a,b ] = maxim( v )

  [m,n]=size(v);
  ma=v(1,1);
  a=1;
  b=1;
  for i=1:m
      for j=1:n
         if(v(i,j)>ma)
             ma=v(i,j);
             a=i;
             b=j;
         end
      end
  end



end

