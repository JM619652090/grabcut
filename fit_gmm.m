function gmm_param = fit_gmm(rgb_pts, labels)
%FIT_GMM Part of GrabCut: Fit a GMM with K Gaussians, (Gaussian Mixture Model高斯混合模型)
% where K=numel(unique(labels))
%
% Inputs:
%   - rgb_pts: Nx3 matrix holding N points in RGB space
%   - labels: Nx1 label vector
%
% Output:
%   - gmm_param: Kx3 parameter matrix,
% column 1 for \pi, 2 for \mu, 3 for \sigma
%
% Author:
%   Xiuming Zhang
%   xiuming6zhang[on]gmail.com
%   Dept. of ECE, National University of Singapore
%   April 2015
%

no_gauss = numel(unique(labels)); % 计算类别个数

gmm_param = cell(no_gauss, 3);

% For each Gaussian
for idx = 1:no_gauss
    pts = rgb_pts(labels==idx, :);
    gmm_param{idx, 1} = size(pts, 1)/size(rgb_pts, 1); % pi 所占比例
    gmm_param{idx, 2} = mean(pts, 1); % mean
    gmm_param{idx, 3} = cov(pts); % cov
end
