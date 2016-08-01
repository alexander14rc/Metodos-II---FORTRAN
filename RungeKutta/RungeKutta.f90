! Runge-Kutta de cuarto Orden para P.V.I con 2 Edo
! Ejercicio 7: 
! Sean 2 ecuacuines diferenciales no lineales ordinarias de 2 variables hidraulicas
!        dh/dt = (1/Aca)*(Atu*u-q)      y        du/dt = (g/L)*(H-h-c*u^2)
! siendo:
! L = 500 , g = 9.8, Aca = 20, Atu =1, H = 100,  h = 90, c = 0.01, q = 1
! condiciones iniciales:
!               u(0) = 0.5   , h(0) = 90.0

program principal

	real :: xi,xf ! tiempo inicia, tiempo final y tamaño de paso respectivamente
	integer :: n = 2 ! cantidad de ecuaciones
	integer :: i,m  !iteradores
	real :: xend,x,h ,dx
	real :: y1 ,y2 
	real, dimension(2) :: y0,y
	real, dimension(100) :: xp 
	real, dimension (100,100) :: yp 
	real, dimension (2) ::k1,k2,k3,k4,ym,ye,slope

	interface 
	function dy1(x,y1,y2)
		real :: x,y1,y2
	end function  dy1
	end interface

	interface 
	function dy2(x,y1,y2)
		real :: x,y1,y2
	end function  dy2
	end interface
	
	write(*,*)  "     ************************************" 
	write(*,*)  "              Runge-Kutta 2 EDO          "
	write(*,*)"     ************************************"
	write(*,*) " "
	write(*,1) 
	1 format ('    condiciones iniciales h y u: ',$)
	read(*,*) (y0(i),i = 1,n)
	write(*,*) " "
	write(*,2) 
	2 format ('    Variable inicial independiente ti = ',$)
	read(*,*) xi
	write(*,*) " "
	write(*,3)
	3 format ('    Variable final independiente tf = ',$)
	read(*,*) xf
	write(*,*) " "
	write(*,4)
	4 format ('    Tamaño de paso dx = ',$)
	read(*,*) dx
	write(*,*) " "
	write(*,*) "                  Solucion:    "	
	write(*,*) " "

	x =	xi
	m = 1
	do 	i = 1,n
		yp(i,m) = y0(i)
		y(i) = y0(i)
	end do 

	do
		xend = x + dx
		if (xend > xf) then
			xend = xf
		end if
		h = dx
			do 
				if (xend - x < h) then
					h = xend - x
				end if 
					!Runge Kutta
					do i = 1,n
						y1 = y(1)
						y2 = y(2)
						if (i == 1) then 
							k1(1) = dy1(x,y1,y2)
						else
							k1(2) = dy2(x,y1,y2)
						end if
					end do
					!print*,k1
					do j = 1,n
						ym(j) = y(j) +k1(j)*(h/2)
					end do
					

					do i = 1,n
						y1 = ym(1)
						y2 = ym(2)
						if (i == 1) then 
							k2(1) = dy1(x + (h/2),y1,y2)
						else
							k2(2) = dy2(x + (h/2),y1,y2)
						end if
					end do

					do j = 1,n
						ym(j) = y(j) +k2(j)*(h/2)
					end do

					do i = 1,n
						y1 = ym(1)
						y2 = ym(2)
						if (i == 1) then 
							k3(1) = dy1(x + (h/2),y1,y2)
						else
							k3(2) = dy2(x + (h/2),y1,y2)
						end if
					end do

					do j = 1,n
						ye(j) = y(j) +k3(j)*h
					end do

					do i = 1,n
						y1 = ye(1)
						y2 = ye(2)
						if (i == 1) then 
							k4(1) = dy1(x + h,y1,y2)
						else
							k4(2) = dy2(x + h,y1,y2)
						end if
					end do

					do i = 1,n
						slope(i) = (k1(i) + 2*(k2(i)+k3(i))+k4(i))/6
						y(i) = y(i) + slope(i)*h
					end do
					x = x +h
					!End Runge Kutta 
			if (x >= xend) exit 
			end do

		m = m+1
		xp(m) = x
		do i = 1,n
			yp(i,m) = y(i)
		end do 
	if (x >= xf) exit
	end do

	do j = 1,m
		write(*,*) xp(j),yp(1,j),yp(2,j)
	end do


end program principal


function dy1(x,y1,y2)
	real :: x,y1,y2
	dy1 =  (1.0/20)*(y2-1)+0*y1+0*x
end function  dy1

function dy2(x,y1,y2)
	real :: x,y1,y2
	dy2 = (9.8/500)*(100.0-y1-0.01*y2**2)+0*x
end function dy2
