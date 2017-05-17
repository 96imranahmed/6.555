function error = Wtrans(W, X, plotflag)
% error = Wtrans(W, X, plotflag, cost_fn)
%
% function to calculate the maximum non-Guassianity of the columns of X 
% given a transformation matrix W
% 
% Gari D. Clifford, gari AT alum DOT mit DOT edu , March 2008

if nargin < 2
 plotflag=0;
end

errorlog = 1; % if ==1 then generate an error log 

plotflag = 1; %if ==1 then plot it as it goes

%cost_fn=1; % try to make kurtosis maximally positive
cost_fn =2; % else ignore the sign of the Gaussianity

X=X(:,:);

[M1 M2] = size(W);

%W= W + randn(M1,M2);
Y = W*X;

% make cost function inversely proportional to the kurtosis 
% take off 3 to make Kurtosis zero and use eps to avoide divide by zero
if(cost_fn==1)
    k(1)=(eps + (kurtosis(Y(1,:))-3));
    k(2)=(eps + (kurtosis(Y(2,:))-3));
    error = [(1./k(1))  (1./k(2))];
else % make cost function inversely proportional and proportional to the kurtosis 
    k(1)=(eps + abs(kurtosis(Y(1,:))-3));
    k(2)=(eps + abs(kurtosis(Y(2,:))-3));
    error = [(1./k(1))  (k(2))];
% Notice that we are maximizing Kurtosis for one channel and minimizing for 
% the other channel. - separates one Guassian and one non-Gaussian component
end

% write gradient descent error to a log file
if (errorlog==1)
 fid = fopen('error.log','a');
 fprintf(fid,'%f %f\n',error(1),error(2));
 fclose(fid);
end

 
% plot each iteration of the gradient descent and puase for 100ms

if(plotflag==1)                        
    
    subplot(3,1,1)
    plot(Y(1,:)); 
    axis([1 length(Y(1,:)) -inf inf])
    title([' W= ' num2str(W(1,1)) ' ' num2str(W(1,2)) ' ' num2str(W(2,1)) ' ' num2str(W(2,2)) ' ']);
    ylabel(['k= ' num2str(k(1))]);
    subplot(3,1,2)
    plot(Y(2,:))    
    axis([1 length(Y(1,:)) -inf inf])
    ylabel(['k= ' num2str(k(2))]);
    xlabel('samples')
    subplot(3,1,3)
    err = load('error.log');
    %plot(err,'-o') % plot both error functions
    plot(sum(err'),'-o') % plot the sum of the 2 errors
    xlabel('iterations')
    %ylabel(['e= ' num2str(error(1)) ' ' num2str(error(2))]);
    ylabel(['e= ' num2str(error(1)+error(2))]);
    axis([1 length(err) 0 8])
        %plot(log10(err),'-o')
        %xlabel('iterations')
        %ylabel(['e= ' num2str(error(1)) ' ' num2str(error(2))]);
        %axis([1 length(err) -inf log10(10)])
    pause(0.1);


% Code to turn this into a movie
    
% if(~exist('ecgfit.avi','file'))
%  num_frames_per_second=2;
%  aviobj = avifile ('ecgfit.avi', 'fps', num_frames_per_second ); 
%  save aviobj aviobj;
% end
% if(exist('ecgfit.avi','file'))
%  load aviobj
% end
 
%  clf
%  plot(ecg_desired)
%  hold on
%  plot(gSum,'r')
%  axis([0 400 -10 40])
%  pause(0.00001)

% % frame = getframe(gca);
% % aviobj = addframe(aviobj,frame);

% skip =1;

%   load n; load nn; % counter to track where we are
%    fdirout = 'ppmmovie';
%    fbaseout = 'frame';
% %   filename = [fdirout, '\', fbaseout, int2str(n), '.ppm']; %'
% %   filename = [fbaseout, int2str(n), '.ppm']; 
% %   print ('-dppmraw', filename);
%    if(n==nn*skip)
%     filename = [fbaseout, int2str(nn), '.jpg'];
% 		       % include this line if you want to make a movie then use jpeg2avi (see below)
% %    print ('-djpeg', filename);
%     nn=nn+1;
%     save nn nn;
%    end
%    n=n+1;save n n;

end



% To create movie sequence from jpegs use 
% for(i=1:32);imglist(i).name=strcat('movie',num2str(i),'.jpg');end
% jpeg2avi('normalQRSnoNoise2.avi','',imglist, 2,'Cinepak');   
