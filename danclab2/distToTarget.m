% Name: Dan Cheng
% Andrew ID : danc
% Lab2P2 16-311


%% 16-311 Lab 2 Starter Code 
% Written by Sarah Tan, 12/20/2014

function [ dist ] = distToTarget( centroids, target)
%distToTarget calculates the distance to the target given the centroids of
%the tennis balls
%   Inputs: centroids - the 4x2 matrix of the 4 tennis balls
%           target - type of target you want to calculate the distance to
%                   (small or large)
%   Outputs: dist - distance to the target

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% using the 8 imgs to calculate ratio for large board %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [lI2_l, c2_l] = segmentImage(thresholdImage('2m_large.jpg'));   
    % calculate the average width of large board
    % the centroids are already sorted
    cx2_l = ((c2_l(3,1) + c2_l(4,1))/2) - ((c2_l(1,1) + c2_l(2,1))/2);
    % sort according to y axis
    c2_l = sortrows(c2_l, 2);
    % average length
    cy2_l = ((c2_l(3,2) + c2_l(4,2))/2) - ((c2_l(1,2) + c2_l(2,2))/2);
    % avg length of the square board
    bs2_l = (cx2_l + cy2_l)/2;
    %calculate the ratio f2_l
    % f2_l/board_pixel = (2*12)inches/15inches
    f2_l = ((2*12)/15) * bs2_l;
   
    [lI4_l, c4_l] = segmentImage(thresholdImage('4m_large.jpg'));
    cx4_l = ((c4_l(3,1) + c4_l(4,1))/2) - ((c4_l(1,1) + c4_l(2,1))/2);
    c4_l = sortrows(c4_l, 2);
    cy4_l = ((c4_l(3,2) + c4_l(4,2))/2) - ((c4_l(1,2) + c4_l(2,2))/2);
    bs4_l = (cx4_l + cy4_l)/2;
    %calculate the ratio f4_l
    % f4_l/board_pixel = (4*12)inches/15inches
    f4_l = ((4*12)/15) * bs4_l;

    
    [lI8_l, c8_l] = segmentImage(thresholdImage('8m_large.jpg'));
    cx8_l = ((c8_l(3,1) + c8_l(4,1))/2) - ((c8_l(1,1) + c8_l(2,1))/2);
    c8_l = sortrows(c8_l, 2);
    cy8_l = ((c8_l(3,2) + c8_l(4,2))/2) - ((c8_l(1,2) + c8_l(2,2))/2);
    bs8_l = (cx8_l + cy8_l)/2;
    %calculate the ratio f8_l
    % f8_l/board_pixel = (8*12)inches/15inches
    f8_l = ((8*12)/15) * bs8_l;   

    
    [lI16_l, c16_l] = segmentImage(thresholdImage('16m_large.jpg'));
    cx16_l = ((c16_l(3,1) + c16_l(4,1))/2) - ((c16_l(1,1) + c16_l(2,1))/2);
    c16_l = sortrows(c16_l, 2);
    cy16_l = ((c16_l(3,2) + c16_l(4,2))/2) - ((c16_l(1,2) + c16_l(2,2))/2);
    bs16_l = (cx16_l + cy16_l)/2;
    %calculate the ratio f16_l
    % f16_l/board_pixel = (16*12)inches/15inches
    f16_l = ((16*12)/15) * bs16_l;    

    %average ratio of all distances for large
    f_l = (f2_l+f4_l+f8_l+f16_l)/4;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% using the 8 imgs to calculate ratio for small board %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [lI2_s, c2_s] = segmentImage(thresholdImage('2m_small.jpg'));
    % calculate the average width of small board
    % the centroids are already sorted
    cx2_s = ((c2_s(3,1) + c2_s(4,1))/2) - ((c2_s(1,1) + c2_s(2,1))/2);
    % sort according to y axis
    c2_s = sortrows(c2_s, 2);
    % find avg length
    cy2_s = ((c2_s(3,2) + c2_s(4,2))/2) - ((c2_s(1,2) + c2_s(2,2))/2);
    % avg length of the square board
    bs2_s = (cx2_s + cy2_s)/2;
    %calculate the ratio f2_l
    % f2_l/board_pixel = (2*12)inches/15inches
    f2_s = ((2*12)/5) * bs2_s;
    
    [lI4_s, c4_s] = segmentImage(thresholdImage('4m_small.jpg'));
    cx4_s = ((c4_s(3,1) + c4_s(4,1))/2) - ((c4_s(1,1) + c4_s(2,1))/2);
    c4_s = sortrows(c4_s, 2);
    cy4_s = ((c4_s(3,2) + c4_s(4,2))/2) - ((c4_s(1,2) + c4_s(2,2))/2);
    bs4_s = (cx4_s + cy4_s)/2;
    %calculate the ratio f4_l
    % f4_l/board_pixel = (4*12)inches/15inches
    f4_s = ((4*12)/5) * bs4_s;
    
    [lI8_s, c8_s] = segmentImage(thresholdImage('8m_small.jpg'));
    cx8_s = ((c8_s(3,1) + c8_s(4,1))/2) - ((c8_s(1,1) + c8_s(2,1))/2);
    c8_s = sortrows(c8_s, 2);
    cy8_s = ((c8_s(3,2) + c8_s(4,2))/2) - ((c8_s(1,2) + c8_s(2,2))/2);
    bs8_s = (cx8_s + cy8_s)/2;
    %calculate the ratio f8_l
    % f8_l/board_pixel = (8*12)inches/15inches
    f8_s = ((8*12)/5) * bs8_s; 
    
    [lI16_s, c16_s] = segmentImage(thresholdImage('16m_small.jpg'));
    cx16_s= ((c16_s(3,1) + c16_s(4,1))/2) - ((c16_s(1,1) + c16_s(2,1))/2);
    c16_s = sortrows(c16_s, 2);
    cy16_s = ((c16_s(3,2) + c16_s(4,2))/2) - ((c16_s(1,2) + c16_s(2,2))/2);
    bs16_s = (cx16_s + cy16_s)/2;
    %calculate the ratio f16_l
    % f16_l/board_pixel = (16*12)inches/15inches
    f16_s = ((16*12)/5) * bs16_s; 
    f_s = (f2_s+f4_s+f8_s+f16_s)/4;

    % get the avg wdith and avg length from centroids input
    centroids_x= ((centroids(3,1) + centroids(4,1))/2) - ((centroids(1,1) + centroids(2,1))/2);
    centroids = sortrows(centroids, 2);
    centroids_y = ((centroids(3,2) + centroids(4,2))/2) - ((centroids(1,2) + centroids(2,2))/2);
    % calculate avg board length in graph
    centroids_bs = (centroids_x + centroids_y)/2;
    if (strcmp(target,'small') == 1)
        dist = ((f_s / centroids_bs) * 5)/12; %unit foot
    end
    if (strcmp(target,'large') == 1)
        dist = ((f_l / centroids_bs) * 15)/12; %unit foot
    end   
end

