clc;
clear;
list=dir('*BW*.jpg');

for i=1:length(list)
    list(i).IM=imread(list(i).name);
    list(i).IMgray=rgb2gray(list(i).IM);
    list(i).adjusted=imadjust(list(i).IMgray);
    list(i).adapted=adapthisteq(list(i).IMgray);
    imAdjusted(i).name=['ADJUSTED',list(i).name];
%     [list(i).Gx,list(i).Gy] = imgradientxy(list(i).adjusted);
%     [list(i).Gmag,list(i).Gdir] = imgradient(list(i).Gx,list(i).Gy);
%     list(i).edge = edge(list(i).IMgray);
%     list(i).Gmag=imadjust(list(i).Gmag);

    fig1=gcf;
    fig1.FileName=imAdjusted(i).name;
    fig1.Name=imAdjusted(i).name;
    title('imAdjusted(i).name');
    imshow([list(i).IMgray,list(i).adjusted,list(i).adapted]);
    saveas(gcf,fig1.FileName);
    clf;
end