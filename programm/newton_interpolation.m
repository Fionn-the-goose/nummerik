1;

% Newton interpolation
% first I to calculate a table of values

% Anzahl an Stuetzstellen

global n =  13 %input("gib Anzahl an Stuetzstellen \n");
a = -pi %input("gib Intervall untergrenze \n");
b =  pi %input("gib Intervall obergrenze \n");

schrittweite = (b - a)/(n-1)
global x = a : schrittweite : b;
global y = [];

function [y] = sinus_funktion(x)
    y = x*sin(x);
endfunction 

for i = 1 : n
    y(i) = sinus_funktion(x(i));
end

y

function [s] = steigung(ordnung, position)
    global x;
    global y;
    if(ordnung == 0)
        s = y(position);
    else
        s = ((steigung(ordnung-1,position+1)-steigung(ordnung-1,position)))/(x(position+ordnung)-x(position));
    endif
endfunction

function [pol] = newton_interpolation()
    global n; 
    global x;
    global y;
    c = [];
    for i = 1 : n
        c(i) = steigung(i-1,1);
    end
    c
    end_polynom = zeros(1,n);
    for i = 1 : n
        polynom = [c(i)];
        for j = 1 : i-1
            polynom = conv(polynom,[1,-x(j)]);
        end
        fill = zeros(1, n-i);
        end_polynom = end_polynom + [fill, polynom];
    end
    pol = end_polynom;
endfunction
newton_interpolation()