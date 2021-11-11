clc, close all, clear all
%initial array gotta change it to input 'img' type later!!

rng(7459);
arr = randi([-126,126],1024,1);
a = arr(1:25);
n = numel(a);
ty = .001;
t = 1:n;
i = sqrt(-1);
dt = 0:ty:1-ty; 

%radius change along arr_initialized!!

slope = a(2:n)-a(1:n-1);
A = repmat(a(1:n-1),1,1/ty);
dum_rad = A + (dt.*slope);
d_rad = reshape(dum_rad',[1,numel(dum_rad)]);
rad = d_rad;
size(rad)

time = 1:ty:n-ty;
e = exp(((-2*pi*time)+(pi/2))*i);
epc = (rad.*e);

epc_p = imag(epc)  ;
abs(epc);



plot(time,epc_p),hold on
plot(a,'r.')

%OUT OUT EPC_P;
%FINALLY THIS CRAP IS DONE!!!