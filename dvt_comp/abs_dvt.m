clc

rng(965); 
data = randi(10,1,20);

thresh = 2;
data = data + thresh;


dvt = randperm(10)-1;
good_dvt = [9,8,7,6,0,1,2,3,4,5];
dvt = good_dvt;

base_data = dvt(data-thresh);

td = (data - base_data) ;
sign = td>0;
sign = sign*2 -1;
top_data = zeros(1,length(td));
n = length(td);

for i = 1:1:n
    end_lim = min(i+abs(td(i)),n);
    top_data(i+1:end_lim) =  top_data(i+1:end_lim) + sign(i);
end
compressed = top_data+base_data;
h_comp = histogram(compressed);
[lmao,sort_hist] = sort(nonzeros(h_comp.Values)');

uni_com = unique(compressed);

n = length(sort_hist) - 4;
for i = 1:n
    tbc = find(compressed == uni_com(sort_hist(i)));
    top_data(tbc)
    base_data(tbc)
    avg_data = (top_data(tbc)+base_data(tbc))/2




end











