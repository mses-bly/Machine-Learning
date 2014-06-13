function [] = drawImage( bit_vector , image_size)
%Takes a bitmap description of the image and its size and draws the image.
matrix = vec2mat(bit_vector,image_size);
matrix = mat2gray(matrix);
imshow(matrix);
end

