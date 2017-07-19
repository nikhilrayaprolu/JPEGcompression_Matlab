function [x] = RMSE(image1,image2)
   
    x = sqrt(sum(sum((image1-image2).^2)));
    
end