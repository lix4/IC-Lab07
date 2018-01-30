clc
close all;
clear all;

img = imread('./color-balls.jpg');


% step = 50;
% img = img(1:step:size(img,1), 1:step:size(img,2),:);


k = 5;
seed = 13; % or any fixed integer, for debugging. 
rand('state', seed);
means = rand(k,3) % creates a k-by-3 matrix of random numbers



iteration = 5;
for iter = 1:iteration
    double_img = im2double(img);
    [r] = kmean(k, means, double_img);
%     r
    [row col channel] = size(double_img);
    for d = 1:k
        disp('------------------------------------------');
        num = numel(r(find(r == d)))
        if num == 0
            continue;
        end
        [a b] = find(r == d);
        sumR = 0;
        sumG = 0;
        sumB = 0;
        for count = 1:num
            sumR = sumR + double_img(a(count), b(count), 1);
            sumG = sumG + double_img(a(count), b(count), 2);
            sumB = sumB + double_img(a(count), b(count), 3);
        end
%         R = sum(sum(double_img(a, b, 1))) / num
%         G = sum(sum(double_img(a, b, 2))) / num
%         B = sum(sum(double_img(a, b, 3))) / num;
        means(d, 1) = sumR / num;
        means(d, 2) = sumG / num;
        means(d, 3) = sumB / num;
    end
%     means
end



for o = 1:row
    for p = 1:col
        double_img(o, p, 1) = means(r(o, p), 1);
        double_img(o, p, 2) = means(r(o, p), 2);
        double_img(o, p, 3) = means(r(o, p), 3);
    end
end


f_img = im2uint8(double_img);
imshow(f_img);
