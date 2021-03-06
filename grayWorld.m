function [ out ] = grayWorld( img )
%GRAYWORLD color balancing relying on the gray world assumption.
%   assumes that the average color in any image is grey. 
%   It transforms the input image to match this assumption
%   @param img is a (m x n x 3) double valued color img in rgb colorspace
%   @param out color balanced input img based in gray world assumption.

    avgR = mean(mean(img(:,:,1)));
    avgG = mean(mean(img(:,:,2)));
    avgB = mean(mean(img(:,:,3)));
    
    grayValue = (avgR + avgG + avgB)/3;
    
    scaleR = grayValue./avgR;
    scaleG = grayValue./avgG;
    scaleB = grayValue./avgB;
    
    % scaleR = scaleR./scaleG;
    % scaleG = scaleG./scaleG; % equal to 1
    % scaleB = scaleB./scaleG;
    
    scaledR = img(:,:,1).*scaleR;
    scaledG = img(:,:,2).*scaleG;
    scaledB = img(:,:,3).*scaleB;
    
    out = mat2Img(scaledR,scaledG,scaledB);
    
end

