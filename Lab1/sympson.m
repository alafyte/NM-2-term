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
    sum2 = 0;
    for i = 1:2:n1
        if i ~= n1
            sum1 = sum1 + f1(a + i * h1);
            sum2 = sum2 + f1(a + (i + 1) * h1);
        end
    end 
    result1 = h1 / 3 * (f1(a) + 4 * sum1 + 2 * sum2 - f1(b));
    
    sum3 = 0;
    sum4 = 0;
    for i = 1:2:n2
        if i ~= n2
            sum3 = sum3 + f1(a + i * h2);
            sum4 = sum4 + f1(a + (i + 1) * h2);
        end
    end 
    result2 = h2 / 3 * (f1(a) + 4 * sum3 + 2 * sum4 - f1(b));
    
    result = integral(f1, a, b);
    delta_rel = abs((result - result1) / result);
    delta_abs = abs(result - result1);