% Niklas take on describing the world

%==============================================
% Family
%==============================================
%
% Test-facts
human(father).
human(son).
human(mother).
human(doughter).
human(grandmother).
parent(father, son).
parent(mother, son).
parent(father, doughter).
parent(mother, doughter).
parent(grandmother, father).
male(father).
male(son).
female(mother).
female(grandmother).
married_to(mother, father).

mother(A, B) :-
    female(A),
    parent(A, B).
father(A, B) :-
    male(A),
    parent(A, B).

grandparent(A, B) :-
    parent(A, C),
    parent(C, B).
grandfather(A, B) :-
    male(A),
    grandparent(A, B).
grandmother(A, B) :-
    female(A),
    grandparent(A, B).

sibling(A, B) :-
  parent(C, A),
  parent(C, B),
  A \== B.

brother(A, B) :-
  male(A),
  sibling(A, B).
sister(A, B) :-
  female(A),
  sibling(A, B).

cousin(A, B) :-
  siblings(C, D),
  parent(C, A),
  parent(D, B),
  \+ siblings(A, B). %TODO: test!

married(A, B) :-
  married_to(A, B);
  married_to(B, A).

husband(A, B) :-
  male(A),
  married(A, B).

wife(A, B) :-
  female(A),
  married(A, B).

%==============================================
% General
%==============================================
%
% Test-facts
% 
direct_part_of(valve, engine).
direct_part_of(engine, car).
direct_part_of(wheel, car).
direct_part_of(turbo, engine).
defect(turbo).
critical(turbo).
directly_in_front_of(a, b).
directly_in_front_of(b, c).
directly_in_front_of(b, x).
direct_reaction_to(hello, how_are_you).
direct_reaction_to(how_are_you, fine).

part_of(A, B) :-
  direct_part_of(A, B);
  direct_part_of(A, C), 
  part_of(C, B).

has_defect(A) :-
  defect(A);
  defect(B),
  part_of(B, A).
has_critical_defect(A) :-
  defect(A),
  critical(A);
  defect(B),
  critical(B),
  part_of(B, A).

in_front_of(A, B) :-
  directly_in_front_of(A, B);
  directly_in_front_of(A, C),
  in_front_of(C, B).
behind(A,B) :-
  in_front_of(B, A).
above(A, B) :-
  directly_above(A, B);
  directly_above(A, C),
  above(C, B).
under(A, B) :-
  above(B, A).

reaction_to(A, B) :-
  direct_reaction_to(A, B);
  direct_reaction_to(A, C),
  reaction_to(C, B).

