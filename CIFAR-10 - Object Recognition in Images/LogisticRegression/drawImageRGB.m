function [] = drawImageRGB( bit_vector , image_size)

C = reshape (bit_vector, [3 image_size*image_size]);
C = reshape (C, [3 image_size image_size]);
C = permute(C, [3 2 1]);
image(C);
end

