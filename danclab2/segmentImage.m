% Name: Dan Cheng
% Andrew ID : danc
% Lab2P2 16-311

%% 16-311 Lab 2 Starter Code 
% Written by Sarah Tan, 12/20/2014

function [ labelI, centroids ] = segmentImage( BW )
%segmentImage takes in a binary image BW consisting of only 0s and 1s and
%  returns a labeled image labelI where each of the connected components has
%  a different label number
%   Inputs: BW - binary image input
%   Outputs: labelI - image where each distinct connected component is labeled a
%                       different number
%            centroids - a 4x2 matrix containing the center locations of the 4
%                           tennis balls.

%% Get the constants

[h,w] = size(BW);
labelI = zeros(h,w);


%% Segmentation
% PUT YOUR IMPLMENTATION HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% 1st RASTER SCAN, label all non-zero pixel %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cn = 1; % counter for labeling
% dictionary for equivalence class
product = h * w;
dict = [1:product];
for i = 1:h %rows
    for j = 1:w %cols
        % when pixel is non-zero
        if (BW(i,j) == 1 && i > 1 && j > 1) 
            %if up and left are zeros
            %label ++ and label it
            if (labelI(i-1,j) == 0 && labelI(i,j-1)==0)
                cn = cn + 1;
                labelI(i,j) = cn;
            end
            % if up is non-zero and left is zero
            % use up label
            if (labelI(i-1,j) ~= 0 && labelI(i,j-1)==0)
                labelI(i,j) = labelI(i-1,j);
            end
            % if up is zero and left is non_zero
            % use left label
            if (labelI(i-1,j) == 0 && labelI(i,j-1)~=0)
                labelI(i,j) = labelI(i,j-1);   
            end
            % if up is non-zero and left is non_zero
            % use up label, and mark equivalence
            if (labelI(i-1,j) ~= 0 && labelI(i,j-1)~=0)
                %use array to mark equivalence
                %equivalent number index to the same number
                labelI(i,j) = labelI(i-1,j);
                dict(labelI(i,j-1)) = dict(labelI(i-1,j));
            end
        else
            labelI(i,j) = 0;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% handle all the equivalence  %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i2 = 1:h %rows
    for j2 = 1:w %cols
        if (labelI(i2,j2) > 0) 
            % equivalent number index to the same number
            % change label to the number that is indexed
            labelI(i2,j2) = dict(labelI(i2,j2));
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% store label numbers and their freq(area) %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%first row is the label
%second row is the frequency of the label
labelfreq = zeros(h,2);
cntcompo = 1;
% ss tells us whether label is already in the array or not
% ss = 1 when label is already in array labelfreq
% ss = 0 when label is not in array labelfreq
ss = 0;
% put the label number and frequency in a matrix
for i3 = 1:h %rows
    for j3 = 1:w %cols       
        if (labelI(i3,j3) > 0 )
            % there exits a label
            for k = 1:h
                % search through labelfreq
                if (labelfreq(k,2) == labelI(i3,j3))
                    %label already in labelfreq,just increment freq
                    labelfreq(k,1) =  labelfreq(k,1) + 1;
                    % change ss=1 to note that it is in labelfreq
                    ss = 1;
                end
            end
            if (ss == 0) %not in labelfreq
                %put it in labelfreq
                labelfreq(cntcompo,2) = labelI(i3,j3);
                % appear once change freq to one
                labelfreq(cntcompo,1) = 1;
                % counter of different labels add one
                cntcompo = cntcompo + 1;
            end
        end
        % set ss = 0, starts with no elem in labelfreq
        ss = 0;
    end
end


%%%%% resize labelfreq 
labelfreq2 = zeros(cntcompo-1,2);
for i9 = 1:cntcompo-1;
    labelfreq2(i9,1) = labelfreq(i9,1);
    labelfreq2(i9,2) = labelfreq(i9,2);
end
       

%% Filtering
% PUT YOUR IMPLEMENTATION HERE
% sort rows based on value on the second col(freq)
% label that appear the most is on the most bottom row
labelfreq2 = sortrows(labelfreq2);
%array has cntcompo -1 labels, since index starts with 1
index = cntcompo-1;




%the last four labels in labelfreq are the labels for tennis balls
%since they appear more frequently
%we filter out other components that are not tennis balls
for i4 = 1:h %rows
    for j4 = 1:w %cols
        %label already in array,just increment freq
        elem = labelI(i4,j4);
        if (labelfreq2(index,2) ~= elem && labelfreq2(index-1,2) ~= elem)
            if (labelfreq2(index-2,2) ~= elem && labelfreq2(index-3,2) ~= elem )
             % if not tennis ball label, ignore it make it 0
             labelI(i4,j4) = 0;
            end
        end
    end
end


    

 %% Find Tennis Ball Centroids
% PUT YOUR IMPLMENTATION HERE

centroids = zeros(4,2);
for i5 = 1:h %rows
    for j5 = 1:w %cols
        elem = labelI(i5,j5);
        if (labelfreq2(index,2) == elem)
            % add all x and y axis
           centroids(1,1) = centroids(1,1) + i5;
           centroids(1,2) = centroids(1,2) + j5;
        end
        if (labelfreq2(index-1,2) == elem)
           centroids(2,1) = centroids(2,1) + i5;
           centroids(2,2) = centroids(2,2) + j5;
        end
        if (labelfreq2(index-2,2) == elem)
           centroids(3,1) = centroids(3,1) + i5;
           centroids(3,2) = centroids(3,2) + j5;
        end
        if (labelfreq2(index-3,2) == elem)
           centroids(4,1) = centroids(4,1) + i5;
           centroids(4,2) = centroids(4,2) + j5;
        end
    end
end

% divide the sum of x and y axis by the number of that pixel
for cent = 1:4 
    centroids(cent,1) = centroids(cent,1)/labelfreq2(index-cent+1,1);
    centroids(cent,2) = centroids(cent,2)/labelfreq2(index-cent+1,1);
end
% round the centroid to integer
centroids = round(centroids);

% sort x axis ascending order
% upper two tennis ball come first two in centroids
centroids = sortrows(centroids);


%% Showing the labels in rgb image
%LRGB = label2rgb(labelI);
%figure;
%imshow(LRGB);
end

