clc 
clear all

a=imread('8.jpg');

figure,imshow(a)
sample1={'8.jpg','14.jpg'};
sample2={[103 12 205 387];[246 225 75 131]}
label=table(sample1,sample2)
imdir=fullfile('C:\Users\ZkaiTr\Desktop\deeptranfer')

options=trainingOptions('sgdm','MiniBatchSize',32,'InitialLearnRate',1e-6,'MaxEpochs',20)
train=trainRCNNObjectDetector(label,pp,options,'NegativeOverlapRange',[0 0.3]);
[bbox, score, label] = detect(rcnn, img, 'MiniBatchSize', 32);
[score, idx] = max(score);

bbox = bbox(idx, :);
annotation = sprintf('%s: (Confidence = %f)', label(idx), score);

detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, annotation)

figure
imshow(detectedImg)