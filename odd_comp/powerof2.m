% clc
% 
% tic;
% rng(19);
% data = randi(6,1,10);
% data(1) = 2*ceil(data(1)/2);
% data = data + 2;
% 
% data = [4,3,5,3,6,5,5,4];
% 
% 
% %% COMPRESSION---------VOILA!!!!
% clc
% red = floor(data/2);
% redd = red;
% odd = mod(data,2);
% 
% a=zeros(1,length(redd));
% i=1;
% while i < length(redd)
%     a(i+1:end) = a(i+1:end)+(redd(1:end-i)>0) ;
%     redd(1:end-i) =redd(1:end-i) - (redd(1:end-i)>0);
%     i=i+1;
% end
% rem = redd;
% red = red + a;
% red(2:end)= red(2:end) + odd(1:end-1);
% rem(end) = rem(end) + odd(end);                     %save
% 
% comprsd = red;                                      %save
% key = find(odd==1,1);                               %save
%                                                   
%                                                     
% 
% %% DECOMPRESSION PHASE(I) even--------VOILA!!! 
% 
% 
% reb = comprsd;
% rebd = reb;
% rebb = reb;
% 
% a=zeros(1,length(reb));
% y = a;
% b=red;
% i=1;
% while i < length(reb)
%     b(i) = b(i)-a(i);
%     x = b(1:i)>0;
%     y(1:length(x)) = y(1:length(x)) + x;
%     b(1:i) = b(1:i) - x;
%     a(i+1) = a(i+1) + sum(x);
%     i = i+1;
% end
% 
% taken = a;
% given = y;
% bal = comprsd-given-taken;
% rem;
% 
% 
% 
% 
% % reb = comprsd;
% % rebd = reb;
% % rebb = reb;
% % 
% % a=zeros(1,length(reb));
% % y = a;
% % b=red;
% % r = b;
% % i=1;
% % g = a;
% % t = a;
% % while i <= length(reb)
% %     g(i) = r(i) - t(i);
% %     t(i+1) = sum((g(1:i)+(1:i)-(i+1))>0);
% %     i = i+1;
% % end
% % n = length(r);
% % while  sum((g(1:n)+(1:n)-(i+1))>0)>0
% %     t(i+1) = sum((g(1:n)+(1:n)-(i+1))>0);
% %     i =i+1;
% % end
% toc;
% 
% %% matrix
% 
% 
% % n = length(g);
% % n1 = length(t);
% % m = zeros(n,n1);
% % i = 1;
% % while i <= n
% %     if g(i) > 0
% %         m(i,(i+1:g(i)+i))= m(i,(i+1:g(i)+i)) + 1;
% %     end
% %     i=i+1;
% % end
% 
% 
% 
% %% 
% tic;
% 
% % remainder to be filled
% n = length(comprsd);
% tr= zeros(1,n);
% a = (rem);
% i=1;
% while i <= n
%     if a(i)>0
%         tr(1:a(i))= tr(1:a(i)) + 1;
%     end
%     i = i+1;
% end
% 
% % balance given to rem un-wanted
% gr= zeros(1,n);
% a = (b);
% i=1;
% while i <= n
%     if a(i)>0
%         gr(1:a(i))= gr(1:a(i)) + 1;
%     end
%     i = i+1;
% end
% toc;
% 
% 
% 
% % clc
% % clear all
% % %rng(19);
% % data = randi(6,1,10);%[8,6,3,3,4,5,8,7,2]; [8,4,7,8,8,8,6,5,3,5]
% % data(1) = 2*ceil(data(1)/2);
% % data = data + 2;
% % 
% % 
% % 
% % %% COMPRESSION---------VOILA!!!!
% % clc
% % red = floor(data/2);
% % redd = red;
% % odd = mod(data,2);
% % 
% % a=zeros(1,length(redd));
% % i=1;
% % while i < length(redd)
% %     a(i+1:end) = a(i+1:end)+(redd(1:end-i)>0) ;
% %     redd(1:end-i) =redd(1:end-i) - (redd(1:end-i)>0);
% %     i=i+1;
% % end
% % rem = redd;
% % red = red + a;
% % red(2:end)= red(2:end) + odd(1:end-1);
% % rem(end) = rem(end) + odd(end);                     %save
% % 
% % comprsd = red;                                      %save
% % key = find(odd==1,1);                               %save
% %                                                   
% %                                                     
% % 
% % %% DECOMPRESSION PHASE(I) even--------VOILA!!! 
% % 
% % reb = comprsd;
% % rebd = reb;
% % rebb = reb;
% % 
% % a=zeros(1,length(reb));
% % y = a;
% % b=red;
% % i=1;
% % while i < length(reb)
% %     b(i) = b(i)-a(i);
% %     x = b(1:i)>0;
% %     y(1:length(x)) = y(1:length(x)) + x;
% %     b(1:i) = b(1:i) - x;
% %     a(i+1) = a(i+1) + sum(x);
% %     i = i+1;
% % end
% % 
% % taken = a
% % given = y
% % bal = comprsd-given-taken;
% % rem
% % 
% % 
% % 
% % 
% % %% absorb values 
% % 
% % % huffy_hubby
% % d = data;
% % cmp = comprsd;
% % t = taken;
% % g = given;
% % o = odd;
% % b = bal;
% % rem;
% % 
% % %keyhole
% % 
% % 
% % 
% % % MATRIX init
% % %taken is sum of columns, given is sum of rows;
% % 
% % n = length(cmp);
% % m = zeros(n,n);
% % i = 1;
% % while i <= n
% %     if g(i) > 0
% %         m(i,(i+1:g(i)+i))= m(i,(i+1:g(i)+i)) + 1;
% %     end
% %     i=i+1;
% % end
% % 
% % 
% % %% filling balance gr
% % 
% % n = length(cmp);
% % % remainder to be filled
% % tr= zeros(1,n);
% % a = (rem);
% % i=1;
% % while i <= n
% %     if a(i)>0
% %         tr(1:a(i))= tr(1:a(i)) + 1;
% %     end
% %     i = i+1;
% % end
% % 
% % tr = nonzeros(tr)';
% % 
% % % balance given to rem un-wanted
% % gr= zeros(1,n);
% % a = (b);
% % i=1;
% % while i <= n
% %     if a(i)>0
% %         gr(1:a(i))= gr(1:a(i)) + 1;
% %     end
% %     i = i+1;
% % end
% % 
% % gr = nonzeros(gr)';
% % 
% % 
% % %% left-over stuff (or) first injection of odd numbers 
% % 
% % % filling tr from the balance =(cmp -(g+t))
% % tr1 = tr;
% % bal = b;
% % if sum(b)>0
% %     x = find(b>0);
% %     i=1;
% %     while i <= length(x)
% %         tr = nonzeros(tr);
% %         if b(x(i)) >= length(tr)
% %             tr = tr - 1;
% %             b(x(i)) = b(x(i)) - length(tr);
% %             
% %         else 
% %             tr(1:b(x(i))) = tr(1:b(x(i)))- 1;
% %             b(x(i)) = 0;
% %         end
% %         i=i+1;
% %     end
% % end
% % 
% % 
% % 
% % rem_g = bal - b;
% % g = g + rem_g;
% % 
% % 
% % % l = rem-b;
% % % o1 = zeros(1,n);
% % % 
% % % if l==1
% % %     x = find(l == 1,1);
% % %     g(x) = g(x)+ 1;
% % %     o1(x) = o1 + 1;
% % %     i = 1;
% % %     while x+i <= n
% % %         t(x+i) = t(x+i)+ 1;
% % %         o1(x+i) = o1(x+i)+ 1;
% % %         t(g(x+i)+(x+i)-1) = t(g(x+i)+(x+i)-1) - 1;
% % %         i= i+1;
% % %     end
% % %     t(x+i) = t(x+i) + 1;
% % %     o1(x+i) = o1(x+i)+ 1;
% % % end
% % % b = cmp - (t+g);
% % %     
% x = find(c<0,1,'last');
% p = n + x;
% 


%% first t-1,t+1 prolly wont use it



% t(p) = t(p)-1;
% y = g(1:end)+(1:length(g))-(p);
% p = find(y>=0,1);
% 
% %od = zeros(1,length(g));
% 
% % function that taken 1    
% 
% while p > key
%     
%     if p >key
%         g(p) = g(p)-1;
%         t(p) = t(p)+1;
%         p2 = p;
%         y = g(1:p-1)+(1:p-1)-p;
% 
%         if nonzeros(y==-1) == 1            
%             p = find(y==-1,1);            
%         elseif od(p-1)== 0
%             p = p-1;
%             g(p) = g(p)+1;
%             od(p) = od(p) + 1;
%             p = key;
%         else 
%             comment = -1
%         end
%     else 
%     end
%     
%     if p > key
%         g(p) = g(p) +1;
%         t(p) = t(p) -1;
%         p1 = p;
%         y = g(1:p-1)+ (1:p-1) -p;
%         p = find(y>=0,1);
%     elseif od(p2-1) == 0 
%         p = p2-1;
%         g(p) = g(p) +1;
%         od(p) = 1;
% %     else 
% %         p = p2;
% %         g(p) = g(p)+1;
% %         t(p) = t(p) -1;
%         
%                 
%     end
% end
% c(x) = c(x)+1;

%% 
 
% path= zeros(1,n);
% p = initial;
% path(1) = p;
% 
% i = 2;
% while p > key
%     y = g(1:p-1)+(1:p-1) - p;
%     p = find(y>=0,1);                       % for t = t-1
%     path(i) = p;
%     y = g(1:p-1)+(1:p-1) - p;
%     i=i+1;
%                                             % for t = t+1
%     if sum(y == -1)>0
%         p = find(y == -1,1,'last');
%         path(i) = p;
%     elseif od(p-1)==1
%         p = p-1;
%         path(i) = p;
%         od(p) = 1;
%         break
%     end
%     i=i+1;
% 
% end
tic;