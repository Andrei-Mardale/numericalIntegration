%determines the integral value with Simpson's rule
%unevenly-spaced points
function [I] = Simpson(x, y)
	n = length(y);
	I = 0;
	if (n < 2)		
		return 
	endif
	
	p = 1;
	while (p <= n-2)
		h = (x(p+2) - x(p)) / 6;	
		
		I += (y(p+2) + 4*y(p+1) + y(p)) * h;

		p += 2;
	endwhile
	
	if (I < 0) 
		I = -I;
	endif
	
endfunction
