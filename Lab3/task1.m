eps = 0.01;
F = @(x)(x+1).^2 - 1./x;
x = (-10:0.001:10);
plot(x, F(x));
grid on;
a = 0;
b = 1;


while abs(a - b) > eps
   x0 = (a + b) / 2; 
   if ((F(x0) * F(a)) < 0) 
       b = x0; 
   else
       a = x0;
   end
end

result = F(x0);



