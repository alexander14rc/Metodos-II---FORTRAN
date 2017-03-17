program tarea
real::dt,d1,d2,L,f,h
real::C3,C4,Lf
real::k1,k2,k3,k4,kv
real::kz1,kz2,kz3,kz4
real::kv1,kv2,kv3,kv4
real::v1,z1,v2,z2
real,dimension(100000)::t,V,Z
real,dimension(100000)::zD1,zD2
real,dimension(100000)::vD1,vD2
real,parameter::pi = 3.1416, g = 9.81	
open(unit=16, file='resultados.dat',status='unknown') 

!print*,"kz2"
print*,"       Tiempo            Z(m)            V(m/s)"
dt=1									    
d1=5
d2=6
L=600
!%perdidas
k1 =0.9216
k2 =0.9 
k3 =0.9 
k4 =0.9452
kv =0.19
f=0.024
h=0.1 !h variacion del tiempo
z1=12
t(1)=0 !vector inicial 0
V(1)=0 !vector velocidad 0
Lf = (k1+k2+k3+k4+kv)*(dt/f)
Le =L+Lf;
!Le longuitud equivalente =Lf+L
!calculando C3 y C4
C3 = g*(pi*dt**2/(L*4))*(4/(pi*d1**2)+4/(pi*d2**2));
C4 = (Le*f)/(L*2*dt);
Z(1) = z1*(d1**2/dt**2);
!sea n una variable contador
n=1
do while(t(n)<=1000)
	print*,t(n),Z(n),V(n)
	kz1=h*V(n);
	kv1=h*(-C3*Z(n)-C4*V(n)*abs(V(n)))
	kz2=h*(V(n)+kv1/2.)
	kv2=h*(-C3*(Z(n)+kz1/2.)-C4*(V(n)+kv1/2.)*kv1/2.)
	kz3=h*(V(n)+kv2/2)
	kv3=h*(-C3*(Z(n)+kz2/2.)-C4*(V(n)+kv2/2.*abs(V(n)+kv2/2.)))
	kz4=h*(V(n)+kv3)
	kv4=h*(-C3*Z(n)+kz3)-C4*(V(n)+kv3*abs(V(n)+kv3))
	!print*,kz2 !,kz2,kz3,kz4,kv1,kv2,kv3,kv4
	t(n+1)=t(n)+h
	Z(n+1)=Z(n)+(1./6.)*(kz1+2.*kz2+2.*kz3+kz4)
	V(n+1)=V(n)+(1./6.)*(kv1+2.*kv2+2.*kv3+kv4)
	!la altura y la velocidad en el deposito 1
	z1=Z(n)*(dt**2/d1**2)
	v1=V(n)*(dt**2/d1**2)
	zD1(n+1)=z1
	vD1(n+1)=v1
	!determinando la altura y la velocidad en el deposito 2
	z2=Z(n)*(dt**2/d2**2)
	v2=V(n)*(dt**2/d2**2)
	zD2(n+1)=-z2
	vD2(n+1)=-v2
	n=n+1
end do
!
print*,"      Tiempo-s   Z-m     V-m/s"
  write(16,99)
  99 format("      Tiempo-s   Z-m     V-m/s    ZD1-m    VD1-m/s    ZD2-m    VD2-m/s")
  do j=1,n-1
    print 100,(j-1)*h,Z(n),V(j),zD1(j),vD1(j),zD2(j),vD2(j)
    write(16,100) (j-1)*h,Z(j),V(j),zD1(j),vD1(j),zD2(j),vD2(j)
  enddo
  100 format(F12.3,F10.4,F10.4,F10.4,F10.4,F10.4,F10.4)	 ! Posiciones y Velocidades en las tuberias
!
end program tarea
