function k=factorfalla(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Coordinación de aislamiento                                                                                    %%
%% Dadas las razones de impedancias x=X0/X1 y y=R0/X1, esta función devuelve el factor de falla considerando R1=0 %%
%% Basada en las curvas de la norma IEC 71-2 Insulation Coordination Part 2 Aplication Guide, página 125          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Verifica que las razones esten dentro de la gráfica de la norma
if (x>=0 & x<=8 & y>=0 & y<=8)

% Evaluando en zona superior, o zona 1
	y1=8;
	y2=frontera2(x);
	if (y<=8 & y>=y2)
	k=1.7;
		else
%Evaluando en zona 2
		y3=frontera3(x);
		if (y>=y3)
			k=1.7;
			else
%Evaluando en zona 3
			y4=frontera4(x);
			if (y>=y4)
				k=1.6;
				else
%Evaluando en zona 4
				y5=frontera5(x);
				if (x>=6.2158273381 & y<=y5)
					k=1.6;
					else
%Evaluando en zona 5
					y6=frontera6(x);
					if (y>=y6)
						k=1.5;
						else
%Evaluando en zona 6
						y7=frontera7(x);
						if (x>=4.1438848921 & y<=y7)
							k=1.5;
							else
%Evaluando en zona 7
							y8=frontera8(x);
							if (y>=y8)
								k=1.4;
								else
%Evaluando en zona 8
								y9=frontera9(x);
								if (x>=2.9856115108 & y<=y9)
									k=1.4;
									else
%Evaluando en zona 9
									y10=frontera10(x);
									if (y>=y10)
										k=1.3;
										else
%Solo resta la zona 10
										k=1.2;
									end
								end
							end
						end
					end
				end
			end
		end
	end
else
	errordlg('Las razones de impedancias no est�n permitidas','Error')
end
