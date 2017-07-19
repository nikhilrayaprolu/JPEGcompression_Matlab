outputimage = imread('LAKE.TIF');

outputpart = ones([1,size(outputimage,1)/8])*8;
outputpatchs = mat2cell(outputimage,outputpart,outputpart);
kk = 1:10;
for kcheck = kk
    temporary_patchs = outputpatchs;
    F = dctmtx(8);

    for j = 1:numel(outputpatchs)
        sum=127;
        DCT = myDCT(outputpatchs{j}-sum,F);
        
    qm(1,:) = [16 11 10 16 24 40 51 61];
    qm(2,:) = [12 12 14 19 26 58 60 55];
    qm(3,:) = [14 13 16 24 40 57 69 56];
    qm(4,:) = [14 17 22 29 51 87 80 62];
    qm(5,:) = [18 22 37 56 68 109 103 77];
    qm(6,:) = [ 24 35 55 64 81 104 113 92];
    qm(7,:) =[49 64 78 87 103 121 120 101];
    qm(8,:) =[72 92 95 98 112 100 103 99];
        c=kcheck;
        quantisedDCT = myDCT_quantization(DCT,qm,c);
        c=kcheck;
        dequantisedqDCT = myDCT_dequantization(quantisedDCT,qm,c);
        sum=127;
        temporary_patchs{j} = myIDCT(dequantisedqDCT,F)+sum;
    end
    temporary_patchs = cell2mat(temporary_patchs);
    temp_p = temporary_patchs;
    rmserror(c) = RMSE(double(I),double(temp_p));
    entro(c) = My_entropy(uint8(temp_p));
    
    figure;
    imshowpair(outputimage,temporary_patchs,'montage');
    
    title(['c=',num2str(kcheck)]);
end