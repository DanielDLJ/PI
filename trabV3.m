%Trabalho de PI
%Alunos 
%Daniel Leme Junior    RA:725805
%Igor                  RA:725804

%Observação 
%Esse projeto mostra somente o tempo de roubo e o tempo que ocorre o roubo
%diferente do que foi apresentado em aula onde somente guardava as
%movimentação no video.

clear all
close all
clc

%video base em FULL HD
%1080 x 1920 = 2.073.600


taxa = 30; %taxa de pulo entre frames
level = 0.5;%taxa de binarizacao

vid = VideoReader ('PI_Video.MOV');
numFrames = vid.NumberOfFrames;
n=numFrames;

%Calcular valor binario imagem inicial e final
frame_Incial = read(vid,1);
frame_Final = read(vid,numFrames);
BW_Incial = im2bw(frame_Incial, level);
BW_Final = im2bw(frame_Final, level);
[lin col]=size(BW_Final);
diferenca_inicial = 0;
diferenca_final = 0;
for j=1:lin
   for k=1:col
       if(BW_Incial(j,k) == -1)
         diferenca_inicial = diferenca_inicial + 1;
       else
         diferenca_inicial = diferenca_inicial + BW_Incial(j,k);
       end
       
       if(BW_Final(j,k) == -1)
         diferenca_final = diferenca_final + 1;
       else
         diferenca_final = diferenca_final + BW_Final(j,k);
       end
   end
end
%Procura Do lugar do roubo
soma = 0;
for i=n:-2:1
    %frame_Atual = read(vid,i);
    if(i-taxa > 1)
        i = i - taxa;
        frame_Atual = read(vid,i);
    end
    BW_atual = im2bw(frame_Atual, level);
    BW_Resultante = BW_atual;
    soma = 0;
    for j=1:lin
        for k=1:col
           if(BW_Resultante(j,k) == -1)
            soma = soma + 1;
           else
            soma = soma + BW_Resultante(j,k);
           end
        end
    end
    if(soma >= diferenca_inicial - 1000 && soma <= diferenca_inicial + 1000)%verifica se a imgem atual e "igual" a incial
        segundos = i/30;
        %loop para mostrar o roubo
        for h = i:n
            soma = 0;
            frame_Atual = read(vid,h);
            BW_atual = im2bw(frame_Atual, level);
            BW_Resultante = BW_atual;
            soma = 0;
            for y=1:lin
                for f=1:col
                   if(BW_Resultante(y,f) == -1)
                        soma = soma + 1;
                   else
                        soma = soma + BW_Resultante(y,f);
                   end
                end
            end
            imwrite(frame_Atual,['Image' int2str(h), '.jpg']);
            if(soma >= diferenca_final - 1000 && soma <= diferenca_final + 1000)%verifica se mostou o roubo 
                msgbox(sprintf('Tempo do Roubo %2.3g segundos\n',segundos),'Notificação');
                break;
            end
            h = h + taxa;
        end
        break;
    end
end