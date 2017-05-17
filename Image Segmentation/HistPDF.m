function [pdf,x] = HistPDF(data, num_bins, min_max)
%HISTPDF  Create a PDF from input data using a histogram approach (template)
%   [PDF,X] = HISTPDF(DATA,NUMBINS,MIN_MAX) estimates the probability density
%   function for input vector DATA using a histogram approach with the number of
%   histogram bins set by NUM_BINS. The optional input MIN_MAX is a size-two
%   vector that specifies the minimum and maximum allowable data range to
%   include in the histogram estimation, i.e. [MIN,MAX]. The default value for
%   MIN_MAX is the minimum/maximum values of the range of input DATA.
%
%   Using a histogram approach, here the output PDF is actually a probability 
%   mass function that sums to 1. The output X are the corresponding range 
%   values, such that PDF = pdf(X). You can subsequently plot your PDF by: 
%   plot(x,pdf).
%
%   You are responsible for updating this function to make it fully operational.
%   Take bin widths into account when normalizing your histogram to make the
%   output probability mass function. 

% Last Modified: 5/03/15, Kevin Chen


% Input argument checking
%------------------------
if nargin < 2
    error('HISTPDF: You must enter data and number of bins.');
end;
if nargin < 3
    min_max = [min(min(data)),max(max(data))];
end;
% Specify bin centers
%--------------------
% bin_centers is a vector of length num_bins that specifies the centers of all
% histogram bins. This will be one of your inputs to hist.m.
bin_centers = min_max(1):(min_max(2)-min_max(1))/num_bins:min_max(2);
bin_centers = bin_centers + (min_max(2)-min_max(1))/(2*num_bins);
bin_centers = bin_centers(1:end-1);
% Call the HIST function
%-----------------------
%  bin_counts is a vector that holds the number of data values that correspond
%  to each bin
bin_counts = hist(data, bin_centers);

% Normalization factor
%---------------------
% Establish a normalization factor so that the returned PDF integrates (sums) to
% one. Remember to take bin widths into account.
% disp(bin_counts)
normalization = sum(bin_counts * (min_max(2)-min_max(1))/num_bins);

% Return PDF and X
%-----------------
% Normalize your pdf, and specify your pdf range X.
pdf = bin_counts / normalization;
x = bin_centers;


