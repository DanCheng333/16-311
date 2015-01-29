% Name: Dan Cheng
% Andrew ID : danc
% Lab2P2 16-311

%% 16-311 Lab 2 Starter Code 
% Written by Sarah Tan, 12/20/2014

function [ BW ] = thresholdImage( I )
% thresholdImage thresholds the image I by your chosen threshold values
% and return the thresholded binary image
%   Inputs: I - rgb image
%   Outputs: outI - binary image after thresholding

% read the iput image
IM = imread(I);
% convert the rgb input image to hsv image
B = rgb2hsv(IM);
% extract the hue,saturation,intensity values
H = B(:,:,1);
S = B(:,:,2);
Is = B(:,:,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% all of the following img    %%%
%% try best to contain the whole ball  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% intensity %%%%%%%%%%
% get appropriate intensity image
% using threshold of 0.3
BI = double(im2bw(Is,0.3));


%%%%%%%%%%% SATURATION %%%%%%%%%%
% get appropriate saturation image
% using threshold of 0.3
BS = im2bw(S,0.3);



%%%%%%%%%%%%%% HUE %%%%%%%%%%%%%%
% get approriate hue img
% using hue img from 0.145 to 0.195
BW = im2bw(H,0.145) - im2bw(H,0.195);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% AND GRAPH %%%%%%%%%%%%
%%%% and all the imgs together to get the ball img
BW = BW & BS & BI;
%figure;
%imshow(BW);

%%%%%%%%%%%%%%%%%%%
end

