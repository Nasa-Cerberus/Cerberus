I = imread("A tidal wave of plastic.jpg");
I = imresize(I, [224 224]);
[YPred,probs] = classify(trainedNetwork_1,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");