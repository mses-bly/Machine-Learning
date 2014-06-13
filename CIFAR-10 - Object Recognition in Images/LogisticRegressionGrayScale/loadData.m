function [ X, y ] = loadData(img_folder_path,labels_file_path)
%LOADDATA Loads the images and labels
%   Load the images in folder_path, converts them from RGB to Gray Scale
%   and load its labels

X  = [];
y = [];

%folder = uigetdir
folder = 'D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\train';

%process labels file
%fid = fopen(labels_file_path);
fid = fopen('D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\train\trainLabelsAutomobile.csv');

%ignore header line
tline = fgetl(fid);

tline = fgetl(fid);

how_much = 2000;

while ischar(tline) && how_much >= 0
    tline = strsplit(tline,',');
    tline = cellfun(@str2num,tline);
    tline = tline(:,2);
    y = [y;tline];
    tline = fgetl(fid);
    how_much = how_much-1;
end
fclose(fid);
%get images
m = length(y);

for i = 1:m
    img_path = strcat(folder,'\');
    img_path = strcat(img_path,num2str(i));
    img_path = strcat(img_path,'.png');
    image = im2double(rgb2gray(imread(img_path))); 
    image = image';
    image = image(:);
    X = [X;image'];
end
end

