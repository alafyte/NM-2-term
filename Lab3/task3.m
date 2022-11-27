eps = 0.01;
F = @(x)(x+1).^2 - 1./x;
x = (-10:0.001:10);
plot(x, F(x));
grid on;
a = 0;
b = 1;

x0 = (a + b) / 2;
[der1, der2] = derivative(sym(F));
iter_count = 0;
while true
    iterations_max = 100;
    x = x0;
    iter_count = iter_count + 1;
    df = der1(x);
    M = 1 - df;
    if iter_count > iterations_max
        break;
    elseif abs(F(x)) <= eps
        break;
    else
        x0 = x + F(x) / M;
        x = x0;
    end
end
result = F(x);
iter_count; 
function [der1, der2] = derivative(f)
    der1 = matlabFunction(diff(f));
    der2 = matlabFunction(diff(f, 2));
end

