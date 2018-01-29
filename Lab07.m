clc
close all;
clear all;

img = imread('./yellow_duck.png');

%%
step = 50;
img = img(1:step:size(img,1), 1:step:size(img,2),:);

%%
k = 5;
seed = 0; % or any fixed integer, for debugging. 
rand('state', seed);
means = rand(k,3) % creates a k-by-3 matrix of random numbers

%% generate k number of clusters
placeholder = {};
for a = 1:k
    placeholder(a) = {a};
end

placeholder
%%
[rPlaceholder] = kmean(k, means, img, placeholder);
