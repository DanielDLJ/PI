clear all
close all
clc

taxa = 20;
level = 0.5;
condicao_parada=20;
 vid = VideoReader ('IMG_3704.avi');
 numFrames = vid.NumberOfFrames;
 n=numFrames;
 for i = 1:2:n
     frames1 = read(vid,i);
     if(i+taxa < n)
         i = i + taxa;
        frames2 = read(vid,i);
     end
     BW = im2bw(frames1, level);
     BW2 = im2bw(frames2, level);
     BW_Resultante = BW - BW2;
     [lin col]=size(BW_Resultante);
     soma = 0;
     for j=1:lin
        for k=1:col
           soma = soma + BW_Resultante(j,k);
        end
     end
    if(soma > condicao_parada)
     imwrite(frames2,['Image' int2str(i), '.jpg']);
     im(i)=image(frames2);
    end
 end
figure, imshow(frames2)