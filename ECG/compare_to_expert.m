function [error] = compare_to_expert(fileno)
% COMPARE_TO_EXPERT  Evaluates error of the arrhythmia detector on a file
%
% Input:
%   - fileno: the number of the file (i.e. 424 for file and 'n_424.mat'
%             and 'atr_n424.txt')
% Output:
%   - error: a signal the same length as the source with a 1 wherever the
%            system produced a false positive, a 0 wherever there was no
%            error, and a -1 wherever there was a false negative
%
%
% Written 04/10/2014 by Christopher Dean
%

if nargin < 1
    fileno = 424; % default file number
end

Fs = 250; % signals are all sampled at 250 Hz

%--- Run student's VA detector -------------------------------------------%
res = load(sprintf('data/n_%d.mat',fileno));
x = res.(sprintf('n_%d',fileno));
[alarm_system,t] = va_detect(x,Fs);


%--- Obtain Expert Analysis ----------------------------------------------%

% get whether the system should alarm for all samples in the signal
alarm_expert = parse_expert_analysis(fileno,numel(x));

% sample the expert annotation at the same indices as the detector output
alarm_expert = alarm_expert(t*Fs);

% optionally, smooth by median filtering
% alarm_expert = medfilt1(double(alarm_expert),5);


%-- Compare system performance -------------------------------------------%

% compute error, where false positives = +1 and false negatives = -1
error = alarm_system - alarm_expert;
% sse = sum(abs(error));

% Plot the system and its performance
figure
subplot(311), stem(t,alarm_system), axis([1 max(t) -0.5 1.5]), grid on, ...
    set(gca,'YTick',[0 1], 'YTickLabel',{'off','on'}), ...
    ylabel('Automated Alarm'), title(sprintf('File %d', fileno));
subplot(312), stem(t,alarm_expert), axis([1 max(t) -0.5 1.5]), grid on, ...
    set(gca,'YTick',[0 1], 'YTickLabel',{'off','on'}), ylabel('Expert Alarm');
subplot(313), stem(t, error), axis([1 max(t) -1.5 1.5]),  grid on, ...
    set(gca,'YTick',[-1 1], 'YTickLabel',{'MD','FA'}), ylabel('Error'),
xlabel('Frame Number');

%-------------------------------------------------------------------------%
% Auxiliary Functions
%-------------------------------------------------------------------------%

    function alarm_vector = parse_expert_analysis(fileno,L)
        % INPUTS:
        % fileno: the number of the file (i.e. 424 for file 'atr_n424.txt')
        %      L: the length, in samples, of the original signal
        % OUTPUT:
        % alarm_vector: a vector of length L where a 1 indicates alarm and
        %               0 indicates no alarm
        
        %-- Obtain expert analysis ---------------------------------------%
        
        % Read through the file and pull out, for each segment, the sample
        % index where the segment begins and the text label for that
        % segment.  Files are formatted as follows:
        %
        % <begin excerpt>
        % Time		Sample				Event
        %
        %     0:00.004        1     +    0    0    0	(BI
        %    01:55.228    28807     +    0    0    0	(VFL ~ 115
        %    02:04.996    31249     +    0    0    0	(BI ~ 125
        %    03:24.420    51105     +    0    0    0	(VT ~205
        %    03:25.960    51490     +    0    0    0	(BI
        %    03:27.576    51894     +    0    0    0	(VT
        %    03:29.576    52394     +    0    0    0	(BI ~ 210
        %    03:52.112    58028     +    0    0    0	(NOISE
        %    04:03.960    60990     +    0    0    0	(BI
        %    04:15.112    63778     +    0    0    0	(VFL ~ 255
        %
        %
        % start 29:00
        % end 34:00
        % <end excerpt>
        %
        % From the above, we want the sample number and the part of the
        % label between the '(' and the first ' ', excluding the '~' and
        % any number that comes after it.  The output of this section could
        % be saved in a .mat file for future use.
        
        % open the file and read in the header line and the one blank line
        fid = fopen(sprintf('data/atr_n%d.txt',fileno));
        fgetl(fid); % read in header line
        fgetl(fid); % read in next blank line
        
        % pre-allocate storage for each segment of the file, where a
        % segment corresponds to one line of the expert annotation file
        MAX_SEGS = 20;
        seg_indices = zeros(MAX_SEGS,1);
        seg_labels = cell(MAX_SEGS,1);
        
        % for each segment, pull out the information
        for i = 1:MAX_SEGS
            tline = fgetl(fid); % get the next line
            if ~ischar(tline)
                % quit if we hit end-of-file
                break;
            end
            % extract the sample and the label from the line.  There is
            % probably a more robust way to do this, but this will suffice
            % for now.
            [~,index,~,~,~,~,label,~] = strread(tline,'%s %d %s %d %d %d (%s %s');
            
            if isempty(index)
                % quit if we get the first blank line that's not part of
                % the table
                break;
            end
            % record the sample where this segment starts and its label
            seg_indices(i) = index;
            seg_labels{i} = label;
        end
        fclose(fid); % close the file
        
        %-- Process the expert analysis into a vectorized form -----------%
        
        % remove the pre-allocated storage space beyond that which was used
        num_segments = i-1;
        seg_indices = seg_indices(1:num_segments);
        seg_labels = seg_labels(1:num_segments);
        
        % define labels to classify as alarms; check whether or not we
        % should trigger an alarm for each segment (1 if we should alarm, 0
        % otherwise)
        arrhythmia_label_set = {
            'VT'     % ventricular tachycardia
            'VFL'    % ventricular flutter
            'VFIB'   % ventricular fibrillation
            'AFIB'   % atrial fibrillation
            %'B';'BI' % ventricular begeminy
            'VF'     % ?
            };
        seg_alarm = cellfun(@(x)ismember(x,arrhythmia_label_set), seg_labels);
        
        % for each segment, fill in alarm_vector for the first index of
        % that segment through the last index (or one before the next
        % segment begins) with whether or not we should alarm.  To avoid
        % issues at the end, indicate that the last segment goes for the
        % remaining length of the vector by adding a dummy segment that
        % begins at L+1.
        seg_indices = [seg_indices; L+1];
        alarm_vector = false(L,1);
        for i = 1:num_segments
            alarm_vector(seg_indices(i):(seg_indices(i+1)-1)) = seg_alarm(i);
        end
    end

end

