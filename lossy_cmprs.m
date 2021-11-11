clc
clear all
rng(10);
data = randi(10,1,9);

red = floor(data/2);
redd = red;
rem = red;


%% COMPRESSION---------VOILA!!!!

a=zeros(1,length(redd));
i=1;
while i < length(redd)
    a(i+1:end) = a(i+1:end)+(redd(1:end-i)>0) ;
    redd(1:end-i) =redd(1:end-i) - (redd(1:end-i)>0);
    i=i+1;
end
rem = redd;
red = red + a;

comprsd = red;


