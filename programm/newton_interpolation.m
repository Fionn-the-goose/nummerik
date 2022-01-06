1;

% Newton interpolation
% first I to calculate a table of values

% Anzahl an Stuetzstellen

n =  13 %input("gib Anzahl an Stuetzstellen \n");
a = -pi %input("gib Intervall untergrenze \n");
b =  pi %input("gib Intervall obergrenze \n");

schrittweite = (b - a)/(n-1)
x = a : schrittweite : b
y = [];

function [y] = sinus_funktion(x)
    y = x*sin(x);
endfunction 

for i = 1 : n
    y(i) = sinus_funktion(x(i));
end

y

% function [pol] = newton_interpolation(s, )