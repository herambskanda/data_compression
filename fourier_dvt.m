clc 

rng(354);
data = randi(10,1,1000);
% n = length(data);
% nd = data(1);
% for i = 1:2:n
%     d = linspace(data(i),data(i+1),2);
%     nd = [nd,d(2:end)];
% end
% data = nd;
%dt = 1;
for j = 1:80
    n = length(data);
    x = 1:n;
    %data = sin(2*x*pi)+data;
    
    fhat = fft(data,n);
    psd = fhat.*conj(fhat)/n;
    %freq = 1/(dt*n)*(0:n);
    l = 1:floor(n/2);
    %plot(freq(length(psd)), psd);
    
    [~,index] = sort(psd,"descend");
    ind = zeros(1,n);
    ind(index(1:11)) = 1;
    fhat = fhat.*ind;
    ifhat = ifft(fhat);
    fd = data - floor(ifhat);
    data = fd;
end

h = histogram(fd);
[lmao , si] = sort(h.Values,"descend");

data = data + abs(min(data))+1;
clearvars -except data h 





% % domain
% L = length(data);
% N = L;
% dx = 1;
% x = 1:1:L;
% 
% % function
% f = data;

% % computing fourier
% CC = jet(20);
% A0 = sum(f.*ones(size(x)))*2*dx/L;
% fFs = A0/2;
% l_arr = 250;
% for k = 1:2000
% %k = 20;
%     A(k) = sum(f.*sin(pi*k*x/L))*dx*2/L;
%     B(k) = sum(f.*cos(pi*k*x/L))*dx*2/L;
%     fFs = fFs + A(k)*sin(k*pi*x/L) + B(k)*cos(k*pi*x/L);
%     arr = length( unique(data - round(fFs)));
%     
%     if arr < l_arr
%         l_arr = arr;
%         opti_k = k;
%     end
%     
% end
% 
% k = opti_k
% A(k) = sum(f.*sin(pi*k*x/L))*dx*2/L;
%     B(k) = sum(f.*cos(pi*k*x/L))*dx*2/L;
%     fFs = fFs + A(k)*sin(k*pi*x/L) + B(k)*cos(k*pi*x/L);
% 
% %plot(data), hold on 
% plot(fFs)
% 
% data = data - round(fFs);

