clc

rng(36349);
data = randi(10,1,50);

thresh = 3;
data = data + thresh;
dvt_arr = [0,1,2,3,4,5,6,7,8,9];
dvt_x = perms(dvt_arr);
n = length(dvt_x);
least = 10;
least_arr = zeros(1,n);
tic;
for i = 1:n
    dvt = dvt_x(i,:);
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
    l = length(unique(compressed));
    least_arr(i) = l;
    if l < least
        least = l;
    end
end
toc;
%% decompress
tic;
[lmao, dvt2] = sort(dvt);

dd = compressed + 1;
db = compressed;
n = length(dd);
y1 = [];
dvt2 = dvt2 +thresh;
to = zeros(1,n);
for i = 1:n
    x = dvt2(db(i) + 1);
    y = x - db(i);   
    sgn = (y>0)*2-1;
    y = abs(y);
    if y ~= 0
        db(i+1:min(i+y,n)) = db(i+1:min(i+y,n)) - sgn; 
%     else if y<0
%         y = abs(y);
%         db(i+1:min(i+y,n)) = db(i+1:min(i+y,n)) + 1;
%     end
    end
end

decompressed = dvt2(db+1);
toc;
top_data;
length(unique(compressed))
    
    
    

