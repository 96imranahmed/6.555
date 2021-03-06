function [dat] = ft_preproc_hilbert(dat, option)

% FT_PREPROC_HILBERT computes the Hilbert transpose of the data and optionally
% performs post-processing on the complex representation, e.g. the absolute
% value of the Hilbert transform of a band-pass filtered signal corresponds
% with the amplitude envelope.
%
% Use as
%   [dat] = ft_preproc_hilbert(dat, option)
% where
%   dat        data matrix (Nchans X Ntime)
%   option     string that determines whether and how the Hilbert transform
%              should be post-processed, can be
%                'abs'
%                'complex'
%                'real'
%                'imag'
%                'absreal'
%                'absimag'
%                'angle'
%
% The default is to return the absolute value of the Hilbert transform.
%
% See also PREPROC

% Copyright (C) 2008, Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.ru.nl/neuroimaging/fieldtrip
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id: ft_preproc_hilbert.m 7123 2012-12-06 21:21:38Z roboos $

% set the defaults if option is not specified
if nargin<2 || isempty(option)
  option = 'abs';
end

% use the non-conjugate transpose to be sure
dat = transpose(hilbert(transpose(dat)));

% do postprocessing of the complex representation
switch option
    case {'yes' 'abs'}
        dat = abs(dat);   % this is the default if 'yes' is specified
    case {'no' 'complex'}
        dat = dat;        % this is the default if 'no' is specified
    case 'real'
        dat = real(dat);
    case 'imag'
        dat = imag(dat);
    case 'absreal'
        dat = abs(real(dat));
    case 'absimag'
        dat = abs(imag(dat));
    case 'angle'
        dat = (angle(dat./abs(dat)));
    case 'unwrap_angle'
        dat = unwrap(angle(dat./abs(dat)),[],2);
    otherwise
        error('incorrect specification of the optional input argument');
end
