clc;
clear;
list=dir('*BW*.jpg');

for i=1:length(list)
    list(i).IM=imread(list(i).name);
    list(i).IMgray=rgb2gray(list(i).IM);
    list(i).adjusted=imadjust(list(i).IMgray);
    imAdjusted(i).name=['ADJUSTED',list(i).name];

    fig1=gcf;
    fig1.FileName=imAdjusted(i).name;
    fig1.Name=imAdjusted(i).name;
    title('imAdjusted(i).name');
    imshow(list(i).adjusted);
%     quiver(list(i).Gx,list(i).Gy);
    saveas(gcf,fig1.FileName);
    clf;
end