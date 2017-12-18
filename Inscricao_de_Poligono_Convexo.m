%aplicando o regionprops
clear all
close all
clc
img=imread('rice_binary.png');
%figure, imshow(img);
s = regionprops(img, 'Orientation','MajorAxisLength','MinorAxisLength','Centroid');
figure, imshow(img),
hold on;
%s(92).MinorAxisLength;

cc = bwconncomp(img);
L = labelmatrix(cc);
img2=(L==44);
s = regionprops(img2, 'Orientation','MajorAxisLength','MinorAxisLength','Centroid');
figure, imshow(img2,'InitialMagnification', 400);
xMajor=s.Centroid(1) + [-1 1]*(s.MajorAxisLength/2)*cosd(s.Orientation);
yMajor=s.Centroid(2) + [-1 1]*(s.MajorAxisLength/2)*sind(s.Orientation);

xMinor=s.Centroid(1) + [-1 1]*(s.MinorAxisLength/2)*sind(s.Orientation);
yMinor=s.Centroid(2) + [-1 1]*(s.MinorAxisLength/2)*cosd(s.Orientation);
    %x = s.Centroid(1) + s.MajorAxisLength * cosd(s.Orientation);
    %y = s.Centroid(2) - s.MajorAxisLength * sind(s.Orientation);
    %img2(fix(x),fix(y))=1;
    %line(x,y);
    %line([s.Centroid(1) x],[s.Centroid(2) y]);
    line(xMajor,yMajor);
    %shapeInserter = vision.ShapeInserter('Shape', 'Lines', 'BorderColor', 'black');
    %img2 = step(shapeInserter, im2, {xMajor yMajor});
    
    %img2 = insertShape(img2,'Line',{xMajor,yMajor},'LineWidth', 5);
    %IND = DRAWLINE(xMajor, yMajor, img2);
    %line(xMinor,yMinor);
    
    
