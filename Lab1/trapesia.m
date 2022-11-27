a = 2;
b = 3;
n1 = 10;
n2 = 100;
delta_abs = 0;
delta_rel = 0;
h1 = (b - a) / n1;
h2 = (b - a) / n2;
f1 = @(x)sin(2 .* x) .* cos(x).^3;
f2 = @(x)cos(5 .* x) ./ x;

    sum1 = 0;
    for i = a:h1:b   
        if i ~= b
            if and(f1(i) < 0, f1(i + h1) < 0)
                sum1 = sum1 + h1 / 2 * (-f1(i) - f1(i + h1));
            end
            if and(f1(i) > 0, f1(i + h1) > 0)
                sum1 = sum1 + h1 / 2 * (f1(i) + f1(i + h1));
            end
        end
    end
    
    sum2 = 0;
    for i = a:h2:b
        if i ~= b
            sum2 = sum2 + h2 / 2 * (f1(i) + f1(i + h2));
        end
    end 
    sum = integral(f1, a, b);
    delta_rel = abs((sum - sum1) / sum);
    delta_abs = abs(sum - sum1);