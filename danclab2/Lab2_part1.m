% Name: Dan Cheng
% Andrew ID : danc
% Lab2P1 16-311

%% 16-311 Lab 2 Starter Code 
% Written by Sarah Tan, 12/20/2014

%% Q1.1 - define a vector Q containing the numbers 1 through 16

% PUT CODE FOR Q1.1 HERE.
% define a vector Q, which contains the numbers 1 through 16.
Q = [1:16];


%% Q1.2 - define a matrix A that takes every other element of Q, 
%          reshapes them into a 2 by 4 matrix and orders them by row where
%          the first row contains the first half of the elements

% PUT CODE FOR Q1.2 HERE.
% every other element

A = [1 3 5 7; 9 11 13 15]; 

%% Q1.3 -  Load the included image called robotpic.jpg?with the handle/variable I

% PUT CODE FOR Q1.3
I = imread('robotpic.jpg');

%% Q1.4 - Show the "robotpic.jpg" image using the handle on figure 2. 
%           Save figure 2 under the file name robot.jpg?with the title robot Waves? 
figure;
imshow(I);
saveas(gcf(),'robot.jpg','jpg');
title('Robot Waves');

% PUT CODE FOR Q1.4

%% Q1.5 - Create a binary image which only keeps pixel values between the 
%           hue value of 0.05 and 0.6.

% PUT CODE FOR Q1.5
% convert binary image to hsv image
B = rgb2hsv(I);
% extract the hue image and store it in H
H = B(:,:,1);
% ignore the hue under 0.05 and above 0.6
% store the img in BW
BW = im2bw(H,0.05) - im2bw(H,0.6);

%% Submission
% Do not edit this area of the code, otherwise you may not get credit
save('Lab2Q1.mat', 'Q', 'A', 'I', 'BW');