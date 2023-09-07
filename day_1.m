clc
L = 100;  % domain length
Nx = 200; % number of cells
Ny = 200; %adding @nd de
m = createMesh1D(Nx, L);
BC = createBC(m); % all Neumann boundary condition structure
BC.left.a(:) = 0; BC.left.b(:)=1; BC.left.c(:)=1; % Dirichlet for the left boundary
BC.right.a(:) = 0; BC.right.b(:)=1; BC.right.c(:)=0; % right boundary
D_val = 1; % value of the diffusion coefficient
D = createCellVariable(m, D_val); % assign the diffusion coefficient to the cells
D_face = harmonicMean(D); % calculate harmonic average of the diffusion coef on the cell faces
u = -10
u_face = createFaceVariable(:u)
Mconv =  convectionTerm(u_face); % convection term, central, second order
Mconvupwind = convectionUpwindTerm(D_face); % convection term, upwind, first order

Mdiff = diffusionTerm(D_face); % diffusion term
[Mbc, RHSbc] = boundaryCondition(BC); % boundary condition discretization
M = Mconv-Mdiff+Mbc; % matrix of coefficient for central scheme
% Mupwind = Mconvupwind-Mdiff+Mbc; % matrix of coefficient for upwind scheme
% RHS = RHSbc; % right hand side vector
c = solvePDE(meshstruct, M, RHS); % solve for the central scheme

visualizeCells(c); % visualize the results

c