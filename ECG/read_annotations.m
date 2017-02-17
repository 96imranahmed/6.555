function [sample,marker] = read_annotations(annotation_file)
%READ_ANNOTATIONS  Read annotation file into MATLAB
%  [SAMPLES,MARKERS] = READ_ANNOTATIONS('ANNOTATION_FILE') reads and parses the
%  contents of annotation file 'ANNOTATION_FILE' (atr_nxxx.txt) into output
%  vectors SAMPLE and MARKER. SAMPLE is a numeric vector which contains the
%  corresponding position of each ECG rhythm marker. MARKER is a cell vector
%  which contains the corresponding ECG rhythm at each point indicated by the
%  SAMPLE vector. 
%
%  Note that each sample/marker combination indicates the start of the indicated
%  rhythm.

%  Author: Eric Weiss
%  Last Modified: 3/4/06, 4:30pm

% Input argument checking
%------------------------
if nargin == 0
    error('You must enter an annotation file to read into MATLAB.');
end;
if ~exist(annotation_file,'file')
    error('The file you entered could not be found.');
end;

% Read file
%----------
txtdata = textread(annotation_file,'%s','whitespace','\n','headerlines',2);

% Parse file
%-----------
for i = 1:length(txtdata)
    str = strread(txtdata{i},'%s');
    if length(str) == 7
        sample(i) = str2num(str{2});
        marker{i} = str{7}(2:end);
    end;
end;

% Prepare outputs
%----------------
sample = sample';
marker = marker';
