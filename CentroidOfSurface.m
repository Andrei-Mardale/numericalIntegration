%determines the center of mass for surface given by (x, y)
%assumes all points have same mass
function [x0 y0] = CentroidOfSurface(x, y)
	A = Trapeze(x, y); #find area
	n = length(x); 
	
	#special case (date0.in)
	if (n == 1)
		x0 = x(1);
		y0 = y(1);
		return;
	endif
	
	Sx = Sy = 0;
	for p = 1:n-1	
		aux = x(p) * y(p+1) - x(p+1) * y(p);
		Sx += (x(p) + x(p+1)) * aux;
		Sy += (y(p) + y(p+1)) * aux;
	endfor
	
	aux = 6 * A;
	x0 = Sx / aux;
	y0 = Sy / aux;
endfunction
