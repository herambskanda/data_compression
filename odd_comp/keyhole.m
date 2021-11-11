clc

data = [8,4,7,8,8,8,6,5,3,5];

%% compression!!
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

cmp = red;                                          %save
key = find(odd==1,1);                               %save

% remainder flatten and added for balance given

n = length(cmp);
tr= zeros(1,n);
a = (rem);
i=1;
while i <= n
    if a(i)>0
        tr(1:a(i))= tr(1:a(i)) + 1;
    end
    i = i+1;
end 
tr = nonzeros(tr);


%% decompression (1) huge matrix!!

reb = cmp;
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

t = a;
g = y;
b = cmp-g-t;
rem;

% MATRIX init
%taken is sum of columns, given is sum of rows;

n = length(cmp);
m = zeros(n,n);
i = 1;
while i <= n
    if g(i) > 0
        m(i,(i+1:g(i)+i))= m(i,(i+1:g(i)+i)) + 1;
    end
    i=i+1;
end



%% remainder balancing first injection of odd numbers!!




















