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
fid = fopen('D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\files\trainLabelsNumerical.csv');

%ignore header line
tline = fgetl(fid);

tline = fgetl(fid);

how_much = 100;
disp('Loading labels.......................................................');
while ischar(tline) %&& how_much > 0
    tline = strsplit(tline,',');
    tline = cellfun(@str2num,tline);
    tline = tline(:,2);
    y = [y;tline];
    tline = fgetl(fid);
    how_much = how_much-1;
end
fclose(fid);

disp('Finished loading labels..............................................');

%get images
for i = 45001:50000
    img_path = strcat(folder,'\');
    img_path = strcat(img_path,num2str(i));
    img_path = strcat(img_path,'.png');
    fprintf('Loaded image %s.\n',img_path);
    img = imread(img_path);
    img = im2double(img);
    [m n k] = size(img);
    img  = permute(img, [3 2 1]);
    img = reshape(img, [k  m*n]);
    img = img(:);
    X = [X;img'];
end

%feature normalization
disp('Normalization........................................................');
[X_norm, mu, sigma] = featureNormalize(X);
X = X_norm;
disp('DONE..................................................................');
end

