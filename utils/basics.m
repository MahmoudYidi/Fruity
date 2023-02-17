%%%%%% BASIC IMAGE PROCESSING MATLAB FUNCTIONS %%%%%%%%%%%%%%


% Specify the input and output file names
input_filename = 'input_image.jpg';
output_filename = 'output_image.jpg';

% Read the input image
input_image = imread(input_filename);

% Resize the image
resized_image = imresize(input_image, [256, 256]);

% Apply a colormap to the image
colormap_image = ind2rgb(gray2ind(input_image, 256), jet(256));

% Multiply the pixel values by 10
multiplied_image = uint8(double(input_image) * 10);

% Write the output image to a file
imwrite(input_image, output_filename);

% Display the output image
imshow(input_image);