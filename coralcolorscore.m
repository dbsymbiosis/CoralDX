 clc;clear;

for filename=1:3
    path = 'C:/Repos/yolov4-custom-functions/detections/crop/Pacuta56/coral_%d.png';
    file_path = sprintf(path, filename);
    I = imread(file_path);
    figure;
    imshow(I);
    title('Original image');


    grayI=rgb2gray(I);
    %figure;
    %imshow(grayI);
    %title('Gray image');


    [~,threshold] = edge(grayI,'sobel');
    fudgeFactor = 0.3;
    BWs = edge(grayI,'sobel',threshold * fudgeFactor);
    %figure;
    %imshow (BWs);
    %title('Sobel Filter');


    %dilated
    se90 = strel('line',3,90);
    se0 = strel('line',3,0);
    BW2dil = imdilate(BWs,[se90 se0]);

    se90 = strel('line',3,90);
    se0 = strel('line',3,0);
    BW2dill = imdilate(BW2dil,[se90 se0]);
    %figure;
    %imshow(BW2dill);
    %title('Dilated');

    %filled holes
    BW2fill = imfill(BW2dill,'holes');
    %figure;
    %imshow(BW2fill);
    %title('filled holes');

    %clearborder
    BW2noborder = imclearborder(BW2fill,1);
    %figure;
    %imshow(BW2noborder);
    %title('cleared border');


    %erode
    seD = strel('diamond',1);
    BWfinal1 = imerode(BW2noborder,seD);
    BWfinal2 = imerode(BWfinal1,seD);
    BWfinal3 = imerode(BWfinal2,seD);
    BWfinal4 = imerode(BWfinal3,seD);
    BWfinal5 = imerode(BWfinal4,seD);
    %figure;
    %imshow(BWfinal5);
    %title('segmented ');


    %labeloverlay
    %figure;
    %imshow(labeloverlay(I,BWfinal5));
    %title('Mask Over Original Image');


    %mask on original image 1
    mask = BWfinal5;
    new_image1 = I;
    new_image1(~mask)=255;
    maskedRgbImage1 = bsxfun(@times, new_image1, cast(mask, 'like', new_image1));
    figure;
    imshow(maskedRgbImage1);
    title('masked Rgb image');

    r1 = maskedRgbImage1(:,:,1);
    g1 = maskedRgbImage1(:,:,2);
    b1 = maskedRgbImage1(:,:,3);
    rcoral = mean(nonzeros(r1(:)));
    gcoral = mean(nonzeros(g1(:)));
    bcoral = mean(nonzeros(b1(:)));


    % rgb blocks
    R = imread('C:/Repos/yolov4-custom-functions/detections/crop/Pacuta9/B_1.png');
    %figure
    %imshow(R)
    %title('R')
    rR = R(:,:,1);
    Rbox = mean(rR(:));
    G = imread('C:/Repos/yolov4-custom-functions/detections/crop/Pacuta9/G_1.png');
    %figure
    %imshow(G)
    %title('G')
    gG = G(:,:,2);
    Gbox = mean(gG(:));
    B = imread('C:/Repos/yolov4-custom-functions/detections/crop/Pacuta9/R_1.png'); 
    %figure
    %imshow(B)Pacuta2
    %title('B')
    bB = B(:,:,3);
    Bbox = mean(bB(:));

    Normalizationr = rcoral/Rbox;
    Normalizationg = gcoral/Gbox;
    Normalizationb = bcoral/Bbox;

    %A(Normalizationr,:)=
    %B(Normalizationg,:)=
    %C = [C,Normalizationb];

    fprintf('rcoral=%f\n', rcoral);
    fprintf('gcoral=%f\n', gcoral);
    fprintf('bcoral=%f\n', bcoral);


end
   fprintf('rbox=%f\n', Rbox);
   fprintf('gbox=%f\n', Gbox);
   fprintf('bbox=%f\n', Bbox);




