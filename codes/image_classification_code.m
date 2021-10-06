% To test a single image from sample and classify

I = imread("Any test image.jpg");
I = imresize(I, [224 224]);
[YPred,probs] = classify(trainedNetwork_1,I); %select the trained network
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%"); 
