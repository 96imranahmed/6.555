% Date: Jan/20/2016;
% Mutual information calculation. Assumes image input between 0 and 255!
% mi4.m

function [nmi, mi, je] = mi4(img1, img2, varargin)

bins1 = 32;
if nargin > 2
    bins1 = varargin{1};
end
if nargin > 3
    bins2 = varargin{2};
else
    bins2 = bins1;
end

shift1 = 8 - log2(bins1); % 8 = log2(256);
shift2 = 8 - log2(bins2);

img1 = floor(255*img1/max(img1(:)));
img2 = floor(255*img2/max(img2(:)));

% Now form a sum of both by scaling the first image (dividing by 256/bins1) and
% then adding the second image, after doing: bins2*(image/(256/bins1)), so
% that the first image has a range 0-bins1, and the second one 
% bins1*(0 - bins2):
suma =   bitshift(img1, -shift1) + bitshift(bitshift(img2, -shift2), 8-shift1);
% Another way to do the same!
% aux1 = floor((bins1)*img1/max(img1(:))); aux1(find(aux1==bins1)) = bins1-1;
% aux2 = floor((bins2)*img2/max(img2(:))); aux2(find(aux2==bins2)) = bins2-1;
% aux3 = floor(aux2*bins1);
% suma = aux1 + aux3;

edges = [0 : bins1*bins2-1];

histo = histc(suma(:), edges);

sh = sum(histo);
if sh > 0
    histo = histo/sh; % Convert it into a probability!
else
    histo = 1; % If sum == 0 then make histo = 1!;
end

histo2 = histo(find(histo)); % Only the non-zero probabilities contibute!
je = -sum(histo2.*log2(histo2)); % Joint Entropy! =  Hab;

% Now we need the Marginal Entropies:
histo = reshape(histo, [bins1, bins2]);
%figure, imagesc(histo); colormap(gray);
pa = sum(histo,2); pa = pa(find(pa)); ha = -sum(pa.*log2(pa));
pb = sum(histo,1); pb = pb(find(pb)); hb = -sum(pb.*log2(pb));

mi = ha + hb - je;
nmi = (ha + hb)/je;

return
