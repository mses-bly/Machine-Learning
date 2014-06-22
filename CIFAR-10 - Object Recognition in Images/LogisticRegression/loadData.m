%function [X,y, X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = loadData(img_folder_path,labels_file_path)
function [X,y] = loadData(img_folder_path,labels_file_path)
%LOADDATA Loads the images and labels
%   Load the images in folder_path, converts them from RGB to Gray Scale
%   and load its labels

X  = [];
y = [];

%folder = uigetdir
folder = 'D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\train';

%process labels file
%fid = fopen(labels_file_path);
fid = fopen('D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\trainLabelsNumerical.csv');

%ignore header line
tline = fgetl(fid);

tline = fgetl(fid);

how_much = 12000;

while ischar(tline) %&& how_much > 0
    tline = strsplit(tline,',');
    tline = cellfun(@str2num,tline);
    tline = tline(:,2);
    y = [y;tline];
    tline = fgetl(fid);
    how_much = how_much-1;
end
fclose(fid);

disp('Finished loading labels');

%get images
m = length(y);

% for i = 1:1000
%     img_path = strcat(folder,'\');
%     img_path = strcat(img_path,num2str(i));
%     img_path = strcat(img_path,'.png');
%     fprintf('Loaded image %s.\n',img_path);
%     image = im2double(rgb2gray(imread(img_path))); 
%     image = image';
%     image = image(:);
%     X = [X;image'];
% end
% 
% % %feature normalization
% [X_norm, mu, sigma] = featureNormalize(X);
% X = X_norm;

%divide set into training, cross validation and test.
%[X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet( X, y);

end

