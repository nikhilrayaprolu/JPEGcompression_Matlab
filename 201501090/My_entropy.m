function [E] = My_entropy(im)
    probability = imhist(im);
    probability = probability/numel(im);
    probability = probability(find(probability));
    probability = -1*probability;
    probability = probability.*log2(probability);
    E = sum(probability);
end