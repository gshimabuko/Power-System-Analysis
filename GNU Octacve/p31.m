%%Prova asp Q1
clear
clc
basemva=100;
%Funcao de perdas
B=[0.0125 0; 0 0.00625]/basemva;

%funcao de custo
cost=[320 6.2 0.004; 200 6 0.003];

%limites de geracao
mwlimits =[50 250; 50 350];
%potencia de carga
Pdt=400;
PLT=0;
%estimativa inical do lambda
lambda(1)=7.6923;
n=1;
E(1)=100;
p1lim=false;
p2lim=false;
p3lim=false;
while(E(n)>0.001)
  
  P1(n)=lambda(n)-cost(1,2);
  P1(n)=P1(n)/(2*(cost(1,3)+lambda(n)*B(1,1)))
  
  K1(n)=cost(1,3)+(cost(1,2)*B(1,1));
  K1(n)=K1(n)/(((lambda(n)*B(1,1)+cost(1,3))^2)*2)
  
  P2(n)=lambda(n)-cost(2,2);
  P2(n)=P2(n)/(2*(cost(2,3)+lambda(n)*B(2,2)))
  
  K2(n)=cost(2,3)+(cost(2,2)*B(2,2));
  K2(n)=K2(n)/(((lambda(n)*B(2,2)+cost(2,3))^2)*2)

  kt(n)=K1(n)+K2(n)
  
  PL1(n)=B(1,1)*(P1(n))**2;
  PL2(n)=B(2,2)*(P2(n))**2;
  
  PLT(n)=PL1(n)+PL2(n)
  Pg(n)=P1(n)+P2(n)
  deltaP(n)=PLT(n)+Pdt-(Pg(n))
  deltaLambda(n)=deltaP(n)/kt(n)
  E(n+1)=abs(deltaP(n));
  E(n+1)=E(n+1)./(Pdt+PLT(n))
  lambda(n+1)=lambda(n)+deltaLambda(n);
  n++;
  
  
end
if(P1(n-1)<mwlimits(1,1))
  disp("P1 abaixo do limite inferior.")
  P1(n)=mwlimits(1,1)
  p1lim=true;
  K1(n)=0;
elseif(P1(n-1)>mwlimits(1,2))
  disp("P1 acima do limite superior.")
  P1(n)=mwlimits(1,2)
  p1lim=true;
  K1(n)=0;
endif

if(P2(n-1)<mwlimits(2,1))
  disp("P2 abaixo do limite inferior.")
  P2(n)=mwlimits(2,1)
  p2lim=true;
  K2(n)=0;
elseif(P2(n-1)>mwlimits(2,2))
  disp("P2 acima do limite superior.")
  P2(n)=mwlimits(2,2)
  p2lim=true;
  K2(n)=0;
endif
if ((p1lim==true)||(p2lim==true))
  E(n)=10
endif

while(E(n)>0.0001)
disp("Recalculando com Limites")
  if(p1lim==false)f
    P1(n)=lambda(n)-cost(1,2);
    P1(n)=P1(n)/(2*(cost(1,3)+lambda(n)*B(1,1)))
  
    K1(n)=cost(1,3)+(cost(1,2)*B(1,1));
    K1(n)=K1(n)/(((lambda(n)*B(1,1)+cost(1,3))^2)*2)
  endif
  
  if(p2lim==false)
    P2(n)=lambda(n)-cost(2,2);
    P2(n)=P2(n)/(2*(cost(2,3)+lambda(n)*B(2,2)))
  
    K2(n)=cost(2,3)+(cost(2,2)*B(2,2));
    K2(n)=K2(n)/(((lambda(n)*B(2,2)+cost(2,3))^2)*2)
  endif
  
  
  kt(n)=K1(n)+K2(n)+K3(n);
  
  PL1(n)=B(1,1)*(P1(n))**2;
  PL2(n)=B(2,2)*(P2(n))**2;
  
  PLT(n)=PL1(n)+PL2(n)
  Pg(n)=P1(n)+P2(n)
  deltaP(n)=PLT(n)+Pdt-(Pg(n))
  deltaLambda(n)=deltaP(n)/kt(n)
  E(n+1)=abs(deltaP(n));
  E(n+1)=E(n+1)./(Pdt+PLT(n))
  lambda(n+1)=lambda(n)+deltaLambda(n)
  n++;
end
n--;
Ct=cost(1,1)+cost(1,2)*P1(n)+cost(1,3)*P1(n)**2;
Ct=Ct+cost(2,1)+cost(2,2)*P2(n)+cost(2,3)*P2(n)**2;

