:-use_module(db/enterprise).

:- op(700,xfx,ealier).
:- op(700,xfx,later).
ealier(date(D1,M1,Y1),date(D2,M2,Y2)):-Y1<Y2;Y1=Y2,M1<M2;Y1=Y2,M1=M2,D1<D2.
later(date(D1,M1,Y1),date(D2,M2,Y2)):-Y1>Y2;Y1=Y2,M1>M2;Y1=Y2,M1=M2,D1>D2.

depchief(department(_,X,_),X).
depworkers(department(_,_,X),X).
depworker(department(_,_,W),X):-member(X,W).

dateofbirth(worker(_,_,Date,_,_,_), Date).
man(worker(_,male,_,_,_,_)).
woman(worker(_,female,_,_,_,_)).

current_date(X):-get_time(Time),stamp_date_time(Time,date(Y,M,D,_,_,_,_,_,_),'local'),date(Y,M,D)=X.

age(Year,Month,Day,worker(_,_,date(D,M,Y),_,_,_),Age):-Year>Y,(Month>M,Age is Year-Y,!;
                                                               Month=M,Day>=D,Age is Year-Y,!;
                                                               Age is Year-Y-1);
                                                       Age is 0.
age(Worker,Age):-current_date(date(Y,M,D)),age(Y,M,D,Worker,Age).

depname(X):-department(X,_,_).
depchief(X):-department(_,X,_).
depworkers(X):-department(_,_,X).
depworker(X):-depworkers(W), member(X,W).
eworker(X):-depchief(X);depworker(X).
	wname(X):-eworker(worker(X,_,_,_,_,_)).
	wgender(X):-eworker(worker(_,X,_,_,_,_)).
	wbdate(X):-eworker(worker(_,_,X,_,_,_)).
		wbday(X):-wbdate(date(X,_,_)).
		wbmonth(X):-wbdate(date(_,X,_)).
		wbyear(X):-wbdate(date(_,_,X)).
	wpost(X):-eworker(worker(_,_,_,X,_,_)).
	wprofession(X):-eworker(worker(_,_,_,_,X,_)).
	wchildren(X):-eworker(worker(_,_,_,_,_,X)).

oldestworker(X):-eworker(X),dateofbirth(X,XDate),not((eworker(Y),dateofbirth(Y,YDate),YDate ealier XDate)).
youngestworker(X):-eworker(X),dateofbirth(X,XDate),not((eworker(Y),dateofbirth(Y,YDate),YDate later XDate)).

pensioner(Year,Month,Day,X):-eworker(X),age(Year,Month,Day,X,Age),(man(X),Age>=60;woman(X),Age>=55).
pensioner(X):-current_date(date(Y,M,D)),pensioner(Y,M,D,X).

depworkersamount(Name,N):-department(Name,_,Workers),length(Workers,L), N is L+1.
biggestdep(X):-depname(X),depworkersamount(X,N),not((depworkersamount(_,M),M>N)),write(N).
