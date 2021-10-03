
 matlabpath='C:\Users\ZkaiTr\Desktop\deeptransfer';

 data=fullfile(matlabpath,'train_data');

 train=imageDatastore(data,'IncludeSubfolders',true,'LabelSource','foldernames');

 count=train.countEachLabel;

 net=alexnet;


layers=[imageInputLayer([480 640 3])

 net(2:end-3)

 fullyConnectedLayer(1)

 softmaxLayer 

 classificationLayer 
 ];


 opt=trainingOptions('sgdm','Maxepoch',1,'InitialLearnRate',0.0001);

 training=trainNetwork(train,layers,opt);
 
  a=imread('14.jpg');

  out=classify(training,a);

  figure,imshow(a)
  title(string(out))
msgbox(string(out))




[bbox ,score,label]=detect(train,a,'MiniBatchsize',32);
[score,idx]=max(score);
