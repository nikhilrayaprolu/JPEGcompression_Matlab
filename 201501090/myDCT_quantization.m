function [imagequantisedDCT] = myDCT_quantization(imDCT,qm,c)
    imagequantisedDCT = imDCT;
    
       
        imagequantisedDCT = round(rdivide(imagequantisedDCT,qm*c));
    
end