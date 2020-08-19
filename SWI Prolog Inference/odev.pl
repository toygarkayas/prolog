:-include('isimler_ddi.pl').
:-include('fiiller_ddi.pl').
:-dynamic ekle/3.
mekan('nerede yapýlýr?').
mekan('nerede bulunur?'). 
mekan('nerede bulunur? ').

eylem('ne iþe yarar').
eylem('nasýl yapýlýr?').
eylem('ne olunca yapýlýr?').
eylem('niçin yapýlýr?').
eylem('yapýnca ne olur?').

eylem2('kim/ne yapar?').
eylem2('ne olunca yapýlýr?').
eylem2('yapýnca ne olur?').
eylem2('nasýl yapýlýr?').
eylem2('nerede yapýlýr?').
eylem2('niçin yapýlýr?').

eylem3('içinde neler bulunur?').

eylem4('ne iþe yarar').
eylem4('nerede bulunur?').
eylem4('nerede bulunur? ').

eylem5('nerede bulunur? ').
eylem5('nerede bulunur?').
eylem5('yanýnda neler bulunur?').

eylem6('yapýnca ne olur?').
eylem6('niçin yapýlýr?').


ozellik('rengi'). %isim
ozellik('þekli nasýl?'). %isim
ozellik('aðýrlýk gr/kg'). %isim
ozellik('aðýrlýk kg'). %isim
ozellik('canlý/cansýz'). %isim
ozellik('hacmi cm3/m3'). %isim
ozellik('hamaddesi nedir?'). %isim
ozellik('sýfatlarý'). %isim

ozne('neye/kime yapýlýr?'). %fiil +++
ozne('kim kullanýr'). %isim
ozne('neyi/kimi yapýlýr?'). %fiil
ozne('kim/ne ile yapýlýr?'). %fiil
ozne('kim/ne yapar?'). %fiil

ozne2('kim kullanýr'). %isim
ozne2('kim/ne yapar?'). %fiil

nesne('üst kavramý nedir?'). %isim
nesne('kim/ne ile yapýlýr?'). %fiil
nesne('kim/ne yapar?'). %fiil
nesne('içinde neler bulunur?'). %isim
nesne('yanýnda neler bulunur?'). %isim
nesne('neyi/kimi yapýlýr?'). %fiil


yaz(X, Y , Z , W , Q):- write('( '), write(X), write(' '), write(Y), write(' '), write(Z), write(' '),write(W),write(' '),write(Q),write(' ).').
yazS(X, Y, Z, W , Q):-open('X.txt',append,F), write(F,'( '), write(F,X), write(F,' -> '), write(F,Y), write(F,' -> '), write(F,Z), write(F,' -> '),write(F,W), write(F,' -> '),write(F,Q),write(F,' ).'),nl(F), close(F).
cumle(Ozne, Nesne, Zaman, Mekan, Eylem) :-cumle2(Ozne, Nesne, Zaman, Mekan, Eylem).                                                                                                      


							   
cumle2(Ozne, Nesne, _, _, _) :- (nonvar(Nesne),
                               ozne(A),
                               iliski(Nesne,A, B),not(ekle(Ozne,B,A)),
							   (((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' dýr.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' dýr.'), yaz(Nesne, A, B,'',''),nl)),false);true),
							   
							   
							   (nonvar(Nesne),ozne(A),ozne2(A2),iliski(Nesne,A,B),
							   iliski(C,A2,B),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' kullanabilir/yapabilir.'),close(F),yazS(Ozne,B,A2,C,''),
							    write(Ozne),write(' '),write(C),write(' kullanabilir/yapabilir.'),yaz(Ozne,B,A2,C,''),nl),false);true),
							   
							   
							   (nonvar(Nesne),ozne(A),ozne2(A2),eylem2(A3),iliski(Nesne,A,B),
							   iliski(C,A2,B),iliski(D,A3,C),not(ekle(Ozne,D,A3)),
							   ((asserta(ekle(Ozne,D,A3)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,D),write(F,' kullanabilir/yapabilir.'),close(F),yazS(Ozne,B,C,A3,D),
							    write(Ozne),write(' '),write(D),write(' kullanabilir/yapabilir.'),yaz(Ozne,B,C,A3,D),nl),false);true),
								fail.	
								
cumle2(Ozne, Nesne, _, _, _) :- (nonvar(Nesne),
                               eylem(A),
                               iliski(Nesne,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yapýyor olabilir.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yapýyor olabilir.'), yaz(Nesne, A, B,'',''),nl),false);true),
                               fail.

cumle2(Ozne, Nesne, _, _, _) :- (nonvar(Nesne),
                               mekan(A),
                               iliski(Nesne,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' da bulunabilir.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' da bulunabilir.'), yaz(Nesne, A, B,'',''),nl),false);true),
							   
							  (nonvar(Nesne),mekan(A),eylem3(A2),iliski(Nesne,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' olabilir.'),close(F),yazS(Ozne,C,A2,B,''),
							    write(Ozne),write(' '),write(C),write(' olabilir.'),yaz(Ozne,C,A2,B,''),nl),false);true),
								
							   (nonvar(Nesne),ozne(A),ozne2(A2),eylem2(A3),iliski(Nesne,A,B),
							   iliski(C,A2,B),iliski(D,A3,C),not(ekle(Ozne,D,A3)),
							   ((asserta(ekle(Ozne,D,A3)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,D),write(F,' kullanabilir/yapabilir.'),close(F),yazS(Ozne,C,A3,D,''),
							    write(Ozne),write(' '),write(D),write(' kullanabilir/yapabilir.'),yaz(Ozne,C,A3,D,''),nl),false);true),															   
                               fail.
							   

cumle2(Ozne, Nesne, _, _, _) :-  (nonvar(Nesne),
                               nesne(A),
                               iliski(Nesne,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' olabilir.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' olabilir.'), yaz(Nesne, A, B,'',''),nl),false);true),
							   
							  (nonvar(Nesne),mekan(A),eylem4(A2),iliski(Nesne,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' yapabilir/olabilir.'),close(F),yazS(Ozne,B,A2,C,''),
							    write(Ozne),write(' '),write(C),write(' yapabilir/olabilir.'),yaz(Ozne,B,A2,C,''),nl),false);true),							   					   
                               fail.	


cumle2(Ozne, _, _, Mekan, _) :-(nonvar(Mekan),
                               eylem5(A),
                               iliski(Mekan,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' de/içinde bulunuyor olabilir.'),close(F), yazS(Mekan, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' de/içinde bulunuyor olabilir.'), yaz(Mekan, A, B,'',''),nl),false);true),
							   
					           (nonvar(Mekan),eylem5(A),eylem(A2),iliski(Mekan,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' yapýyor olabilir.'),close(F),yazS(Ozne,B,'da/içinde',A2,C),
							    write(Ozne),write(' '),write(C),write(' yapýyor olabilir.'),yaz(Ozne,B,'da/içinde',A2,C),nl),false);true),

							   (nonvar(Mekan),eylem5(A),eylem(A2),eylem6(A3),iliski(Mekan,A,B),
							   iliski(B,A2,C),iliski(C,A3,D),not(ekle(Ozne,D,A3)),
							   ((asserta(ekle(Ozne,D,A3)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,D),write(F,' olmuþ olabilir/sebep olmuþ olabilir.'),close(F),yazS(Ozne,C,' yaptýysa ',A3,D),
							    write(Ozne),write(' '),write(D),write(' olmuþ olabilir/sebep olmuþ olabilir.'),yaz(Ozne,C,' yaptýysa ',A3,D),nl),false);true),											
							   fail.
							   

cumle2(Ozne, _, _, Mekan, _) :-(nonvar(Mekan),
                               eylem(A),
                               iliski(Mekan,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yapýyor olabilir.'),close(F), yazS(Mekan, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yapýyor olabilir.'), yaz(Mekan, A, B,'',''),nl),false);true),
							   fail.			

cumle2(Ozne, _, _, _, Eylem) :-(nonvar(Eylem),
                               eylem(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yapýyor olabilir.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yapýyor olabilir.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   fail.	

cumle2(Ozne, _, _, _, Eylem) :- (nonvar(Eylem),
                               mekan(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' de/içinde bulunuyor olabilir.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' de/içinde bulunuyor olabilir.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   
							   (nonvar(Eylem),mekan(A),eylem(A2),iliski(Eylem,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' yapýyor olabilir.'),close(F),yazS(Ozne,B,'da/içinde',A2,C),
							   write(Ozne),write(' '),write(C),write(' yapýyor olabilir.'),yaz(Ozne,B,'da/içinde',A2,C),nl),false);true),	
							   fail.
							   
							   
cumle2(Ozne, _, _, _, Eylem) :-(nonvar(Eylem),
                               ozne(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' dýr.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' dýr.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   
							   (nonvar(Eylem),ozne(A),eylem4(A2),iliski(Eylem,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' olabilir.'),close(F),yazS(Ozne,B,A2,C,''),
							   write(Ozne),write(' '),write(C),write(' olabilir.'),yaz(Ozne,B,A2,C,''),nl),false);true),	
							   fail.
								
							 