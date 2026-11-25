%% This is a Turing machine "simulator" you will complete.
%% accepts(State, LeftTapeReversed, RightTape) is true if State is a state and 
%% the given TM will reach the accepting state when run from State on that input tape. 
%% Use keywords blank, stay, left, right for the blank symbol and types of moves, respectively.

accepts(State, _, _) :- accepting(State).

accepts(State, LeftTapeReverse, [Symbol | RestRightTape]) :- %stay
    transition(State, Symbol, NewState, NewSymbol, stay),
    accepts(NewState, LeftTapeReverse, [NewSymbol | RestRightTape]).

accepts(State, LeftTapeReverse, [Symbol | RestRightTape]) :- %right
    transition(State, Symbol, NewState, NewSymbol, right),
    accepts(NewState, [NewSymbol | LeftTapeReverse], RestRightTape).

accepts(State, [PreviousSymbol | RestLeftTape], [Symbol | RestRightTape]) :- %left
    transition(State, Symbol, NewState, NewSymbol, left),
    accepts(NewState, RestLeftTape, [PreviousSymbol, NewSymbol | RestRightTape]).

accepts(State, LeftTapeReverse, []) :- %stay
    transition(State, blank, NewState, NewSymbol, stay),
    accepts(NewState, LeftTapeReverse, [NewSymbol]).

accepts(State, LeftTapeReverse, []) :- %right
    transition(State, blank, NewState, NewSymbol, right),
    accepts(NewState, [NewSymbol | LeftTapeReverse], []).

accepts(State, [PreviousSymbol|RestLeftTape], []) :- %left
    transition(State, blank, NewState, NewSymbol, left),
    accepts(NewState, RestLeftTape, [PreviousSymbol, NewSymbol]).

accepts(State, [], [Symbol | RestRightTape]) :- %left
    transition(State, Symbol, NewState, NewSymbol, left),
    accepts(NewState, [], [blank, NewSymbol | RestRightTape]).

accepts(State, [], []) :- %left
    transition(State, blank, NewState, NewSymbol, left),
    accepts(NewState, [], [blank, NewSymbol]).
    
