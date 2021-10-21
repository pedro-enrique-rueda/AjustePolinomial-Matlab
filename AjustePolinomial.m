function [solucion,r2] = AjustePolinomial(x,y,grado)

    figure(1)
    plot(x,y,'ob')
    title('Figura datos de Entrada')
    ylabel('Eje Ordenadas')
    xlabel('Eje Abscisas')

    %Calculo de cuadrados minimos
    
    for i = 1:grado + 1
        cont = i-1;
        for j = 1:grado + 1
            
            A(i,j) = sum( x.^(cont) );
            cont = cont +1;
        end
        b(i) = sum(y.*x.^(i-1));
    end
    
    A(1,1) = length(x);
    
    % Calculo de los coeficiente
    [solucion,time] = red_gauss(A,b);
    
    
    % Nuestra funcion
    
    for i = 1:length(x)
        cont = 0;
        for j = 1:grado+1
            cont = cont + solucion(j).*x(i).^(j-1);
        end
        y_gorro(i) = cont;
    end
    
    hold on
    plot(x,y_gorro)
    
    ym = sum((y / length(x)));
    hold on
    plot(x,ym,'r*')
    
    % Calculo del coeficiente de determinacion
    Sr = sum((y - y_gorro).^2);
    St = sum((y - ym).^2);
    
    r2 = (St - Sr) / St;
end