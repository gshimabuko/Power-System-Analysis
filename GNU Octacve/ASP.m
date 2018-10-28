clear
clc
v=220;
i=1;
f=60;
w=2*pi*f;
T=1/f;
teta=pi/4;
t=0:0.01*T:5*T;
n=1;
l=size(t);
while(n!=l(2)+1)
vt(n)=v*sqrt(2)*cos(t(n).*w);
it(n)=i*sqrt(2)*cos(t(n).*w+teta);
pt(n)=vt(n)*it(n);
n=n+1;
end
p=v*i*cos(teta);
figure
plot(t, vt, t, it, t, pt, t, p)


