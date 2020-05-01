mujer(ana).
mujer(maria).
mujer(luisa).
mujer(fabiola).
mujer(esther).
mujer(rocio).
mujer(diana).
mujer(vanessa).
mujer(martha).
mujer(romina).
mujer(daniela).

hombre(hugo). adulto(hugo).
hombre(paco).
hombre(luis).
hombre(mario).
hombre(marco).
hombre(juan). ninio(juan).
hombre(pedro).
hombre(raul).
hombre(gabriel).
hombre(sergio).


madre(ana,rocio).
madre(ana,maria).
madre(ana,luis).
madre(martha,daniela).
madre(fabiola,romina).
madre(romina,luisa).

padre(raul,rocio).
padre(marco,hugo).
padre(pedro,gabriel).
padre(marco,romina).
padre(sergio,paco).
padre(hugo,sergio).




%REGLAS
%============================ABUELO===============================
abuelo(X,Y):-hombre(X),padre(Z,Y),padre(X,Z).
abuelo(X,Y):-hombre(X),madre(Z,Y),madre(X,Z).

%--------------------RESULTADO-----------------------------------
%	X = hugo , Y = paco 
%	X = marco , Y = sergio
%----------------------------------------------------------------

%============================ABUELA===============================
abuela(X,Y):-mujer(X),padre(Z,Y),padre(X,Z).
abuela(X,Y):-mujer(X),madre(Z,Y),madre(X,Z).

%--------------------RESULTADO-----------------------------------
%	X = fabiola , Y = luisa 
%----------------------------------------------------------------


%============================PERSONA===============================
persona(X):- hombre(X) ; mujer(X).

%--------------------RESULTADO-----------------------------------
%	TODOS LOS HOMBRES Y MUJERES DE LOS HECHOS
%----------------------------------------------------------------

%============================NIETO===============================
nieto(X,Y):- hombre(X) , abuelo(Y,X).
nieto(X,Y):- hombre(X) , abuela(Y,X).

%--------------------RESULTADO-----------------------------------
%	X = paco, Y = hugo 
%	X = sergio, Y = marco 
%----------------------------------------------------------------

%============================NIETA===============================
nieta(X,Y):- mujer(X) , abuelo(Y,X).
nieta(X,Y):- mujer(X) , abuela(Y,X).

%--------------------RESULTADO-----------------------------------
%	X = luisa, Y = fabiola
%----------------------------------------------------------------


%============================HERMANO===============================
hermano(X,Y):- hombre(X) , padre(Z,X) , hijo(Y,Z), X\=Y.
hermano(X,Y):- hombre(X) , madre(Z,X), hijo(Y,Z),  X\=Y.
hermano(X,Y):- hombre(X) , padre(Z,X) , hija(Y,Z), X\=Y.
hermano(X,Y):- hombre(X) , madre(Z,X), hija(Y,Z),  X\=Y.

%--------------------RESULTADO-----------------------------------
%	X = hugo , Y = romina 
%	X = luis , Y = maria 
%	X = luis , Y = rocio 

%----------------------------------------------------------------

%============================HERMANA===============================
hermana(X,Y):- mujer(X) , padre(Z,X) , hija(Y,Z), X\=Y.
hermana(X,Y):- mujer(X) , madre(Z,X), hija(Y,Z),  X\=Y.
hermana(X,Y):- mujer(X) , padre(Z,X) , hijo(Y,Z), X\=Y.
hermana(X,Y):- mujer(X) , madre(Z,X), hijo(Y,Z),  X\=Y.

%--------------------RESULTADO-----------------------------------
%	X = maria , Y = rocio 
%	X = rocio , Y = maria 
%	X = romina , Y = hugo 
%	X = maria , Y = luis 
%	X = rocio, Y = luis 
%----------------------------------------------------------------

%============================HIJO===============================
hijo(X,Y):- hombre(X), padre(Y,X).
hijo(X,Y):- hombre(X), madre(Y,X).

%--------------------RESULTADO-----------------------------------
%	X = hugo , Y = marco 
%	X = paco , Y = sergio 
%	X = gabriel , Y = pedro 
%	X = sergio , Y = hugo 
%	X = luis , Y = ana 

%----------------------------------------------------------------

%============================HIJA===============================
hija(X,Y):- mujer(X), padre(Y,X).
hija(X,Y):- mujer(X), madre(Y,X).

%--------------------RESULTADO-----------------------------------
%	X = rocio , Y = raul 
%	X = romina , Y = marco 
%	X = maria , Y = ana 
%	X = luisa , Y = romina 
%	X = rocio , Y = ana 
%	X = romina , Y = fabiola 
%	X = daniela , Y = martha.
%----------------------------------------------------------------


%============================PAREJA===============================
pareja(X,Y):- padre(X,Z) , madre(Y,Z).
pareja(X,Y):- madre(X,Z) , padre(Y,Z).

%--------------------RESULTADO-----------------------------------
%	X = raul , Y = ana 
%	X = marco , Y = fabiola 
%	X = ana , Y = raul 
%	X = fabiola , Y = marco 
%----------------------------------------------------------------


