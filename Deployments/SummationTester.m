n = 14;
Tcombst = 0;
Kcombst = 0;
Vcombst = 0;

for i=1:((n-1)/2)

Vcombsi(i)=((factorial(n))/((factorial(2*i+1))*(factorial(n-(2*i+1)))));

Vcombst = Vcombst + Vcombsi(i);
    
end


for i=1:((n-2)/2)

Tcombsi(i)=((2*i)+2)*((factorial(n))/((factorial(2*i+2))*(factorial(n-(2*i+2)))));

Tcombst = Tcombst + Tcombsi(i);
    
end


for i=1:n-4

Kcombsi(i)=((i)+4)*((factorial(n))/((factorial(i+4))*(factorial(n-(i+4)))));

Kcombst = Kcombst + Kcombsi(i);
    
end

Tot = Tcombst + Kcombst + Vcombst;

Vcombst
Tcombst
Kcombst
Tot