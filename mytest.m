clear;
GAMMA = 20;
% Inputs and parameters
im_in = imread('results/11.jpg');
% GrabCut
im_out = grabcut(im_in, GAMMA);

% imwrite(im_out, 'results/11.jpg');
