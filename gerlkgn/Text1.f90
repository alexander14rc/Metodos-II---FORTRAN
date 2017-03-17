program trabajo9
	real :: h,xi,xf,x
	real :: dx,xend
	integer ::i,m
	integer, parameter:: n = 2
	real,dimension(1000000) :: xp
	real, dimension (2) :: y,yi
	real, dimension (100000,100000) :: yp
	print*, "*********************************************************"
	print*, "     Solucion de sistemas de EDO usando el metodo:      "
	print*, "             RUNGE-KUTTA cuarto orden                   "
	print*, "*********************************************************"
	print*, "Valores iniciales de las variables dependientes:"
	read(*,*) (yi(i), i = 1,n)
	print*," Valor inicial de la variable independiente: "
	read(*,*) xi
	print*," Valor final de la variable independiente"
	read(*,*) xf
	print*," Valor del tamaño de paso: "
	read(*,*) dx
	x = xi
	m = 1
	xp(m) = x
	do i = 1,n
		yp(i,m)	 = yi(i)
		y(i) = yi(i)
	end do 
	do 
		xend = x + dx
		if (xend > xf) then
			xend = xf
		end if
		h = dx
		call integrator(x,y,h,xend,n)
		m = m+1
		xp(m) = x
		do i = 1,n
			yp(i,m) = y(i)
		end do
		if(x >= xf) exit
	end do
	print*, " "
	print*, "         x          y1        y2"
	print*, " "

	do i=1,m
		print*,xp(i),yp(1,i),yp(2,i)
	end do
	      
end program trabajo9
	! z = y1
	! v = y2
  
	function dydx1 (x,y1,y2)
		real ::  x,y1,y2
		dydx1 =  y2+0*y1+0*x
	end function dydx1

	function dydx2 (x,y1,y2)
		real ::  x,y1,y2
		dydx2 =  -(0.001)*y2*abs(y2) - 2.*(9.81/1.225)*y1 + 0*x
	end function dydx2

  
subroutine integrator(x,y,h,xend,n)   
	real :: x,h,xend
	real,dimension (2) :: y, ynew
	integer :: n,i
		do 
			if (xend - x < h ) then 
				h = xend -x
			end if
			call RungeKutta(x,y,h,n,ynew)
			do i = 1,n
				y(i) = ynew(i)
			end do
			if (x >= xend) exit 
		end do 
end subroutine integrator

  
subroutine RungeKutta(x,y,h,n,ynew)   
	real :: x, h
    real, dimension (2) :: ynew,y
	!real, dimension (2)	:: dydx
	integer:: n
	integer:: i
	real,dimension(2)::ym,ye
	real,dimension(2)::k1,k2,k3,k4



    interface
	function dydx1 (x,y1,y2)
		real ::  x,y1,y2
	end function dydx1
    end interface

    interface
	function dydx2 (x,y1,y2)
		real ::  x,y1,y2
	end function dydx2
    end interface
	
		call Derives (x,y,k1)
		do i=1,n
			ym(i)=y(i)+0.5*k1(i)*h
		end	do

		call Derives (x+h/2,ym,k2)
		do i=1,n
			ym(i)=y(i)+0.5*k2(i)*h
		end	do

		call Derives (x+h/2,ym,k3)
		do i=1,n
			ye(i)=y(i)+k3(i)*h
		end	do
		call Derives (x+h,ye,k4)

		do i=1,n
			ynew(i)= y(i) + (h/6)*(k1(i)+2*(k2(i)+k3(i))+k4(i))
		end do

		x = x + h
		 
			   
end subroutine RungeKutta

subroutine Derives (x,y,dydx)
	real :: x, v1,v2
	real,dimension (2) :: y, dydx

    interface
	function dydx1 (x,y1,y2)
		real ::  x,y1,y2
	end function dydx1
    end interface

    interface
	function dydx2 (x,y1,y2)
		real ::  x,y1,y2
	end function dydx2
    end interface
	
	v1 = y(1)
	v2 = y(2)
	dydx(1) = dydx1 (x,v1,v2)
	dydx(2) = dydx2 (x,v1,v2)

end subroutine Derives


