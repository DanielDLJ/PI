clear all
close all
clc
bw = imread('page.png');
figure, imshow(bw);
bw = ~bw(1107:1194, 17:135); %delimita a região de interesse
figure, imshow(bw, 'InitialMagnification', 'fit') %amplia a janela
L = bwlabel(bw,8);
rgb = label2rgb(L, 'jet', [.95 .95 .95], 'shuffle'); %rotula colorido
figure, imshow(rgb, 'InitialMagnification', 'fit')
s = regionprops(L, {'Centroid', 'PixelIdxList'}); %obtem o centroide e obj
centroids = cat(1, s.Centroid); %concatena arrays em uma lista
[sorted_centroids, sort_order] = sortrows(fliplr(centroids)); %flipa a matriz
s2 = s(sort_order);
hold on
for k = 1:numel(s2)
   centroid = s2(k).Centroid;
   text(centroid(1), centroid(2), sprintf('%d', k)); %plot o obj no centroide
end
hold off
for k = 1:numel(s2)
   kth_object_idx_list = s2(k).PixelIdxList; 
   L(kth_object_idx_list) = k;
end
figure,
for k = 1:numel(s2)
    imshow(L == k)
    pause(1)
end
    