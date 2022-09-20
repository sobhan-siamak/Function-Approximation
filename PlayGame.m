


%%%%%%%%%%%%%%%%%%%%@cope by sobhan siamak%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
alpha=0.01;%%%%% alpha is learning rate
wxflag=0;%%%%%% wxflag is the flag of X'player for win
woflag=0;%%%%%% woflag is the flag of O'player for win
%% Check for empty places on board
pb=possible(board,pb);
%% select best features  from the board
x=zeros(7,1);
%wx=zeros(7,1);
wx=rand(7,1);
%wo=zeros(7,1);
wo=rand(7,1);

v=zeros(3,3);%%%% this v is for calc max vi's
vp=zeros(1,2);%%%%% vp=[vst,vst+1]



x(1)=1;%%%%% because coef of w0 is 1

%% start the game

disp('start a new game : press 1 to let you be player 1, or 2 to let you be player 2');
disp('###############################');
A=input('please enter your number: ');
%  A=input('please enter your number :   ','s');
if(A==1)%%%%%% means you are the first player and computer is the second
        %%%%%% You=X=1000  and Computer=O=2000 
        turn=1;
        k=1;
        for i=1:3
            for j=1:3
                board(i,j)=k;
                k=k+1;
            end
        end
        disp('initial blank board');
        disp(board);
        
        for t=1:9
               if(t==1 || t==3 || t==5 || t==7 || t==9 )
                    B=input('Your Turn.....Enter the position from 1-9 as specified: ');
                    [board,pb]=boardset( board,B,turn,pb);
                    disp(board);
               else
                    disp('computer''s turn..');
                    btemp=board;
                    for i=1:3
                        for j=1:3
                            if(pb(i,j)==1)
                                btemp(i,j)=2000;
                                Xnext=Fset(x,btemp);
                                v(i,j)=wo'*Xnext;
                                btemp=board;                            
                            end                             

                        end    
                    end
                    [a1,b1]=maxim(v);
                    vp(1,2)=v(a1,b1);
                    board(a1,b1)=2000;
                    pb(a1,b1)=0;                
                   
                 %%%%%%% Wo
                    for i=1:7
                        wo(i)=wo(i)+(alpha*(vp(1,2)-vp(1,1))*Xnext(i));
                    end
                   
                    vp(1,1)=vp(1,2); 
                    disp(board);                   
                   
                    
               end%%%%% end of turn if
                
                 %%%%%%check Rwin, Cwin or Dwin
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
                      
                    
                      
                      %%%%%%%% check winner
                      if(wxflag==1)
                          break;
                      end
                      if(woflag==1)
                          break;
                      end     
                        
               
                
        end%%%% end of turn for
        
        if(wxflag==1)
            disp('The winner is you X Player.');
            disp(board);
        end
        if(woflag==1)
            disp('The winner is Computer O Player.');
            disp(board);
        end
        if(wxflag==0 && woflag==0)
            disp('nobody win and Tie situation');
            disp(board);
        end

end

if(A==2)%%%%%% means you are the second player and computer is the first
       %%%%%% You=O=2000  and Computer=X=1000
        turn=2;
        k=1;
        for i=1:3
            for j=1:3
                board(i,j)=k;
                k=k+1;
            end
        end
        disp('initial blank board');
        disp(board);
        for t=1:9
               if(t==2 || t==4 || t==6 || t==8)
                   B=input('Your Turn.....Enter the position from 1-9 as specified: ');
                   [board,pb]=boardset( board,B,turn,pb);
                   disp(board);
               else
                   disp('computer''s turn..');
                    btemp=board;
                    for i=1:3
                        for j=1:3
                            if(pb(i,j)==1)
                                btemp(i,j)=1000;
                                Xnext=Fset(x,btemp);
                                v(i,j)=wx'*Xnext;
                                btemp=board;                            
                            end                             

                        end    
                    end
                    [a1,b1]=maxim(v);
                    vp(1,2)=v(a1,b1);
                    board(a1,b1)=1000;
                    pb(a1,b1)=0; 
                    
                    
                    
                    %%%%%%% Wx
                    for i=1:7
                        wx(i)=wx(i)+(alpha*(vp(1,2)-vp(1,1))*Xnext(i));
                    end
                   
                    vp(1,1)=vp(1,2); 
                    disp(board); 
                   
               end%%%%%% end of turn if
               
               %%%%%%check Rwin, Cwin or Dwin
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
                      
                    
                      
                      %%%%%%%% check winner
                      if(wxflag==1)
                          break;
                      end
                      if(woflag==1)
                          break;
                      end     
               
        end%%%%%%% end of turn for and game
        
        
        
        if(wxflag==1)
            disp('The winner is Computer X Player.');
            disp(board);
        end
        if(woflag==1)
            disp('The winner is You O Player.');
            disp(board);
        end
        if(wxflag==0 && woflag==0)
            disp('nobody win and Tie situation');
            disp(board);
        end

        
        
    
end

