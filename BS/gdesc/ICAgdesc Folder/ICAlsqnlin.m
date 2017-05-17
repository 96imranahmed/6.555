% Toy code to implement a nonlinear gradient descent to maximize kurtosis
% i.e. - simple ICA

% delete the last error log if it exists
 fid = fopen('error.log','w');
 fclose(fid);



% load data - random mixture of Gaussian noise and  
load Xnew.dat;

    subplot(2,1,1)
    plot(Xnew(1,:)); 
    axis([1 length(Xnew(1,:)) -inf inf])
    title(['Two-channel mixture of ECG and noise \kappa=(3.2, 7.3)']);
    ylabel('ECG 1 (mV)');
    subplot(2,1,2)
    plot(Xnew(1,:))    
    axis([1 length(Xnew(1,:)) -inf inf])
    ylabel('ECG 2 (mV)');
    xlabel('samples')
    
    fprintf('Press any key to start the Blind Source Separation\n')
    pause
% intialise the transformation (demixing) matrix with small random
% numbers, of the dimensionality of the inputs
W_init=abs(randn(2,2));
W_init=W_init./(10*max(max(W_init)));

% set options for gradient descent
OPTIONS = optimset('MaxIter',100,'LargeScale','off','Algorithm','levenberg-marquardt');

tic % start timer

% perform nonlinear descent with cost function Wtrans
[W,RESNORM,RESIDUAL,EXITFLAG, O] = lsqnonlin( @Wtrans, W_init ,[],[], OPTIONS , Xnew, 0);
toc % end timer and print time elapsed for gradient descent

% take final demixing matrix and unmix observations, X.
Y=W*Xnew;

% What was the final cost function value?
k(1)=(eps + abs(kurtosis(Y(1,:))-3));
k(2)=(eps + abs(kurtosis(Y(2,:))-3));

error = [(1./k(1))  (k(2))];

% Remove error log so that it does not get appended to on next run
%!del error.log

% Plot final data

% figure
%    subplot(2,1,1)
%     plot(Y(1,:)); 
%     title(['e= ' num2str(error) ' w = ' num2str(W(1,1)) ' ' num2str(W(1,2)) ' ' num2str(W(2,1)) ' ' num2str(W(2,2)) ' ']);
%     ylabel(['k= ' num2str(k(1))]);
%     subplot(2,1,2)
%     plot(Y(2,:))    
%     ylabel(['k= ' num2str(k(2))]);

