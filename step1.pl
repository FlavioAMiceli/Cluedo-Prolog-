ft_member(E, [E|_]).

ft_member(E, [_|Tail]) :-
    ft_member(E, Tail).

man(marc).
man(luc).
man(jean).
man(jules).
man(leon).
man(loic).
man(gerard).
man(jacques).
man(herve).
man(paul).

woman(anne).
woman(betty).
woman(lisa).
woman(sylvie).
woman(eve).
woman(julie).
woman(valerie).

children_of(marc, [jean, jules, leon]).
children_of(anne, [jean, jules, leon]).
children_of(luc, [lisa, loic, gerard]).
children_of(betty, [lisa, loic, gerard]).
children_of(jules, [jacques]).
children_of(lisa, [jacques]).
children_of(leon, [herve, julie]).
children_of(sylvie, [herve, julie]).
children_of(loic, [paul, valerie]).
children_of(eve, [paul, valerie]).

child_of(Parent, Child) :-
    children_of(Parent, Children),
    ft_member(Child, Children).

wife_of(marc, anne).
wife_of(luc, betty).
wife_of(loic, eve).
wife_of(leon, sylvie).
wife_of(jules, lisa).
wife_of(paul, julie).

husband_of(Wife, Husband) :-
    wife_of(Husband, Wife).

married_to(Person, Wife) :-
    wife_of(Person, Wife).

married_to(Person, Husband) :-
    husband_of(Person, Husband).

father-in-law_of(Person, FIL) :-
    married_to(Person, Spouse),
    man(FIL),
    child_of(FIL, Spouse).

mother-in-law_of(Person, MIL) :-
    married_to(Person, Spouse),
    woman(MIL),
    child_of(MIL, Spouse).

ancestor_of(Person, Ancestor) :-
    child_of(Ancestor, Person).

ancestor_of(Person, Ancestor) :-
    child_of(Parent, Person),
    ancestor_of(Parent, Ancestor).
