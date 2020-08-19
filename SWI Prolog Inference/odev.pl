:-include('isimler_ddi.pl').
:-include('fiiller_ddi.pl').
:-dynamic ekle/3.
mekan('nerede yap�l�r?').
mekan('nerede bulunur?'). 
mekan('nerede bulunur? ').

eylem('ne i�e yarar').
eylem('nas�l yap�l�r?').
eylem('ne olunca yap�l�r?').
eylem('ni�in yap�l�r?').
eylem('yap�nca ne olur?').

eylem2('kim/ne yapar?').
eylem2('ne olunca yap�l�r?').
eylem2('yap�nca ne olur?').
eylem2('nas�l yap�l�r?').
eylem2('nerede yap�l�r?').
eylem2('ni�in yap�l�r?').

eylem3('i�inde neler bulunur?').

eylem4('ne i�e yarar').
eylem4('nerede bulunur?').
eylem4('nerede bulunur? ').

eylem5('nerede bulunur? ').
eylem5('nerede bulunur?').
eylem5('yan�nda neler bulunur?').

eylem6('yap�nca ne olur?').
eylem6('ni�in yap�l�r?').


ozellik('rengi'). %isim
ozellik('�ekli nas�l?'). %isim
ozellik('a��rl�k gr/kg'). %isim
ozellik('a��rl�k kg'). %isim
ozellik('canl�/cans�z'). %isim
ozellik('hacmi cm3/m3'). %isim
ozellik('hamaddesi nedir?'). %isim
ozellik('s�fatlar�'). %isim

ozne('neye/kime yap�l�r?'). %fiil +++
ozne('kim kullan�r'). %isim
ozne('neyi/kimi yap�l�r?'). %fiil
ozne('kim/ne ile yap�l�r?'). %fiil
ozne('kim/ne yapar?'). %fiil

ozne2('kim kullan�r'). %isim
ozne2('kim/ne yapar?'). %fiil

nesne('�st kavram� nedir?'). %isim
nesne('kim/ne ile yap�l�r?'). %fiil
nesne('kim/ne yapar?'). %fiil
nesne('i�inde neler bulunur?'). %isim
nesne('yan�nda neler bulunur?'). %isim
nesne('neyi/kimi yap�l�r?'). %fiil


yaz(X, Y , Z , W , Q):- write('( '), write(X), write(' '), write(Y), write(' '), write(Z), write(' '),write(W),write(' '),write(Q),write(' ).').
yazS(X, Y, Z, W , Q):-open('X.txt',append,F), write(F,'( '), write(F,X), write(F,' -> '), write(F,Y), write(F,' -> '), write(F,Z), write(F,' -> '),write(F,W), write(F,' -> '),write(F,Q),write(F,' ).'),nl(F), close(F).
cumle(Ozne, Nesne, Zaman, Mekan, Eylem) :-cumle2(Ozne, Nesne, Zaman, Mekan, Eylem).                                                                                                      


							   
cumle2(Ozne, Nesne, _, _, _) :- (nonvar(Nesne),
                               ozne(A),
                               iliski(Nesne,A, B),not(ekle(Ozne,B,A)),
							   (((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' d�r.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' d�r.'), yaz(Nesne, A, B,'',''),nl)),false);true),
							   
							   
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
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yap�yor olabilir.'),close(F), yazS(Nesne, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yap�yor olabilir.'), yaz(Nesne, A, B,'',''),nl),false);true),
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
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' de/i�inde bulunuyor olabilir.'),close(F), yazS(Mekan, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' de/i�inde bulunuyor olabilir.'), yaz(Mekan, A, B,'',''),nl),false);true),
							   
					           (nonvar(Mekan),eylem5(A),eylem(A2),iliski(Mekan,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' yap�yor olabilir.'),close(F),yazS(Ozne,B,'da/i�inde',A2,C),
							    write(Ozne),write(' '),write(C),write(' yap�yor olabilir.'),yaz(Ozne,B,'da/i�inde',A2,C),nl),false);true),

							   (nonvar(Mekan),eylem5(A),eylem(A2),eylem6(A3),iliski(Mekan,A,B),
							   iliski(B,A2,C),iliski(C,A3,D),not(ekle(Ozne,D,A3)),
							   ((asserta(ekle(Ozne,D,A3)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,D),write(F,' olmu� olabilir/sebep olmu� olabilir.'),close(F),yazS(Ozne,C,' yapt�ysa ',A3,D),
							    write(Ozne),write(' '),write(D),write(' olmu� olabilir/sebep olmu� olabilir.'),yaz(Ozne,C,' yapt�ysa ',A3,D),nl),false);true),											
							   fail.
							   

cumle2(Ozne, _, _, Mekan, _) :-(nonvar(Mekan),
                               eylem(A),
                               iliski(Mekan,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yap�yor olabilir.'),close(F), yazS(Mekan, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yap�yor olabilir.'), yaz(Mekan, A, B,'',''),nl),false);true),
							   fail.			

cumle2(Ozne, _, _, _, Eylem) :-(nonvar(Eylem),
                               eylem(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' yap�yor olabilir.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' yap�yor olabilir.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   fail.	

cumle2(Ozne, _, _, _, Eylem) :- (nonvar(Eylem),
                               mekan(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' de/i�inde bulunuyor olabilir.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' de/i�inde bulunuyor olabilir.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   
							   (nonvar(Eylem),mekan(A),eylem(A2),iliski(Eylem,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' yap�yor olabilir.'),close(F),yazS(Ozne,B,'da/i�inde',A2,C),
							   write(Ozne),write(' '),write(C),write(' yap�yor olabilir.'),yaz(Ozne,B,'da/i�inde',A2,C),nl),false);true),	
							   fail.
							   
							   
cumle2(Ozne, _, _, _, Eylem) :-(nonvar(Eylem),
                               ozne(A),
                               iliski(Eylem,A, B),not(ekle(Ozne,B,A)),
							   ((asserta(ekle(Ozne,B,A)),
                               open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,B),write(F,' d�r.'),close(F), yazS(Eylem, A, B,'',''),
                               write(Ozne),write(' '),write(B),write(' d�r.'), yaz(Eylem, A, B,'',''),nl),false);true),
							   
							   (nonvar(Eylem),ozne(A),eylem4(A2),iliski(Eylem,A,B),
							   iliski(B,A2,C),not(ekle(Ozne,C,A2)),
							   ((asserta(ekle(Ozne,C,A2)),
							   open('X.txt',append,F),
                               write(F,Ozne),write(F,' '),write(F,C),write(F,' olabilir.'),close(F),yazS(Ozne,B,A2,C,''),
							   write(Ozne),write(' '),write(C),write(' olabilir.'),yaz(Ozne,B,A2,C,''),nl),false);true),	
							   fail.
								
							 