%MORPHOLOGY  Isolate brain structure using conditional morphology
%  This function performs brain structure isolation for MRI images using the
%  conditional morphology / largest connected component strategy. Its inputs are
%  MRI image slices that have been classified/labelled as white matter, gray
%  matter, and csf.
%

% Last Modified: 4/20/2016 Christopher L. Dean

plot_figures = false;


% Set path prefixes for the script
%---------------------------------
CLASSIFICATION_PREFIX = 'output/classification';
BRAIN_PREFIX = 'output/brain';
MRI_PREFIX = 'data/swrot/spgr/I';
LABELS_PREFIX = 'data/swrot/segtruth/I';


% Image specifications (do not modify)
%-------------------------------------
TEST_SLICES = 102:190;
LABEL_WHITE = 8; % pixel label/value corresponding to white matter
LABEL_GRAY = 4;  % pixel label/value corresponding to grey matter
LABEL_CSF = 5;   % pixel label/value corresponding to cerebrospinal fluid


%------------------------------
% Post-Process Using Morphology
%------------------------------
for i = TEST_SLICES
    out_fn = sprintf('%s.%0.3d', CLASSIFICATION_PREFIX, i);
    img = mri_read(out_fn);
    brain = (img == LABEL_WHITE | img == LABEL_GRAY);
    brain_eroded = bwmorph(brain, 'erode', 1);
    [cc, num] = bwlabel(brain_eroded);
    if plot_figures
        figure(1); display_image(brain, sprintf('Initial Brain (Image %0.3d)',i));
        figure(4); display_image(brain_eroded, sprintf('Eroded Brain (Image %0.3d)',i));
        figure(5); display_image(cc, sprintf('Connected Components (Image %0.3d)',i));
    end;
    size_cc = zeros(1,num);
    for j = 1:num
        size_cc(j) = length(find(cc==j));
    end
    [Y,I] = sort(size_cc);

    % This code asssumes that after erosion to disconnect the structures,
    % that the brain will be the largest connected component that is
    % found (by the MATLAB function bwlabel).
    % This assumption may fail under some circumstances...

    % Pick the largest connected component
    brain_cc = (cc==I(num));

    if plot_figures
        figure(2); display_image(brain_cc, sprintf('Brain Connected Component (Image %0.3d)',i));
    end;
    % Dilate it conditioned on original image
    brain_dilated = bwmorph(brain_cc, 'dilate', 2);
    brain_conditionally_dilated = double(brain_dilated).*brain;

    %%Put back white and gray labels
    white_matter = zeros(size(img));
    white_matter = brain_conditionally_dilated .* (img == LABEL_WHITE);
    white_matter(find(white_matter)) = LABEL_WHITE;
    gray_matter = zeros(size(img));
    gray_matter = brain_conditionally_dilated .* (img == LABEL_GRAY);
    gray_matter(find(gray_matter)) = LABEL_GRAY;
    out_fn = sprintf('%s.%0.3d', BRAIN_PREFIX, i);
    mri_write(gray_matter+white_matter, out_fn);
    fprintf('Writing %s\n',out_fn);
    if plot_figures
        figure(3); display_image(white_matter+gray_matter,...
            sprintf('Classification for Isolated Brain (Image %0.3d)',i));
        fprintf(1,'Hit any Key to continue\n');
        pause;
    end;
end;
