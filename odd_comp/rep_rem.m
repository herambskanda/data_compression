% clc
% %clear all
% 
% rng(19);
% od = 1;
% qwe = 1;
% %while d == 1 || con == 1
%      data = randi(300,1,10000);
%      data(1) = 2*ceil(data(1)/2);
%      data = data + 2;
%      %data= [6,40,16,12,22,10,42,47,58,42,21,37,38,24,18,38,21,41,34,51,37,65,58,47,50,51,33,58,34,57,26,58,53,53,43,36,54,32,70,66,31,31,25,74,53,32,40,66,47,72,31,61,72,74,74,60,73,52,50,28,69,36,64,74,72,68,55,42,34,49,65,50,35,36,79,42,74,37,77,51,65,66,50,78,34,56,44,49,70,50,64,80,52,35,37,41,47,53,75,37];
%     %data = [8,3,4,4,8,3,6,6,6,8,3,7,6,7,4];
%     %data = [4,5,5,3,5,3,6];%,3,6,7,4,5,6,3,5];
%     %  data = [4,5,5,8,6,7,4,3,5,7,8,8,6,7,4,7,7,4,7,8,7,8,3,4,8,3,4,7,4,7,5,3,7,3,3,7,4,6,7,7,3,4,5,3,3,5,7,5,8,6,7,5,5,4,6,6,5,7,7,3,7,5,3,4,4,6,6,3,6,5,3,6,7,4,3,8,4,4,4,8,5,8,7,3,7,6,3,4,8,5,8,3,7,6,8,6,7,8,3,6];
% 
% 
%     %% COMPRESSION---------VOILA!!!!
%     clc
%    j =1;
%    data
%     while j <=15
%         red = floor(data/2);
%         i
%         redd = red;
%         %odd = mod(data,2);
% 
%         a=zeros(1,length(redd));
%         i=1;
%         while i < length(redd)
%             a(i+1:end) = a(i+1:end)+(redd(1:end-i)>0) ;
%             redd(1:end-i) =redd(1:end-i) - (redd(1:end-i)>0);
%             i=i+1;
%         end
%         rem = redd;
%         red = red + a;
%         %red(2:end)= red(2:end) + odd(1:end-1);
%         %rem(end) = rem(end) + odd(end);                     %save
% 
%         comprsd = red;  
%         %key = find(odd==1,1);
%         data = red;%[red,(nonzeros(rem))'];
%                                       %save
%         j = j+1;
%    end
%    length(unique(data))
%    unique(data(1000:9000))
%    
   
   %%
   clc
shortGeneStr = [0,0,1,1,0,1,0,1,1,0];
% perform Burrows-Wheeler Matrix (BWM) Transform
lengthOfGene = length (shortGeneStr);
stringMatrix = [];	% [][]
for i=1:lengthOfGene
	% numberOfRightRotation = i;
	stringMatrix(i,:) = circshift(shortGeneStr, [1 i]); % i = numberOfRightRotation   
end
% storeSortedStringMatrix = sortcell(stringMatrix, size(stringMatrix));
storeSortedStringMatrix = sort(stringMatrix); % Burrows-Wheeler Matrix (BWM)
% retain the last character of each cell
% take the last column from the Burrows-Wheeler Matrix
for i=1:lengthOfGene
    %stringProcessed = cell2string(storeSortedStringMatrix(i));
    lastCharacterArray(i) = storeSortedStringMatrix(end); 
end
BWM = char(storeSortedStringMatrix); % Burrows-Wheeler Matrix
% [rowSize columnSize] = size(BWM);
% BWM(:,end) is equivalent to char(lastCharacterArray)'
% 1st column : BWM(:,1)
BWM_1stColumn = BWM(:,1)';
BWM_lastColumn = BWM(:,end)';
patternTarget = 'gca';
%{
for i=length(patternTarget):-1:1
    targetChar = patternTarget(i);
    
    positionsOfHits = find(BWM_1stColumn == targetChar); 
    numberOfHits = length(positionsOfHits);
    
    % find(BWM_lastColumn(positionsOfHits), 'c') % patternTarget(i-1)
    
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%