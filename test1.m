clear
clc
Lx = 20; % length of the domain
Ly = 20 ; % length of y domain 
Lz = 20 ; % length of z domain
% Then we define the number of cells in the domain:

Nx = 10; % number of cells in the domain
Ny = 10;
Nz = 10;
% Now we call createMesh1D, one of the functions from a group of createMesh* functions:

m = createMesh3D(Nx,Ny,Nz ,Lx, Ly, Lz );
[X,Y,Z] = ndgrid(m.cellcenters.x , m.cellcenters.y, m.cellcenters.z)
[Xf,Yf,Zf] = ndgrid( m.facecenters.x, m.facecenters.y, m.facecenters.z)

disp(m)
figure(3132);
plot3(X(:), Y(:), Z(:), 'or', Xf(:), Yf(:), Zf(:), Xf', Yf', Zf')
