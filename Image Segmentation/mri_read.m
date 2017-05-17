function A = mri_read(fname)
%MRI_READ  Read an MRI image file (genesis format)
%  IMAGE_DATA = MRI_READ('FILENAME') reads an image data file in genesis format.
%  'FILENAME' is the file name (full path), and IMAGE_DATA is a matrix
%  containing the image data.

% Last Modified: 4/4/06, Eric Weiss (documentation cleaned up; updated 'magic'
%   fread from 'char' to '*char')

genesis_magic = 'IMGF';

fid=fopen(fname,'r','b');
if fid>=0
    magic=fread(fid, 4, '*char')';
    %fprintf(1,'%s %s\n', genesis_magic, magic);
    if strcmp(genesis_magic, magic)
        headerLength=fread(fid, 1, 'int32');
        %fprintf(1,'%d\n',headerLength);
        width=fread(fid, 1, 'int32');
        %fprintf(1,'%d\n',width);
        height=fread(fid, 1, 'int32');
        %fprintf(1,'%d\n',height);
        depth=fread(fid, 1, 'int32');
        %fprintf(1,'%d\n',depth);
    else  % hack for signa or other ushort images
        fseek(fid, 0, 'eof');
        pos = ftell(fid);
        width = 2^((round(log2(pos))-1)/2);
        height = 2^((round(log2(pos))-1)/2);
        headerLength = pos - width*height*2;
    end;
    fseek(fid,headerLength,'bof');
    a=fread(fid,[width height],'ushort');
    m = width;
    n= height;
    fclose(fid);
    A=a(1:m,1:n)';
else
    fprintf(1, '\nfile %s could not be opened\n', fname)
end;
