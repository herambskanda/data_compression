clc
clear all
rng(354)
data = sin(2*(1:10))+sin(5*(1:10));
data = randi(10,1,500);
f_data = fft(data);
%f_data = f_data(1:10);
if_data = ifft(f_data); 

% sum1:n (f(n)*sin(x*n))
n = 1:length(data);
x = 1:0.01:length(n);
fun = data;
fun_sin = (2/length(n))*(fun(n) * sin(x'*n)');
size(fun_sin)
f_f = fun_sin'*(1:500);
f_f = data - f_f;
ff = f_f>0;
f_f(mod(find(ff == 0),length(fun_sin)),:)=[];

%plot(x,fun_sin)
%%
[lmao,sort_sin] = sort(fun_sin,"descend");
freeq = lmao(1:10);
%freeq = [freeq,lmao(end-4:end)];
fin_sin = sum(abs(floor(sin(n'*freeq))),2);
fin_sin = fin_sin';

%%
length(unique(data - round(fin_sin)))
pro_data = data-round(fin_sin);
%pro_data = pro_data + abs(min(pro_data))+1;
histogram(pro_data)
%histogram(data);

%clearvars -except pro_data data 