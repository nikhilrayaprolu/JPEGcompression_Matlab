image = imread('LAKE.TIF');

j=1;


while j <= 3
    F = dctmtx(8);
    if j==1
        leftlimit=420;
        rightlimit=45;
    elseif j==2
        leftlimit=427;
        rightlimit=298;
    else j==3
        leftlimit=30;
        rightlimit=230;
        
    end
    outputimage = image(leftlimit:(leftlimit+7),rightlimit:(rightlimit+7))
    sum=127;
    outputDCT = myDCT(outputimage-sum,F)
    c=2;
    qm(1,:) = [16 11 10 16 24 40 51 61];
    qm(2,:) = [12 12 14 19 26 58 60 55];
    qm(3,:) = [14 13 16 24 40 57 69 56];
    qm(4,:) = [14 17 22 29 51 87 80 62];
    qm(5,:) = [18 22 37 56 68 109 103 77];
    qm(6,:) = [ 24 35 55 64 81 104 113 92];
    qm(7,:) =[49 64 78 87 103 121 120 101];
    qm(8,:) =[72 92 95 98 112 100 103 99];
    quantisedDCT = myDCT_quantization(outputDCT,qm,2)
    c=2;
    dequantisedqDCT = myDCT_dequantization(quantisedDCT,qm,c);
    sum=127;
    reconstructed = myIDCT(dequantisedqDCT,F)+sum
    figure;
    subplot(1,2,1);
    imshow(uint8(outputimage));
    title(j);
    subplot(1,2,2);
    imshow(uint8(reconstructed));
    title(j);
    j=j+1;
    error = RMSE(double(outputimage),double(reconstructed))
    
end
