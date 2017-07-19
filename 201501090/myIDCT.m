function [imageIDCT] = myIDCT(im,Fs)
    imageIDCT = Fs;
    divisor=mtimes(double(im),Fs);
    imageIDCT=mldivide(imageIDCT,divisor);
end