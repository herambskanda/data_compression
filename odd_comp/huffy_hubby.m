clc
clear all
rng(19);
data = randi(6,1,10);%[8,6,3,3,4,5,8,7,2]; [8,4,7,8,8,8,6,5,3,5]
data(1) = 2*ceil(data(1)/2);
data = data + 2;



%% COMPRESSION---------VOILA!!!!
clc
red = floor(data/2);
redd = red;
odd = mod(data,2);

a=zeros(1,length(redd));
i=1;
while i < length(redd)
    a(i+1:end) = a(i+1:end)+(redd(1:end-i)>0) ;
    redd(1:end-i) =redd(1:end-i) - (redd(1:end-i)>0);
    i=i+1;
end
rem = redd;
red = red + a;
red(2:end)= red(2:end) + odd(1:end-1);
rem(end) = rem(end) + odd(end);                     %save

comprsd = red;                                      %save
key = find(odd==1,1);                               %save
                                                  
                                                    

%% DECOMPRESSION PHASE(I) even--------VOILA!!! 

reb = comprsd;
rebd = reb;
rebb = reb;

a=zeros(1,length(reb));
y = a;
b=red;
i=1;
while i < length(reb)
    b(i) = b(i)-a(i);
    x = b(1:i)>0;
    y(1:length(x)) = y(1:length(x)) + x;
    b(1:i) = b(1:i) - x;
    a(i+1) = a(i+1) + sum(x);
    i = i+1;
end

taken = a
given = y
bal = comprsd-given-taken;
rem



%% odd key hole







%% DECOMPRESSION PHASE(II) ODD(rem)!!! maybe in the last(not sure why? yet) 

 bgiven = given + rem;
 point = (bgiven+taken)- comprsd;
% btaken = taken;
% 
% if bgiven == 0
%     x = find(bgiven == 0);
%     bgiven(x(end)) = bgiven(x(end)) + 1;
%     if point(x(end)+1)>= 0 
%         
% end
% 
% if point == 1
%     x = find(point(1:end-1) == 1);
%     btaken(x+1) = btaken(x+1) + 1;
% end
% 
% %  bgiven(x(end)-1-btaken(x(end)-1))=bgiven(x(end)-1-btaken(x(end)-1)) -1;
% %     btaken(x(end)-1) = btaken(x(end)-1) - 1;
% 
% 
% if point == or(0,1)
%     proceed = true;
% else
%     proceed = false;
% end
% while proceed == 0
%     point = (bgiven+btaken)- comprsd;   
%     x = find(point == -2);
%     
%     if point(x(end)-1) <= 0 
%         bgiven((x(end))-1) = bgiven((x(end))-1) + 1 ;
%         btaken(x(end)) = btaken(x(end)) + 1;
%         
%     elseif point(x(end)-1) == 
%         btaken(x(end)) =btaken(x(end))+ 1;
%     end
%     
%     
%     point = (bgiven+btaken)- comprsd;
%     
%     if point == or(0,1)
%         proceed = true;
%     else
%         proceed = false;
% 
%     end
% end    
    
    




% if taken+bgiven == red+balb
%     proceed=true;
% else 
%     proceed=false;
% end



c = comprsd ;


% bal = red-(even_data + rem);
% reba = bal +reba;
% ataken = reba;
% btaken = ataken;
%                                    
% balb = bal(2:end);
% balb(end+1) = bal(1);
% bgiven = bgiven + balb;





%% DECOMPRESS PHASE(III) KEY-HOLE

% i=key;
% test = zeros(1,length(red));
% test(i) = 1;
% bgiven(i) = bgiven(i)+1;
% btaken(i+1) = btaken(i+1) + 1;
% i=i+1;
% while i < length(red)-length(nonzeros(rem))
%     
%     if (i+bgiven(i)) <= length(red)-length(nonzeros(rem))
%         btaken(i+1) = btaken(i+1) + 1;
%         btaken(i+bgiven(i)) = btaken(i+bgiven(i)) - 1;
%         test(i)=1;
%         i = i + 1;
%     else
%         bgiven(i) = bgiven(i) - 1;
%         bgiven(i+1) = bgiven(i+1) + 1;
%         test(i)=0;
%         i = i + 1;
%     end    
% 
% end






    


 



