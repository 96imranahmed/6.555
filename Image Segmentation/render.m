%RENDER  Perform 3D brain surface rendering
%  This file contains a quick hack for doing a simple 3d surface rendering of a
%  portion of the top of the white matter structure.
%
%  The strategy that is used is to walk through the labelled slices, and for
%  each one, build a 1D array that indicates the "altitude" (y - coordinate) of
%  the highest white matter.
%
%  These 1D arrays are collected into a 2D array, and the graph of that
%  structure ("tmpmins") corresponds to an altitude map for the white matter.

%  The graph is rendered in 3d with realistic shading, and 3D interaction is
%  enabled so that the operator can flip it round with the mouse.
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
LABEL_WHITE = 8;
LABEL_GRAY = 4;
LABEL_CSF = 5;


% Perform surface rendering
%--------------------------
for i = TEST_SLICES
    in_fn = sprintf('%s.%0.3d', BRAIN_PREFIX, i);
    img =(mri_read(in_fn));
    if plot_figures
        figure(1);
        display_image(img, 'brain slice');
        figure(2); display_image(img == LABEL_WHITE);
        fprintf(1, 'Hit any Key to continue\n');
        pause();
    end
    
    tmp= (img == LABEL_WHITE);
    tmp = double(tmp);
    [r,c] = find(tmp);
    tmp(find(tmp)) = r;
    tmp(find(tmp==0)) = Inf;
    tmpmins(i,:) = min(tmp,[],1);

end;

% Plot 3D surface
%----------------
surfl(0-tmpmins(TEST_SLICES,:));
shading interp;
colormap(pink);
axis('equal');
rotate3d;
