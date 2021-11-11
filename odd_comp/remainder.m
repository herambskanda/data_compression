clc
clear all

rng(19);
od = 1;
qwe = 1;
%while d == 1 || con == 1
     data = randi(6,1,15);
     data(1) = 2*ceil(data(1)/2);
     data = data + 2;
    %data = [8,3,4,4,8,3,6,6,6,8,3,7,6,7,4];
     data = [4,5,5,3,5,3,6];%,3,6,7,4,5,6,3,5];
    %  data = [4,5,5,8,6,7,4,3,5,7,8,8,6,7,4,7,7,4,7,8,7,8,3,4,8,3,4,7,4,7,5,3,7,3,3,7,4,6,7,7,3,4,5,3,3,5,7,5,8,6,7,5,5,4,6,6,5,7,7,3,7,5,3,4,4,6,6,3,6,5,3,6,7,4,3,8,4,4,4,8,5,8,7,3,7,6,3,4,8,5,8,3,7,6,8,6,7,8,3,6];


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
    
    taken = a;
    given = y;
    bal = comprsd-given-taken;
    b = bal;
    cmp = comprsd;
    rem;
    t = taken;
    g = given;

    % no more balance everything perfectly even filled!!
    a=zeros(1,length(reb));
    i = 1;
    while sum(bal>0)>0
        x = sum(bal > 0);
        g = g + (bal>0);
        bal = bal -1;
        a(i) = x;
        i = i+1;
    end
    t = [t,nonzeros(a)'];

    % tr required excess of given in taken
    n = length(cmp);
    tr= zeros(1,n);
    r = (rem);
    i=1;
    while i <= n
        if r(i)>0
            tr(1:r(i))= tr(1:r(i)) + 1;
        end
        i = i+1;
    end 
   
    
    
    
    

od = zeros(1,length(g));

    %% odd (a approach rem)
    
    % goal g == 0 shouldnt exist
p = find(g == 0 , 1)
while isempty(p) == 0
    
    
   path= zeros(1,n);
    path(1) = p;

    i = 2;
    while p > key || isempty(p)==0 % back track loop (1!)
        y = g(1:p-1)+(1:p-1) - p;
        dum = find(y==0);               
        p = dum(find(find(y==0)>key,1)); 
        if isempty(p) == 1 && length(path)>=2
           break
        elseif isempty(p) == 1 && length(path)<2
           % LATER

            break
        end

        if p <= key                            %not required here

            break

        end
        path(i) = p;
        i=i+1;
                                           % after t = t+1, g = g -1
        y = g(1:p-1)+(1:p-1) - p;
        if find(y == -1,1,'last') > key 
            p = find(y == -1,1,'last');
            path(i) = p;
        elseif od(p-1)==0 && p-1 >= key
            p = p-1;
            path(i) = p;
            od(p) = 1;

            break
        elseif od(p-1) == 1                      %not required here

            break 

        end
        i=i+1;
    end
    qwe=nonzeros(path)'
    d = od(qwe(end))
    key

    % crawl algorithm
    path = nonzeros(path)';
    if sum((g(path(2:2:end))-od(path(2:2:end)))==1) > 0
        od(path(end))= 0;
        s = find((g(path(2:2:end))-od(path(2:2:end)))==1,1);
        p = (s-1)*2;
        path(p+1) = path(p) - 1;
        path(p+2:end) = 0;
        path = nonzeros(path)';
        od(path(end)) = 1;
        d = od(path(end));
        preceed = 1
    elseif sum((g(path(2:2:end))-od(path(2:2:end)))==1) == 0
        preceed = 2
    end

    if d == 0 
        s = find(path(2:2:end) > key,1,'last');
        p = s*2;
        path(p+1) = path(p) -1;
        
        path(p+2:end) = 0;
        
        path = nonzeros(path)';
        od(path(end)) = 1;
        d = od(path(end));
        proceed = 1
    elseif d == 1 
        proceed = 2
    end

    % forward from t-1,g+1
    p = path(1) + 1;
    pathf = zeros(1,n);

    pathf(1) = p;
    i =2;
    while p<= n && proceed >= 1 % forward loop 
        % t+1, g-1
        if p <= length(t)
            p = g(p)+p;
            pathf(i) = p;
        else
            com = 1;
        end
        % t-1, g+1
        if p <= length(g)
            p = g(p)+p+1;
            pathf(i+1) = p;
            i = i+1;
        else
            com = 2;
        end

    end

    pathf = (nonzeros(pathf))';
    
    % action for path 
    g(path(1:2:end-1)) = g(path(1:2:end-1))+1;
    t(path(1:2:end-1)) = t(path(1:2:end-1))-1;
    g(path(2:2:end-1)) = g(path(2:2:end-1))-1;
    t(path(2:2:end-1)) = t(path(2:2:end-1))+1;
    if od(path(end)) == 1
        g(path(end)) = g(path(end))+1;
    else 
        action = -1 
    end
    % action for pathf
    g(pathf(1:2:end-1)) = g(pathf(1:2:end-1))-1;
    t(pathf(1:2:end-1)) = t(pathf(1:2:end-1))+1;
    g(pathf(2:2:end-1)) = g(pathf(2:2:end-1))+1;
    t(pathf(2:2:end-1)) = t(pathf(2:2:end-1))-1;
    if mod(length(pathf),2) == 1
        if pathf(end)> length(t)
            t(pathf(end)) = 1;
        else 
            t(pathf(end)) = t(pathf(end))+1;
        end
    elseif mod(length(pathf),2) == 0
        if pathf(end)> length(t)
            t(pathf(end)) = -1;
        else 
            t(pathf(end)) = t(pathf(end))-1;
        end
        
    end
    
    p = find(g == 0 , 1)
    
end   
    
g+t(1:n)-od - cmp




%% tr == t;
y = tr(1:length(t)-n) - t(n+1:end);
s = find(y == -1,1, 'last');
while isempty(s) == 0
    
    p = n+s;
    path= zeros(1,n);
        path(1) = p;
        y = g(1:end) + (1:n) - p;
        p = find(y == 0,1)
        path(2) = p;
        i = 3;
        %path for g-1,t+1
        while p > key || isempty(p)==0
            y = g(1:p-1)+(1:p-1) - p;
            if find(y == -1,1,'last') > key 
                p = find(y == -1,1,'last');
                path(i) = p;
            elseif od(p-1)==0 && p-1 >= key
                p = p-1;
                path(i) = p;
                od(p) = 1;

                break
            else                      

                break
            end
            i = i+1;    


            y = g(1:p-1)+(1:p-1) - p;
            dum = find(y==0);               
            p = dum(find(find(y==0)>key,1)); 
            if isempty(p) == 1
                break
            end

            if p <= key                            

                break

            end
            path(i) = p;
            i=i+1;

        end

        % crawl algorithm
        path = nonzeros(path)'
        d = od(path(end));
        
    if sum((g(path(2:2:end))-od(path(2:2:end)))==1) > 0
        od(path(end))= 0;
        s = find((g(path(2:2:end))-od(path(2:2:end)))==1,1);
        p = (s-1)*2;
        path(p+1) = path(p) - 1;
        path(p+2:end) = 0;
        path = nonzeros(path)'
        od(path(end)) = 1;
        d = od(path(end));
        preceed = 1
    elseif sum((g(path(2:2:end))-od(path(2:2:end)))==1) == 0
        preceed = 2
    end

    if d == 0 
        s = find(path(2:2:end) > key,1,'last');
        p = s*2;
        path(p+1) = path(p) -1;
        
        path(p+2:end) = 0;
        
        path = nonzeros(path)'
        od(path(end)) = 1;
        d = od(path(end));
        proceed = 1
    elseif d == 1 
        proceed = 2
    end


        t(path(1)) = t(path(1)) -1;
        g(path(2:2:end-1)) = g(path(2:2:end-1))-1;
        t(path(2:2:end-1)) = t(path(2:2:end-1))+1;
        g(path(3:2:end-1)) = g(path(3:2:end-1))+1;
        t(path(3:2:end-1)) = t(path(3:2:end-1))-1;
        if od(path(end)) == 1
            g(path(end)) = g(path(end))+1;
        else 
            action = -1 
        end
    y = tr(1:length(t)-n) - t(n+1:end);
    s = find(y == -1,1, 'last');
        
end
%     while p > key || isempty(p)==0 % back track loop (1!)
%         y = g(1:p-1)+(1:p-1) - p;
%         dum = find(y==0);               
%         p = dum(find(find(y==0)>key,1)); 
%         if isempty(p) == 1 && length(path)>=2
%            break
%         elseif isempty(p) == 1 && length(path)<2
%            % LATER
% 
%             break
%         end
% 
%         if p <= key                            %not required here
% 
%             break
% 
%         end
%         path(i) = p;
%         i=i+1;
%                                            % after t = t+1, g = g -1
%         y = g(1:p-1)+(1:p-1) - p;
%         if find(y == -1,1,'last') > key 
%             p = find(y == -1,1,'last');
%             path(i) = p;
%         elseif od(p-1)==0 && p-1 >= key
%             p = p-1;
%             path(i) = p;
%             od(p) = 1;
% 
%             break
%         elseif od(p-1) == 1                      %not required here
% 
%             break 
% 
%         end
%         i=i+1;
%     end
    
%         if sum((g(path(3:2:end))-od(path(3:2:end)))==1) > 0
%             od(path(end))= 0;
%             s = find((g(path(3:2:end))-od(path(3:2:end)))==1,1);
%             p = (s)*2
%             path(p+1) = path(p) - 1;
%             path(p+2:end) = 0;
%             path = nonzeros(path)'
%             od(path(end)) = 1;
%             d = od(path(end));
%             preceed = 1
%         elseif sum((g(path(3:2:end))-od(path(3:2:end)))==1) == 0
% 
%             preceed = 2
%         end
% 
%         if d == 0 
%             s = find(path(3:2:end) > key,1,'last');
%             p = s*2+1;
%             path(p+1) = path(p) -1;
% 
%             path(p+2:end) = 0;
% 
%             path = nonzeros(path)';
%             od(path(end)) = 1;
%             d = od(path(end));
%             proceed = 1
%         elseif d == 1 
%             proceed = 2
%         end

    
    %path for g-1,t+1
  

% forward from t+1, g-1 mostly wont even need it


    
    
    
    

