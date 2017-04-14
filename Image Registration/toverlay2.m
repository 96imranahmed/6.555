function out=toverlay(img1, img2, pct, colour, map)
%
% out = toverlay(img1, img2, pct, colour, map)
%
% Given two monochrome images, img1, img2, outputs a combined image
% with img2 overlaid in colour with transparency pct
% Images are scaled first. 
%
% Map, if non-zero, is a colormap applied to the data. 
%
% Colour is a 1x3 matrix with RGB components of desired overlay colour
%
% steve sawiak, 24 july 2006
%

out = zeros(size(img1,1),size(img1,2),3);

% normalise both images
% if(max(img2(:))~=0)
%    img2 = img2 / max(img2(:));
% end;
if(max(img1(:))~=0)
    img1 = img1 / max(img1(:));
end;

%img2 = img2 * (mean(img1)/mean(img2));

%indx = 0.6;
%indx = 0.8;
indx = 1-pct;
if(length(map(:))>1)
    img2 = floor(img2*length(map))+1;
    img2 = ind2rgb(img2,map);
    
    out(:,:,1) = (indx) * img1 + (pct)*img2(:,:,1);
    out(:,:,2) = (indx) * img1 + (pct)*img2(:,:,2);
    out(:,:,3) = (indx) * img1 + (pct)*img2(:,:,3);
    
    out(find(out<0)) = 0;
    out(find(out>1)) = 1;
else
    
out(:,:,1) = (0.8) * img1 + colour(1)*(pct)*img2;
out(:,:,2) = (0.8) * img1 + colour(2)*(pct)*img2;
out(:,:,3) = (0.8) * img1 + colour(3)*(pct)*img2;

out = out/max(out(:));


end

return;


