%reads densities from file
function [d] = ReadDensities (fileName)
	#open file
	[fid msg] = fopen(fileName, 'r');
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	d = 0;
	
	d = fscanf(fid, '%d\n', Inf)';
	
	fclose(fid);
endfunction 
