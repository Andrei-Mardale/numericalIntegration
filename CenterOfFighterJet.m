function [] = CenterOfFighterJet (folderPath)
	#centroid of outline	
	[x y] = ReadData(strcat(folderPath, '/contur.in'), 0);
	[x0 y0] = CentroidOfSurface(x, y);
	
	printf('Centroid of surface: x = %.3f, y = %.3f\n', x0, y0);
	
	#find areas for all transversal sections
	x0 = y0 = z = 0; #init x0, y0 and z coordinates
	At = 0; #init areas vector (trapezoidal)
	As = 0; #init areas vector (Simpson)
	
	for p = 0:6
		[x y z(p+1)] = ReadData(strcat(folderPath, '/date', num2str(p), '.in'), 1);
		At(p+1) = Trapeze(x, y);
		As(p+1) = Simpson(x, y);
		[x0(p+1) y0(p+1)] = CentroidOfSurface(x, y);
	endfor
	
	printf('%.3f ', At); printf('\n');
	printf('%.3f ', As); printf('\n');
	
	#find mass and volume
	d = ReadDensities(strcat(folderPath, '/densitati.in'));	

	Ad = At .* [0 d]; #area times density (elementwise)

	m = Trapeze(z, Ad);
	V = Trapeze(z, At);
	printf('Volume of plane: %.3f \nMass of plane: %.3f\n', V, m);
	
	#find centroid
	temp = sum(Ad);
	
	aux = sum (x0 .* Ad);
	X0 = aux / temp;
	
	aux = sum (y0 .* Ad);
	Y0 = aux / temp;
	
	aux = sum (z .* Ad);
	Z0 = aux / temp;
	
	printf('Center of mass: x = %.3f, y = %.3f, z = %.3f\n', X0, Y0, Z0);
endfunction
