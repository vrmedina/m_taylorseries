 %Monitoria 4 - Serie de Taylor & McLaurin 
clear; 
clc; 
syms x; 
format long; 
f = input('Ingrese función'); 
equis = input('Ingrese valor de x'); 
a = input('Ingrese valor de a:\n Recuerde que a = 0 se usa en McLaurin'); 
tol = input('Ingrese tolerancia: '); 
teorico = double(subs(f,equis)); 
disp(['El valor teórico es: ',num2str(teorico)]); 
experimental = double(subs(f,a)); 
disp(['El valor experimental previo al ciclo es: ',num2str(experimental)]); 
sumatoria = 0; 
i = 0; 
error_absoluto = double(abs(teorico-experimental)); 
error_relativo = double(abs((teorico-experimental)/(teorico))); 
while(error_absoluto > tol) 
sumatoria = sumatoria + (subs(diff(f,i),a) * (x - a) ^ i)/factorial(i); 
experimental = double(subs(sumatoria,equis)); 
error_absoluto = double(abs(teorico-experimental)); 
error_relativo = double(abs((teorico-experimental)/(teorico))); 
fprintf('El valor experimental, el error absoluto y el error relativo en la iteración es = %f, %f, %f, %d \n', experimental, error_absoluto, error_relativo, i); 
i = i+1; 
end 
disp('El modelo matemático es: '); 
disp(sumatoria); 
disp('El valor teórico es: '); 
disp(teorico); 
disp('El valor experimental es: '); 
disp(experimental); 
disp('El error absoluto es: '); 
disp(error_absoluto); 
disp('El error relativo es: '); 
disp(error_relativo); 
disp('Cantidad de iteraciones: '); 
disp(i); 
hold off 
ezplot(f) 
hold on 
ezplot(sumatoria) 
legend(char(f),char(sumatoria)) 
xlabel('Eje x') 
ylabel('Eje y') 
title('Series de Taylor'); 