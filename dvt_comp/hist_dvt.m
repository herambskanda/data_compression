clc
f
for j = 1:2
    data = pro_data;
    
    thresh = 2;
    shift = min(data) - 1;
    data = data + thresh;
    thresh = thresh + shift;
    n = length(unique(data));
    % least = 10;
    % least_arr = zeros(1,n);
    tic;
    h = histogram(data)
    
    [lmao,sort_hi] = sort((h.Values),"descend");
    %sort_hi = sort_hi(1:n) ;
    arr(sort_hi) = (0:length(sort_hi)-1);
    
    dvt = arr;
    base_data = dvt(data-thresh);
    td = max((data - base_data), 0) ;
    top_data = zeros(1,length(td));
    n = length(td);
    
    for i = 1:1:n
        end_lim = min(i+td(i),n);
        top_data(i+1:end_lim) =  top_data(i+1:end_lim) + 1;
    end
    compressed = top_data+base_data;
    l = length(unique(compressed));
    pro_data = compressed;
    
end
toc;
%% decompress
tic;
[lmao, dvt2] = sort(dvt);

dd = compressed + 1;
db = compressed;
n = length(dd);

dvt2 = dvt2 +thresh;
to = zeros(1,n);
for i = 1:n
    x = dvt2(db(i) + 1);
    y = x - db(i);    
    if y>0
        db(i+1:min(i+y,n)) = db(i+1:min(i+y,n)) - 1;        
    end
end

decompressed = dvt2(db+1);
toc;
decompressed - data;