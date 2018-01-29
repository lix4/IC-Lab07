function [rPlaceholder] = kmean(k, means, img, placeholder)
%     recompute centroids
    [row col cha] = size(img);
    for i = 1:row
       for j = 1:col
          min_distance = 9999;
          closet_cluster = 1;
          for z = 1:k
              distance = RGBdistnace(img(i, j, :), means(z, :));
              if distance < min_distance
                  min_distance = means(z);
                  closet_cluster = z;
              end
          end
          fprintf('cluster belongs to: %i\n', closet_cluster);
          placeholer(z)(b) = 
       end
%        assign means value to each pixel in the cluster
    end
    
    placeholder(5) = {1010};
    rPlaceholder = placeholder;
end

function [distance] = RGBdistnace(p1, p2)
    square1 = (double(p1(1)) / 255 - p2(1)) ^ 2;
    square2 = (double(p1(2)) / 255 - p2(2)) ^ 2;
    square3 = (double(p1(3)) / 255 - p2(3)) ^ 2;
    distance = sqrt(square1 + square2 +square3);
end