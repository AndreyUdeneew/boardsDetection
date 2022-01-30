clc;
clear;
list=dir('*BW*.jpg');

for i=1:length(list)
    list(i).IM=imread(list(i).name);
    list(i).IMgray=rgb2gray(list(i).IM);

    list(i).adjusted=imadjust(list(i).IMgray);
    list(i).hist=histeq(list(i).IMgray);
    list(i).adapted=adapthisteq(list(i).IMgray);


    list(i).multipliedADJ=immultiply(list(i).IMgray,list(i).adjusted);
    list(i).multipliedHIST=immultiply(list(i).IMgray,list(i).hist);
    list(i).multipliedADAPT=immultiply(list(i).IMgray,list(i).adapted);

%     list(i).adjMAP=imagesc(list(i).adjusted);
%     list(i).histMAP=imagesc(list(i).hist);
%     list(i).adaptedMAP=imagesc(list(i).adapted);

    imAdjusted(i).name=['ADJUSTED',list(i).name];
%     [list(i).Gx,list(i).Gy] = imgradientxy(list(i).adjusted);
%     [list(i).Gmag,list(i).Gdir] = imgradient(list(i).Gx,list(i).Gy);
%     list(i).edge = edge(list(i).IMgray);
%     list(i).Gmag=imadjust(list(i).Gmag);

    fig1=gcf;
    fig1.FileName=imAdjusted(i).name;
    fig1.Name=imAdjusted(i).name;
    title('imAdjusted(i).name');
    
%     imshow([list(i).IMgray,list(i).adjusted,list(i).hist,list(i).adapted]);
%     imshowpair(list(i).IMgray,list(i).adjusted);
%     imshowpair(list(i).IMgray,list(i).adapted);
%     imshow([list(i).IMgray,list(i).multipliedADJ,list(i).multipliedHIST,list(i).multipliedADAPT]);
%       subplot(2,2,1)
%       imshow(list(i).IMgray);
      subplot(2,2,1);
      imagesc(list(i).IMgray);
      subplot(2,2,2);
      imagesc(list(i).adjusted);
      subplot(2,2,3);
      imagesc(list(i).hist);
      subplot(2,2,4);
      imagesc(list(i).adapted);

    saveas(gcf,fig1.FileName);
    clf;
end