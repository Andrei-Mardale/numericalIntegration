%determines the integral value with the trapezoidal rule
%unevenly-spaced points
function [I] = Trapeze(x, y)
	n = length(x);
	I = 0;

	for p = 2:n
		h = x(p) - x(p-1);
		
		I += (y(p) + y(p-1)) * h / 2;
	endfor
	
	if (I < 0) 
		I = -I;
	endif
	
endfunction	
