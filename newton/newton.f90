program newton
real :: x,x0
real :: f,df,Eps,Eps1
integer ::imax,iter
write(*,*) ('*******************************')
write(*,*) ('     Metodo newton-raphson     ')
write(*,*) ('*******************************')
write(*,1) 
1 format (" Ingrese el valor inicial: ", $	)
read(*,*) x0
write(*,2) 
2 format (" Ingrese el error por criterio de convergencia: ", $ )
read(*,*) Eps
write(*,3) 
3 format(" Ingrese el error por aproximacion: ", $ )
read(*,*) Eps1
write(*,4)
4 format(" Ingrese el numero de iteraciones: ", $ )
read(*,*) imax
iter =1;

do while (iter < imax) 
    x=x0-f(x0)/df(x0);
    Ea=abs(x-x0);
		if (abs(x-x0)<Eps) then 
			write(*,*) 'El valor de la raiz es:'
			write(*,*) x
			exit
		elseif (abs(f(x))<Eps1)  then
			write(*,*) 'El valor de la raiz es:'
			write(*,*) x
			exit
        end	if
	x0=x;
	iter=iter+1;
end	do


if (imax<iter) then
       write(*,*) 'El valor de la raiz no converge'
end	if

write(*,*)'El numero de iteraciones es:' 
write(*,*) iter
write(*,*)'El valor de Ea es:'
write(*,*) Ea

end program newton  

!FUNCION
function f (x)
	real ::  x
	f = exp(-x)-x	 ! Esta es la funcion
end function f


!DERIVADA DE LA FUNCION
function df (x)
	real ::  x
	df =  -exp(-x)-1 ! Esta es la derivada de la funcion

end function df