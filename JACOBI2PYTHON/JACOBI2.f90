program jacobi
real :: Lx,Ly,tol,dx,dy,a1,b1,c,err,kx,ky
real :: s,ss,a2,b2
integer :: k,p,i,j
integer, parameter :: Nx = 27, Ny =	27
real, dimension (27,27) :: u,uold,matriz

kx =1.0;
ky=1.0;
Lx = 1.0;
Ly = 1.0;
k =	0;
err = 1;
dx = Lx/(real(Nx)-1.0);
dy = Ly/(real(Ny)-1.0);
a1 = kx/dx**2;
a2 = a1;
b1 = ky/dy**2;
b2 = b1;
c =	 2*(kx/dx**2+ky/dy**2);
tol = 0.0001;
do while (err > tol)
    p = 1;
	k = k + 1;
	do i = 1,Ny-1
		if (i == 1) then
			do j = 2,Nx-1 
				uold(i,j) = (1./c)*(a1*u(i+1,j)+a2*u(i+1,j)+b1*u(i,j+1)+b2*u(i,j-1)-(-1)); 
			end	do
		elseif ((i < aint(Ny/2.+1.)).And.(i > 1))  then
            do j = 2, Nx-1
                uold(i,j)= (1./c)*(a1*u(i+1,j)+a2*u(i-1,j)+b1*u(i,j+1)+b2*u(i,j-1)-(-1));
            end do
        else
            do j = 2, Nx-1-p
                uold(i,j)= (1./c)*(a1*u(i+1,j)+a2*u(i-1,j)+b1*u(i,j+1)+b2*u(i,j-1)-(-1));
            end do
        end if 
		if (i >= aint(Ny/2.+1.)) then 
            p = p + 1;
        end if 
    end	do
	s = 0;		
	do i = 1,Ny
		do j = 1,Nx
			ss = abs(uold(i,j)-u(i,j));
			if (ss > s) then
				s = ss;
			end if
		end do 
	end do
	err = s;
	
	u = uold;
end do

do i = 1,Ny
	do j = 1,Nx 	 
		matriz(i,j) = u(1+Ny-i,j);		 
	end do 
end do 			 
open (unit=1,file='puntosfortran.txt',status='old')
do i = 1,Ny
		write(1,*) u(i,:)
end do
close(1)

write(*,*) u
end program jacobi