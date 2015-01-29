% Name: Dan Cheng
% Andrew ID : danc
% Lab2P2 16-311
%% 16-311 Lab 2 Starter Code 
% Written by Sarah Tan, 12/20/2014

%% Implementation
Data = [];
Images = [];
% Put your code here
%%%%%%%%%%%%%%%%%%%%%%% FIRST FOUR ROWS FOR SMALL %%%%%%%%%%%%%%%%%%%%%%%
[label2_s,cen2_s] = segmentImage(thresholdImage('2m_small.jpg'));
d2_s = distToTarget(cen2_s,'small'); %approx distance
err2_s = abs(d2_s - 2)/2; % percentage of error
Data = cat(1,Data,[d2_s,err2_s]); 
Images = cat(1,Images,label2_s); 

[label4_s,cen4_s] = segmentImage(thresholdImage('4m_small.jpg'));
d4_s = distToTarget(cen4_s,'small');
err4_s = abs(d4_s - 4)/4;% percentage of error
Data = cat(1,Data,[d4_s,err4_s]); 
Images = cat(1,Images,label4_s);

[label8_s,cen8_s] = segmentImage(thresholdImage('8m_small.jpg'));
d8_s = distToTarget(cen8_s,'small');
err8_s = abs(d8_s - 8)/8;% percentage of error
Data = cat(1,Data,[d8_s,err8_s]); 
Images = cat(1,Images,label8_s);


[label16_s,cen16_s] = segmentImage(thresholdImage('16m_small.jpg'));
d16_s = distToTarget(cen16_s,'small');
err16_s = abs(d16_s - 16)/16;% percentage of error
Data = cat(1,Data,[d16_s,err16_s]); 
Images = cat(1,Images,label16_s); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% LAST FOUR ROWS FOR LARGE%%%%%%%%%%%%%%%%%%%%%%%%%%

[label2_l,cen2_l] = segmentImage(thresholdImage('2m_large.jpg'));
d2_l = distToTarget(cen2_l,'large');
err2_l = abs(d2_l - 2)/2;% percentage of error
Data = cat(1,Data,[d2_l,err2_l]); 
Images = cat(1,Images,label2_l); 


[label4_l,cen4_l] = segmentImage(thresholdImage('4m_large.jpg'));
d4_l = distToTarget(cen4_l,'large');
err4_l = abs(d4_l - 4)/4;% percentage of error
Data = cat(1,Data,[d4_l,err4_l]); 
Images = cat(1,Images,label4_l); 

[label8_l,cen8_l] = segmentImage(thresholdImage('8m_large.jpg'));
d8_l = distToTarget(cen8_l,'large');
err8_l = abs(d8_l - 8)/8;% percentage of error
Data = cat(1,Data,[d8_l,err8_l]); 
Images = cat(1,Images,label8_l); 

[label16_l,cen16_l] = segmentImage(thresholdImage('16m_large.jpg'));
d16_l = distToTarget(cen16_l,'large');
err16_l = abs(d16_l - 16)/16;% percentage of error
Data = cat(1,Data,[d16_l,err16_l]); 
Images = cat(1,Images,label16_l); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Submission
% Do not edit this section, otherwise you may not get credit
save('Lab2Q2.mat', 'Data', 'Images');