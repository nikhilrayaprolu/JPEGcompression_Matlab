im =imread('sample.jpg');
YCBCR = rgb2ycbcr(im);
CR=0;
CR= YCBCR(:,:,3);
CB=0;
CB= YCBCR(:,:,2);
Y=0;
Y = YCBCR(:,:,1);

%First add noise to components

%Add noise to Y component
temp2=CB;
temp1=imnoise(Y,'gaussian');

	temp3=CR;
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
temp1=0
temp2=0
temp3=0
disp('next image')
figure;
imshow(rec1);
title('Added noise to y');

%add noise to y ,cb
temp1=imnoise(Y,'gaussian');
temp3=CR;
temp2=imnoise(CB,'gaussian');
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
temp1=0
temp2=0
temp3=0
disp('next image')
figure;
imshow(rec1);
title('Added noise to y and cb');

%add noise to y,cr
temp1=imnoise(Y,'gaussian');
temp2=CB;
temp3=imnoise(CR,'gaussian');
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
temp1=0
temp2=0
temp3=0
disp('next image')
figure;
imshow(rec1);
title('added noise to y and cr');


%add noise to cb
temp1=0

temp1=Y;
temp2=0

temp2=imnoise(CB,'gaussian');
temp3=0

temp3=CR;

rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
disp('next image')
figure;
imshow(rec1);
title('added noise to cb');

%add noise to cr
temp1=Y;
temp3=imnoise(CR,'gaussian');
temp2=CB;
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
temp1=0
temp2=0
temp3=0
disp('next image')
figure;
imshow(rec1);
title('added noise to cr');

%add noise to cb,cr
temp1=0
temp1=Y;
temp3=0

temp3=imnoise(CR,'gaussian');
temp2=0

temp2=imnoise(CB,'gaussian');
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
disp('next image')
figure;
imshow(rec1);
title('added noise to cb,cr');

%add noise to y,cb,cr
temp1=0;
temp1=imnoise(Y,'gaussian');
temp2=0;
temp2=imnoise(CB,'gaussian');
temp3=0;
temp3=imnoise(CR,'gaussian');
rec1y=cat(3, temp1, temp2, temp3);
rec1= ycbcr2rgb(rec1y);
disp('next image')
figure;
title('added noise to y,cb,cr');
imshow(rec1);
