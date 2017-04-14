% [interp_image] = afftrans_mit(imagein, paramsin)
%
% A = 2D image for transformation 
% 
% B - a seven parameter vector:  
%  1, 2:    translations in x and y
%  3:       rotation anticlockwise about the origin (degrees)
%  4, 5:    scale factors in x and y direction (100% = 1)
%  5, 7:    shearing values in the x and y directions
% 
% Transformations applied in order:
% Translate, Scale, shear, rotate
%
% Returns cubic interpolated image of same dim as input image
%
function [interp_image] = afftrans_mit(A, B, varargin)

xt = B(1); yt = B(2);
r = B(3);
xs = 1/(B(4)+1e-6);
ys = 1/(B(5)+1e-6);
%xs = B(4); % David
%ys = B(5); % David
sha = B(6);
shb = B(7);

h = size(A, 1);
w = size(A, 2);


% Extracting all the conversion matrix:

% convert the rotation angles
theta = r * 2*pi/360; % David.

% convert centering parameters into offsets [mm] in coordinate system centred around the translated origin
x_c = (w+1)/2; % Orig
y_c = (h+1)/2; % Orig


% Scaling matrix
S = [ xs 0 0; 0 ys 0; 0 0 1]; % Orig;
%S = [ xs sha 0; shb ys 0; 0 0 1]; % Both Scale and Shear at the same time!

% Translation matrix
T = [ 1 0 (-xt); 0 1 (-yt); 0 0 1];

% Centering matrix
C = [ 1 0 -(x_c); 0 1 -(y_c); 0 0 1];
Ci = [ 1 0 (x_c); 0 1 (y_c); 0 0 1];
% Rotation matrices
THETA = [cos( theta ) sin( theta ) 0; -sin( theta ) cos( theta ) 0; 0 0 1];

% Assemble the transformation matrix
Sh = [1 sha 0; shb 1 0; 0 0 1]; % Independent shear!

%SS: changed M so translation happens first, removed centering term 
%M = T * THETA* Sh * S * C;

%M = Ci * THETA * T * S * Sh * C; % Orig
M = Ci * S * Sh * THETA * T * C; % David 2016
%M = C * S * Sh * THETA * T;
%M = T*THETA*S*C;

%M = inv(M); % Inverting the matrix!

% Original positions:
[x, y] = meshgrid(1:w, 1:h);
% [x, y, z] = meshgrid((1:xndim)-tb_x_c +x_c, (1:yndim)-tb_y_c +y_c, (1:zndim)-tb_z_c+z_c);
% Reshaping into vectors:
x_r = reshape(x, [1 h*w]);
y_r = reshape(y, [1 h*w]);

P = [x_r; y_r; ones(1, w*h)];

% Rotating the positions:
B = M*P;

% Applying the inverse translation;
xi = B(1, :);
yi = B(2, :);

% Target points to interpolate in 3D:
xi = reshape(xi, [h, w]);
yi = reshape(yi, [h, w]);

interp_image = interp2(A, xi, yi, 'linear', 0);

return


  