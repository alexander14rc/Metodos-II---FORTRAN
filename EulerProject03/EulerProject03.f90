program EulerProject03
real, dimension (100) :: n
integer :: num,I
num = 50
I = 1
do ii = 1,num 
	do while (mod(num,ii) == 0  )
		n(I) = ii
		I = I + 1
		num = int(num)/2
	end do
	if (num == 1) then
		stop	
	end if
end do
write(*,*) n
end program EulerProject03