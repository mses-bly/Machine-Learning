    function [] = createSubmission( Theta )
    %CREATESUBMISSION Create a submission matrix

    folder = 'D:\Moises\Proyectos\Machine_Learning\CIFAR-10 - Object Recognition in Images\test';

    outputMatrix = [];
    j = 1;
    for i = 1:300000
        img_path = strcat(folder,'\');
        img_path = strcat(img_path,num2str(i));
        img_path = strcat(img_path,'.png');
        image = im2double(rgb2gray(imread(img_path)));
        image = image';
        image = image(:);
        [X_norm, mu, sigma] = featureNormalize(image);
        imageClass = predictOneVsAll( X_norm',Theta );        
        outputMatrix = [outputMatrix;[i,imageClass]];
    end
    dlmwrite('TestPrediction.csv',outputMatrix);
    disp('DONE!!!!');

