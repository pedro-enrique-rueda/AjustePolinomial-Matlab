function [x,time] = red_gauss(A,b)

% Esta funcion me resuelve un sistema de ecuaciones lineales mxn cuadrada 
% por el metodo de reduccion de Gauss. Tan solo debe ingresar la matriz 
% de ecuaciones lineales A y la matriz columna b. 
% La funcion le arroja la matriz solucion x en respuesta.


tic;
  % Operando Matriz A
  
  [m,n] = size(A);
  
  for k = 1:1:n-1
    for i = (1+k):n
      for j = (1+k):n
        em = A(i,k)/A(k,k);   
        A(i,j) = A(i,j) - A(k,j)*em;
      end
    end
  end
    
  % Operando Matriz b
  for k = 1:n-1
    for i = 1+k:n    
      b(i) = b(i) - A(i,k).*(b(k)/A(k,k));
    end
  end

%  Algoritmo de Remonte

  x(n) = b(m)/A(m,n);
  for i = m-1:-1:1
    for j = i+1:n
      x(i) = x(i)-A(i,j)*x(j);
    end
    x(i)=x(i)+b(i);
    x(i)=x(i)/A(i,i);
  end
  time = toc;
  return
end

