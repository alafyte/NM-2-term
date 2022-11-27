eps = 0.01;
F = @(x)(x+1).^2 - 1./x;
x = (-10:0.001:10);
plot(x, F(x));
grid on;
a = 0;
b = 1;

[der1, der2] = derivative(sym(F));

if F(a) * der2 (a) > 0
    x0 = b;
else
    x0 = a;
end
 
 while abs(F(x0)) > eps
     x0 =  x0 - (F(x0) / (der1(x0)));
 end

 result = F(x0);

function [der1, der2] = derivative(f)
    der1 = matlabFunction(diff(f));
    der2 = matlabFunction(diff(f, 2));
end
