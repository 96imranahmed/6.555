function plot3ch(X,Fs,plot_title)
%PLOT3CH  Plot 3 channel data in the time-domain and on a 3D scatter plot
%  PLOT3CH(X,FS,'TITLE') plots the three columns of data matrix X on a
%  time-domain plot with sample rate FS on and plots each column against the
%  other on a 3D scatter plot. The default value for FS is 256 Hz. The optional
%  'TITLE' input allows the user to specify the plot title string.
% Created by: G.D. Clifford 2004 gari AT mit DOT edu
% Modified 5/6/05, Eric Weiss. Documentation updated. Plot title input added.
% Input argument checking
%------------------------
if nargin < 2
    Fs = 256;
end;
if nargin < 3
    plot_title = '3 Channel Data';
end;
[M,N] = size(X);
if N ~= 3;
    error('Input matrix must have 3 columns!');
end;
% Generate time-domain plot
%--------------------------
t = [1/Fs:1/Fs:M/Fs];
figure;
for i = 1:N
    subplot(N,1,i)
    plot(t,X(:,i)); ylabel(['Ch',int2str(i)]);
    axis([0 max(t) min(X(:,i))-abs(0.1*max(X(:,i))) max(X(:,i))+abs(0.1*max(X(:,i)))]);
    %axis([0 max(t) min(X(:,i)) max(X(:,i))])
end;
xlabel('Time (sec)');
subplot(N,1,1); title(plot_title);
figure;
plot3(X(:,1), X(:,2), X(:,3),'.m');
xlabel('Ch1'); ylabel('Ch2'); zlabel('Ch3');
title(plot_title);
grid on;