function [imageDCT] = myDCT_dequantization(imqDCT,qm,c)
    qm = qm*c;
    imageDCT = times(imqDCT,qm);
end