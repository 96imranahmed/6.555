function plot3dv(v, s, col)
%PLOT3DV  Plots the specified vector onto a 3D scatter plot
%  PLOT3DV(V, S, 'COL') plots the eigenvector +/-V with singular value S and
%  color 'COL' onto a 3D plot of the currently displayed figure. The length of
%  the plotted eigenvector is equal to the square root of the singular value. If
%  the singular value S is not specified, the default scaling length is 10. If
%  the color 'COL' is not specified, the default color is 'k' (black).

% Created by: GD Clifford 2004 gari AT alum DOT mit DOT edu
% Last modified 5/7/06, Eric Weiss. Documentation updated.

% Input argument checking
%------------------------
if nargin < 2 | isempty(s)
    s = 100;
end;
if nargin < 3
    col = 'k';
end;
v = v(:); % ensure that eigenvector is in column format
[m, n] = size(v);
if (n ~= 1 | m ~= 3)
    error('vector must be 3x1')
end;
if s == 1  % legacy code: does not affect function
    ln = 1/sqrt((v(1)*v(1))+(v(2)*v(2))+(v(3)*v(3)));
end;

% Plot eigenvector on 3D plot
%----------------------------
sn = sqrt(s);
hold on;
plot3(sn*[-1*v(1) v(1)],sn*[-1*v(2) v(2)],sn*[-1*v(3) v(3)],col);
grid on;
