
clear all;
close all;
hold on;


%% questoin 1
CoifQMF = MakeONFilter('Coiflet',3);

plot(CoifQMF);

I=double(imread('cameraman.tif'));
figure();
imagesc(I);
colormap('gray');


z=zeros(256,256);




z(200,200) = 1;
stem(z);

L=5;
wc = FWT2_PO (I,L, CoifQMF);
ond = IWT2_PO(wc,L,CoifQMF);




% figure();
% plot(ond);
figure();
imagesc(wc);
colormap('gray');
title('multiresolution')



%% question 2


Ingrid = ReadImage('Daubechies');

NoisyIngrid = Ingrid + 5*WhiteNoise(Ingrid);

figure();

imagesc(Ingrid);
colormap('gray');
title('image de base');
L=5;
wc = FWT2_PO (NoisyIngrid,L, CoifQMF);
ond = IWT2_PO(wc,L,CoifQMF);

figure();
imagesc(wc);
colormap('gray');
title('multiresolution')
