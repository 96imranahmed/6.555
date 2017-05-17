function A = mri_write(img, fname)
%MRI_WRITE  Write an image to file (genesis format)
%  DATA = MRI_WRITE(IMAGE_DATA,'FILENAME') writes an image to file in genesis
%  format. IMAGE_DATA is a 2D image matrix, and 'FILENAME' is the file name to
%  write (full path). The image data is returned in output matrix DATA.

% Last Modified: 4/4/06, Eric Weiss (documentation cleaned up)

genesis_magic = 'IMGF';
width = size(img, 2);
height = size(img, 1);
depth = 16;
headerLength = 7904;

fid=fopen(fname,'w', 'b');
if fid>=0
    fwrite(fid, genesis_magic, 'char');
    fwrite(fid, headerLength, 'integer*4');
    fwrite(fid, width, 'integer*4');
    fwrite(fid, height, 'integer*4');
    fwrite(fid, depth, 'integer*4');
    rest_of_header = zeros(1, 7884);
    fwrite(fid, rest_of_header, 'char');

    fwrite(fid,img','ushort');
    fclose(fid);
else
    fprintf(1, 'ERROR: file %s could not be opened\n', fname)
end;
