function [ board,pb ] = boardset( board,B,turn,pb)

 if(turn==1)
       if(B==1 && pb(1,1)==1)
           board(1,1)=1000;
           pb(1,1)=0;
       end
       if(B==2 && pb(1,2)==1)
           board(1,2)=1000;
           pb(1,2)=0;
       end
       if(B==3 && pb(1,3)==1)
           board(1,3)=1000;
           pb(1,3)=0;
       end
       if(B==4 && pb(2,1)==1)
           board(2,1)=1000;
           pb(2,1)=0;
       end
       if(B==5 && pb(2,2)==1)
           board(2,2)=1000;
           pb(2,2)=0;
       end
       if(B==6 && pb(2,3)==1)
           board(2,3)=1000;
           pb(2,3)=0;
       end
       if(B==7 && pb(3,1)==1)
           board(3,1)=1000;
           pb(3,1)=0;
       end
       if(B==8 && pb(3,2)==1)
           board(3,2)=1000;
           pb(3,2)=0;
       end
       if(B==9 && pb(3,3)==1)
           board(3,3)=1000;
           pb(3,3)=0;
       end   
             
 end
 
 if(turn==2)
       if(B==1 && pb(1,1)==1)
           board(1,1)=2000;
           pb(1,1)=0;
       end
       if(B==2 && pb(1,2)==1)
           board(1,2)=2000;
           pb(1,2)=0;
       end
       if(B==3 && pb(1,3)==1)
           board(1,3)=2000;
           pb(1,3)=0;
       end
       if(B==4 && pb(2,1)==1)
           board(2,1)=2000;
           pb(2,1)=0;
       end
       if(B==5 && pb(2,2)==1)
           board(2,2)=2000;
           pb(2,2)=0;
       end
       if(B==6 && pb(2,3)==1)
           board(2,3)=2000;
           pb(2,3)=0;
       end
       if(B==7 && pb(3,1)==1)
           board(3,1)=2000;
           pb(3,1)=0;
       end
       if(B==8 && pb(3,2)==1)
           board(3,2)=2000;
           pb(3,2)=0;
       end
       if(B==9 && pb(3,3)==1)
           board(3,3)=2000;
           pb(3,3)=0;
       end   
             
 end


end

