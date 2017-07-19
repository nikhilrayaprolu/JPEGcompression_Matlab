I = imread('LAKE.TIF');
part = ones([1,size(I,1)/8])*8;
ll = 1:10;
for kshift = ll
    F = dctmtx(8);

    patchs = mat2cell(I,part,part);
    temp_p = cell(size(patchs));
    for i = 1:numel(patchs)
        qm(1,:) = [16 11 10 16 24 40 51 61];
    qm(2,:) = [12 12 14 19 26 58 60 55];
    qm(3,:) = [14 13 16 24 40 57 69 56];
    qm(4,:) = [14 17 22 29 51 87 80 62];
    qm(5,:) = [18 22 37 56 68 109 103 77];
    qm(6,:) = [ 24 35 55 64 81 104 113 92];
    qm(7,:) =[49 64 78 87 103 121 120 101];
    qm(8,:) =[72 92 95 98 112 100 103 99];

        DCT = myDCT(patchs{i}-127,F);
        c=kshift;
        qDCT = myDCT_quantization(DCT,qm,c);
        c=kshift;
        dqDCT = myDCT_dequantization(qDCT,qm,c);
        sum=127;
        temp_p{i} = myIDCT(dqDCT,F)+sum;
    end
    
    temp_p = cell2mat(temp_p);
    rmserror(kshift) = RMSE(double(I),double(temp_p));
    entro(kshift) = My_entropy(uint8(temp_p));
    
end
plot(entro,rmserror,'.');
rmserror
entro