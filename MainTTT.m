


%%%%%%%%%%%%%%%%%%%% @cope by sobhan siamak %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% This program is the function approximation on tic-toc-toy game
%%%%% In this program we should find the best features and have weigths 


clc;
clear;
close all;


%% Definition Board and players


%%%%% player X is 1000
%%%%% player O is 2000
%%%%% x0=1
%%%%% x1 is the number of X's
%%%%% x2 is the number of O's
%%%%% x3 is the X player in the center
%%%%% x4 is the O player in the center
%%%%% x5 is the number of X players in the corner
%%%%% x6 is the number of O players in the corner
%%%%% V = w0 + w1*x1 + w2*x2 + w3*x3 + w4*x4 + w5*x5 + w6*x6



%%  Create an empty board
board=zeros(3,3);
pb=zeros(3,3);%%%%%%possibility
turn=randi([1,2]);%%%%%% turn is var of the first player turn=1===>1000 turn=2===>2000
alpha=0.01;%%%%% alpha is learning rate
wxflag=0;%%%%%% wxflag is the flag of X'player for win
woflag=0;%%%%%% woflag is the flag of O'player for win

%% Check for empty places on board
pb=possible(board,pb);

%% First Move is Random

a=randi([1,3]);
b=randi([1,3]);
if(turn==1)
  if(pb(a,b)==1)
      board(a,b)=1000;
      pb(a,b)=0;
  end
else
    if(pb(a,b)==1)
      board(a,b)=2000;
      pb(a,b)=0;
      
    end
end
disp('The Player X is 1000');
disp('The Player O is 2000');
disp('**********************');
disp('First Move is Random:');
disp(board);

%% Change the turn because first turn is random
if(turn==1)
    turn=2;
else
    turn=1;
end
%% select best features  from the board
x=zeros(7,1);
%wx=zeros(7,1);
wx=rand(7,1);
%wo=zeros(7,1);
wo=rand(7,1);

v=zeros(3,3);%%%% this v is for calc max vi's
vp=zeros(1,2);%%%%% vp=[vst,vst+1]

x(1)=1;%%%%% because coef of w0 is 1

for t=1:9  %%%%%%% start of game


        btemp=board;
        for i=1:3
            for j=1:3
                if(pb(i,j)==1 && turn==1)
                    btemp(i,j)=1000;
                    Xnext=Fset(x,btemp);
                    v(i,j)=wx'*Xnext;
                    btemp=board;
                else if(pb(i,j)==1 && turn==2)
                        btemp(i,j)=2000;
                        Xnext=Fset(x,btemp);
                        v(i,j)=wo'*Xnext;
                        btemp=board;             
                    end
                end                             

            end    
        end

      [a1,b1]=maxim(v);
      vp(1,2)=v(a1,b1);
      if(turn==1)
          board(a1,b1)=1000;
          pb(a1,b1)=0;
      end
      if(turn==2)
          board(a1,b1)=2000;
          pb(a1,b1)=0;
      end
      
      %%%%%%Rwin
      for i=1:3
          if(board(i,1)==1000 && board(i,2)==1000 && board(i,3)==1000)
              wxflag=1;
          end
          
          if(board(i,1)==2000 && board(i,2)==2000 && board(i,3)==2000)
              woflag=1;
          end
      end
                
                
      %%%%%%Cwin
       for i=1:3
           if(board(1,i)==1000 && board(2,i)==1000 && board(3,i)==1000)
               wxflag=1;
           end
           
           if(board(1,i)==2000 && board(2,i)==2000 && board(3,i)==2000)
               woflag=1;
           end   
           
       end               
      
      %%%%%%Dwin
      if(board(1,1)==1000 && board(2,2)==1000 && board(3,3)==1000)
          wxflag=1;
      end
      if(board(1,1)==2000 && board(2,2)==2000 && board(3,3)==2000)
          woflag=1;
      end
      if(board(1,3)==1000 && board(2,2)==1000 && board(3,1)==1000)
          wxflag=1;
      end
      if(board(1,3)==2000 && board(2,2)==2000 && board(3,1)==2000)
          woflag=1;
      end    
      
      
%%%%% update weigths with Gradient descent
   
 %%%%%%% Wx
          
        for i=1:7
            wx(i)=wx(i)+alpha*(vp(1,2)-vp(1,1))*Xnext(i);
        end 
         

 %%%%%%%Wo
        for i=1:7
            wo(i)=wo(i)+(alpha*(vp(1,2)-vp(1,1))*Xnext(i));
        end
      
%%%%%%%Finaly Change the turn
      if(turn==1)
          disp('Player x turn:');
          turn=2;
      else
          disp('Player O turn:');
          turn=1;
      end
      
      disp(board);
      
%%%%%%%% check winner
      if(wxflag==1)
          break;
      end
      if(woflag==1)
          break;
      end     
      
      
      vp(1,1)=vp(1,2);
end %%%%%% end of turn for and game 


%%%%% Finally check the winner
if(wxflag==1)
    disp('The winner is Player X.');
    disp(board);
end
if(woflag==1)
    disp('The winner is Player O.');
    disp(board);
end
if(wxflag==0 && woflag==0)
    disp('nobody win and Tie situation');
    disp(board);
end




