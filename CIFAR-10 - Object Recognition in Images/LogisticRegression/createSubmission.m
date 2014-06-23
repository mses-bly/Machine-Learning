    function [] = createSubmission( Theta )
    %CREATESUBMISSION Create a submission matrix

    folder = 'D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\test\test';

    outputMatrix = [];
    
    for i = 1:300000
        img_path = strcat(folder,'\');
        img_path = strcat(img_path,num2str(i));
        img_path = strcat(img_path,'.png');
        img = imread(img_path);
        img = im2double(img);
        [m n k] = size(img);
        img  = permute(img, [3 2 1]);
        img = reshape(img, [k  m*n]);
        img = img(:);
        [X_norm, mu, sigma] = featureNormalize(img);
        imageClass = predictOneVsAll( X_norm',Theta );        
        outputMatrix = [outputMatrix;[i,imageClass]];
    end
    dlmwrite('TestPrediction.csv',outputMatrix);
    disp('DONE!!!!');

