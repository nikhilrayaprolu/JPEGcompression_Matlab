function [imDCT] = DCT(im,Fs)
    imDCT = (Fs);
    imDCT = imDCT*double(im);
    imDCT = imDCT/Fs;
end