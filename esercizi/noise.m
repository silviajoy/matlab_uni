
img = zeros(30,30);
img(5:24, 13:17)=1.;

noise = imnoise (img, "gaussian", 0, 0.01);

figure, imshow(noise);