% Script de apoyo a la 'guidecalcular'

%Declaracion de variables globales de datos ingresados en gui de entrada (Importacion)
global Uskv valor16 k cont_ener cont_resis cont_alim cont_comp Ups Upl A n Lsp Ra Rkm Lint Lext H Ks_int Ks_ext

% Declaracion de variables globales para la gui de salida (Exportacion)
global U_potencia_ext U_potencia_int U_maniobra_ext U_maniobra_int U_rayo_ext U_rayo_int U_ff_potencia U_ft_potencia U_ff_maniobra U_ft_maniobra U_ff_rayo U_ft_rayo BSL_cal BIL_cal Us_nor BSL_nor BIL_nor d_estr_bar d_cond_estr



% Referencia 1.0 p.u.
Vbase=Uskv*(sqrt(2/3));

% **********Calculo de sobretensiones representativas (Urp)****************

% Sobretensiones temporales
Urp_ft1=k*Uskv/sqrt(3); % Por falla a tierra
Urp_ft2=valor16*Uskv/sqrt(3); % Por rechazo de carga
Urp_ff_temp=valor16*Uskv;
Urp_ft_temp=Urp_ft1;
if (Urp_ft2>Urp_ft1)
    Urp_ft_temp=Urp_ft2;
end
%Urp_ff_temp
%Urp_ft_temp

%Sobretensiones de frente lento
cond_mxsob=cont_ener+cont_resis+cont_alim+cont_comp; %seg�n selecci�n en el tooggle button
Vec_Ue2=[3.6289 3.5258 3.5052 2.4433 2.1237 2.1753 1.7835 1.9485 2.8763 2.7423 2.5773 2.1546 2.2062 1.8969 2.0000 1.2680]; % vector que contiene los valores de Ue2 posibles
Ue2=Vec_Ue2(cond_mxsob+1); % Valor del sobrevoltaje de fase a tierra con un 2% de probabilidad de ser excedido
% Con Ue2, se busca en la curva la relaci�n Up2/Ue2, considerando
% energizaci�n o reenegizaci�n trif�sica
if (cont_ener==0)
    cociente1=(729871615393349*Ue2^5)/576460752303423488 - (2623786000649893*Ue2^4)/72057594037927936 + (702836594360727*Ue2^3)/2251799813685248 - (5048126429716799*Ue2^2)/4503599627370496 + (7248811755257103*Ue2)/4503599627370496 + 8767529904549667/9007199254740992;
else
    cociente1=- (455242266407397*Ue2^5)/18014398509481984 + (4726810298278483*Ue2^4)/18014398509481984 - (4913103504305565*Ue2^3)/4503599627370496 + (5198046167735151*Ue2^2)/2251799813685248 - (5926406780291779*Ue2)/2251799813685248 + 3278256210645993/1125899906842624;
end
Up2=cociente1*Ue2; % Valor del sobrevoltaje de fase a fase con un 2% de probabilidad de ser excedido
% C�lculo de Uet y Upt. Uet es el valor truncado de la distribuci�n
% acumulativa de los sobrevoltajes de fase a tierra. Upt es el valor
% truncado de la distribuci�n acumulativa de los sobrevoltajes de fase a
% fase
Uet=1.25*Ue2-.25;
Upt=1.25*Up2-.43;
Uet_kV=Uet*Vbase;
Upt_kV=Upt*Vbase;
%Comparaci�n de Uet con Ups y Upt con 2*Ups
% Los valores seleccionados son los menores
Urp_ff_lento=2*Ups;
Urp_ft_lento=Ups;
if (Upt_kV<Urp_ff_lento)
    Urp_ff_lento=Upt_kV;
end
if (Uet_kV<Urp_ft_lento)
    Urp_ft_lento=Uet_kV;
end
%Urp_ff_lento
%Urp_ft_lento


% ***********Determinacion de las tensiones soportadas de coordinacion (Ucw) ********

% Sobretensiones temporales
% Se considera que el factor de coordinaci�n es 1. Esta cantidad (K_c) representa el factor al cual se deden multiplicar los voltajes requeridos para obtener los correspondientes voltajes soportados de coordinaci�n. 
Ucw_ff_temp=Urp_ff_temp; % Voltaje soportado de coordinación del equipo de fase a fase
Ucw_ft_temp=Urp_ft_temp; % Voltaje soportado de coordinación del equipo de fase a tierra
%Ucw_ff_temp
%Ucw_ft_temp

% Sobretensiones de frente lento
Ue2_kv=Ue2*Vbase;
Up2_kv=Up2*Vbase;
cociente2=2*Ups/Up2_kv;
cociente3=Ups/Ue2_kv;
% Determinación del factor de coordinación el cual varía para fase-fase y fase-tierra
Kcd_ff=factor_kcd2(cociente2);
Kcd_ft=factor_kcd1(cociente3);
Ucw_ff_lento=Kcd_ff*Urp_ff_lento;
Ucw_ft_lento=Kcd_ft*Urp_ft_lento;
%Ucw_ff_lento
%Ucw_ft_lento

% Sobretensiones de frente rápido
La=Ra/Rkm; %
Ucw_rapido_int=Upl+(A/n)*(Lint/(Lsp+La));
Ucw_rapido_ext=Upl+((A/n)*(Lext/(Lsp+La)));
%Ucw_rapido_int
%Ucw_rapido_ext

% **********Determinación de las tensiones soportadas requeridas (Urw)**********

% Sobretensiones temporales
% m es el exponente en la formula del factor de correccion atmosferico para
% aislamiento externo
m1=1/2; % Este valor representa la situacion mas conservadora (Soporte para frecuencia de potencia)
Ka1=exp(m1*H/8150); % Ka es el factor de correccion atmosférico
Urw_ff_temp_int=Ucw_ff_temp*Ks_int;
Urw_ff_temp_ext=Ucw_ff_temp*Ks_ext*Ka1;
Urw_ft_temp_int=Ucw_ft_temp*Ks_int;
Urw_ft_temp_ext=Ucw_ft_temp*Ks_ext*Ka1;
%Urw_ff_temp_int
%Urw_ff_temp_ext
%Urw_ft_temp_int
%Urw_ft_temp_ext

% Sobretensiones de frente lento
m2=1; % Exponente m para aislamiento fase a fase
if (Ucw_ff_lento>1262.4)
    m2=(5411026565702297*Ucw_ff_lento^2)/151115727451828646838272 - (8480511649203559*Ucw_ff_lento)/18446744073709551616 + 429081367516787/281474976710656;
end
m3=1; % Exponente m para aislamiento fase a tierra
if(Ucw_ft_lento>339.2)
    m3=(5664886882404033*Ucw_ft_lento^2)/151115727451828646838272 - (8219864832008807*Ucw_ft_lento)/18446744073709551616 + 5149843839802175/4503599627370496;
end
Ka2=exp(m2*H/8150);
Urw_ff_lento_int=Ucw_ff_lento*Ks_int;
Urw_ff_lento_ext=Ucw_ff_lento*Ks_ext*Ka2;
Ka3=exp(m3*H/8150);
Urw_ft_lento_int=Ucw_ft_lento*Ks_int;
Urw_ft_lento_ext=Ucw_ft_lento*Ks_ext*Ka3;
%Urw_ff_lento_int
%Urw_ff_lento_ext
%Urw_ft_lento_int
%Urw_ft_lento_ext


% Sobretensiones de frente rapido
m4=1; % Debido a que se usa 1 para impulsos por relampago
Ka4=exp(m4*H/8150);
Urw_rapido_int=Ucw_rapido_int*Ks_int;
Urw_rapido_ext=Ucw_rapido_ext*Ks_ext*Ka4;
%Urw_rapido_int
%Urw_rapido_ext


%********Conversion a tensiones soportadas (Uw)***************

% Voltajes soportados a frecuencia de potencia (calculadas con tensiones de frente lento)
Uw_ff_p_int=Urw_ff_lento_int*.5;
Uw_ff_p_ext=Urw_ff_lento_ext*(.6+Urw_ff_lento_ext/12700);
Uw_ft_p_int=Urw_ft_lento_int*.5;
Uw_ft_p_ext=Urw_ft_lento_ext*(.6+Urw_ft_lento_ext/8500);
%Uw_ff_p_int
%Uw_ff_p_ext
%Uw_ft_p_int
%Uw_ft_p_ext

% Voltajes soportados de impulso tipo rayo
Uw_ff_r_int=Urw_ff_lento_int*1.1;
Uw_ff_r_ext=Urw_ff_lento_ext*(1.05+Urw_ff_lento_ext/9000);
Uw_ft_r_int=Urw_ft_lento_int*1.1;
Uw_ft_r_ext=Urw_ft_lento_ext*(1.05+Urw_ft_lento_ext/6000);
%Uw_ff_r_int
%Uw_ff_r_ext
%Uw_ft_r_int
%Uw_ft_r_ext

%******* Seleccion de niveles *****************

% Representando matriz de sobretensiones a frecuencia de potencia. La fila
% superior involucra a tensiones fase-tierra y la inferior tensiones
% fase-fase. La columna izquierda tensiones soportadas requeridas (Urw) y la
% derecha tensiones soportadas convertidas (Uw).
U_potencia_ext=[Urw_ft_temp_ext Uw_ft_p_ext;Urw_ff_temp_ext Uw_ff_p_ext];
U_potencia_int=[Urw_ft_temp_int Uw_ft_p_int;Urw_ff_temp_int Uw_ff_p_int];
U_maniobra_ext=[Urw_ft_lento_ext;Urw_ff_lento_ext];
U_maniobra_int=[Urw_ft_lento_int;Urw_ff_lento_int];
U_rayo_ext=[Urw_rapido_ext Uw_ft_r_ext;Urw_rapido_ext Uw_ff_r_ext];
U_rayo_int=[Urw_rapido_int Uw_ft_r_int;Urw_rapido_int Uw_ff_r_int];
U_potencia_ext
U_potencia_int
U_maniobra_ext
U_maniobra_int
U_rayo_ext
U_rayo_int

U_ff_potencia_ext=min([Urw_ff_temp_ext Uw_ff_p_ext]);
U_ff_potencia_int=min([Urw_ff_temp_int Uw_ff_p_int]);
U_ff_potencia=max([U_ff_potencia_ext U_ff_potencia_int]);% Este es el nivel de aislamiento a frecuencia de potencia de fase a fase
U_ft_potencia_ext=min([Urw_ft_temp_ext Uw_ft_p_ext]);
U_ft_potencia_int=min([Urw_ft_temp_int Uw_ft_p_int]);
U_ft_potencia=max([U_ft_potencia_ext U_ft_potencia_int]);% De fase a tierra

U_ff_maniobra=max([Urw_ff_lento_ext Urw_rapido_int Uw_ff_r_int]);
U_ft_maniobra=max([Urw_ft_lento_ext Urw_ft_lento_int]);

U_ff_rayo_ext=max([Urw_rapido_ext Uw_ff_r_ext]);
U_ft_rayo_ext=max([Urw_rapido_ext Uw_ft_r_ext]);
U_ff_rayo_int=max([Urw_rapido_int Uw_ff_r_int]);
U_ft_rayo_int=max([Urw_rapido_int Uw_ft_r_int]);
U_ff_rayo=max([U_ff_rayo_ext U_ff_rayo_int]);% Este es el nivel de aislamiento al relampago de fase a fase
U_ft_rayo=max([U_ft_rayo_ext U_ft_rayo_int]);

BSL_cal=U_ff_potencia;
BIL_cal=U_ff_rayo;

% Comparacion con niveles normalizados

% Rango I
tabla1=[3.6 10 20;3.6 10 40;7.2 20 40;7.2 20 60;12 28 60;12 28 75;12 28 95;17.5 38 75;17.5 38 95;24 50 95;24 50 125;24 50 145;36 70 145;36 70 170;52 95 250;72.5 140 325;123 185 450;123 230 550;145 185 450;145 230 550;145 275 650;170 230 550;170 275 650;170 325 750;245 275 650;245 325 750;245 360 850;245 395 950;245 460 1050;300 1125 850;300 1125 950;300 1275 950;300 1275 1050;362 1275 950;362 1275 1050;362 1425 1050;362 1425 1175;420 1360 1050;420 1360 1175;420 1425 1175;420 1425 1300;420 1575 1300;420 1575 1425];
nn1=43;
    while (nn1>0 & Uskv<=tabla1(nn1,1))
        ind1=nn1;
        nn1=nn1-1;
    end
%ind1
nn2=ind1;
kaux=1;
satisf=1:1:43;
for (nn2=ind1:1:43)
    if ( BIL_cal<=tabla1(nn2,3) & BSL_cal<=tabla1(nn2,2) )
        satisf(kaux)=nn2;
        kaux=kaux+1;
    end
end
%satisf
ind3=satisf(1);
Us_nor=tabla1(ind3,1);
BSL_nor=tabla1(ind3,2);
BIL_nor=tabla1(ind3,3);
%ind3
%Us_nor
%BSL_nor
%BIL_nor

% Distancias minimas

tabla2=[20 60 1600;40 60 1600;60 90 1600;75 120 1600;95 160 1600;125 220 1600;145 270 1600;170 320 1600;250 480 1600;325 630 1600;450 900 1600;550 1100 1600;650 1300 1600;750 1500 1600;850 1700 1600;950 1900 1700;1050 2100 1900;1175 2350 2200;1300 2600 2400;1425 2850 2600;1550 3100 2900;1675 3350 3100;1800 3600 3300;1950 3900 3600;2100 4200 3900];
for (nn3=1:1:25)
    if (BIL_nor==tabla2(nn3,1))
        d_estr_bar=tabla2(nn3,2);% Distancia minima en la estructura de barras
        d_cond_estr=tabla2(nn3,3);% Distancia minima entre conductor y estructura
    end
end
%d_estr_bar
%d_cond_estr



%INVOCA GUI DE PRESENTACIÓN DE RESULTADOS
Resultados