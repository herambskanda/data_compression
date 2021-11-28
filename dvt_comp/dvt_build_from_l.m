clc
rng(1123)
data = randi(20,1,1000);
matrixx = zeros(20,1000);
k = 1;
for j = unique(data)
    matrixx(k,:) = (data == j);
    k = k +1;
end

lul = 20;
least = lul;
i=1;
while lul > 10
    rng(i)
    l_arr = randi(20,1,20);
    matrix = matrixx;
    matrixl = matrix .* l_arr';
    for k = 1:max(l_arr)
        a = (matrixl - k >0);
        matrix(:,1:end-k) = matrix(:,1:end-k) + a(:,k+1:end);
    end
    l_shift = sum(matrix,1);
    [c,~,ic] = unique(l_shift);
    ic = accumarray(ic , 1);
    ic = ic';
    x = c(ic == max(ic));
    lul = length(unique(data(l_shift == x(1))));
    if least > lul
        least = lul;
        s = l_arr;
    end
    i = i+1;
end

[gc,un] = groupcounts(matrix');