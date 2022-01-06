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

function [] = newton_interpolation()
    global n; 
    c = [];
    for i = 1 : n
        c(i) = steigung(i-1,1);
    end
    c
endfunction

newton_interpolation()