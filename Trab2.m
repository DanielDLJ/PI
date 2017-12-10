clear all
close all
clc

taxa = 20;
level = 0.5;
interacoes = 10;
condicao_parada=20;
vid = VideoReader ('IMG_3708.mp4');
numFrames = vid.NumberOfFrames;
n=numFrames;
a = 1;
b = numFrames;
x = ceil(a/b);
cont = 0;
while 1
    if(cont == interacoes)
        imwrite(frames_inicial,['Image Inicial' int2str(a), '.jpg']);
        imwrite(frames_meio,['Image Meio' int2str(x), '.jpg']);
        imwrite(frames_final,['Image Final' int2str(b), '.jpg']);
        break;
    end
    x = ceil(a/b);
    frames_inicial = read(vid,a);
    frames_meio = read(vid,x);
    frames_final = read(vid,b);
    if(a == b)
        imwrite(frames_inicial,['Image Inicial' int2str(i), '.jpg']);
        imwrite(frames_meio,['Image Meio' int2str(i), '.jpg']);
        imwrite(frames_final,['Image Final' int2str(i), '.jpg']);
        break;
    end
    
    flagAB = 0;
    flagBX = 0;
    flagAX = 0;
    
    BW = im2bw(frames_inicial, level);
    BW2 = im2bw(frames_meio, level);
    BW_Resultante = BW - BW2;
    [lin col]=size(BW_Resultante);
    soma = 0;
    for j=1:lin
       for k=1:col
          soma = soma + BW_Resultante(j,k);
       end
    end
    if(soma > condicao_parada)
        b = x;
    else
        a = x;
    end
    cont = cont + 1;
end
figure, imshow(frames_inicial)