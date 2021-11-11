clc
clear all 
%%
rng(7452);
random = rand(1,5);
k = random*10;
syms x y x2 y2
x1 = 0:0.01:10;
y1 = k'./x1 ;

%%
plot(x1,y1), hold on
axis([0 10 0 10])
a = 2.345;
fplot(@(x) 10*sin(a*x), [0,10])
%[Sx] = solve (x*10*sin(a*x)==k(1));

%%
w = 1;
while w<6
    dl = 1;
    d = 0;
    while dl < 10
        sol = vpasolve(x*10*sin(a*x)==k(w),x,[d dl]);
        d = d + 1;
        dl = dl + 1;
        f(dl,1:size(sol),w) = sol;    
    end
    w = w+1;
end

%%
% % g = f; 
% % sort(g,1);
% % q = 1;
% % r = 1;
% % h(r) = 0;
% % while q<11
% %     if g(q,1,r)> h(r)
% %         r = r+1;
% %         h(r) = g(q,1,r);
% %         
% %     else 
% %         q = q+1;
% %     end
% % end

%f2 = 2.8185574545649853641063905833413,1.305630495215094661661832278694,3.9409436114701210693581856022865,5.4130038734764032464553116725273,6.6864509325417428628100538128426;

% xf = 0:0.001:7;
% yf = sin(a.*f2)'*sin(xf.*f2);
% yfs = sum(yf,1);
% xfs = xf*1000;
% plot(yfs)

q = 1 ;
while 1<(size(k)+1)
    b(q,1:5) = k/q;
    q=q+1;
end
    
    



