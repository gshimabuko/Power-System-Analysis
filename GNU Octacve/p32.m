%potencia em regime permanente
Prp=0.45;
%Potencia eletrica maxima fornecida durante defeito
PEdd= 0.3;
%Potencia Eletrica Maxima fornecida apos o defeito
Pepd=0.7;
%Potencia eletrica Maxima em regime permanente
Pemrr= 1;
d0=asin(Prp);
df=asin(Prp/Pepd);
  
dmax=acos((Prp*(df-d0)-0.3*cos(d0)+0.7*cos(df))/0.4);

