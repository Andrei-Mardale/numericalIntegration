%reads data from file given by filename
%if read_z is 1 then also returns z value found in file
function [x y z] = ReadData(fileName, read_z)
	#open file
	[fid msg] = fopen(fileName, 'r');
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	#read first line
	buff = str2num(fgetl(fid));
	x = y = z = 0;

	if (length(buff) > 0)
		x(1) = buff(1);
		y(1) = buff(2);
		if (read_z == 1)
			z = buff(3);
		endif
	endif
		
	#read rest of lines
	p = 2; #current line
	while (feof(fid) == 0)
		buff = str2num(fgetl(fid)); 
		x(p) = buff(1);
		y(p) = buff(2);
		++p;
	endwhile
	
	fclose(fid);
endfunction		
