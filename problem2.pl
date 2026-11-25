%% This is a Turing machine for the language 0^i1^i2^i.

%% ADD PREDICATES FOR TRANSITIONS, ACCEPTING STATES, etc.
accepting(qaccept).

transition(q0, 0, q1, x, right).
transition(q0, 1, qreject, 1, stay).
transition(q0, 2, qreject, 2, stay).
transition(q0, x, q0, x, right).
transition(q0, y, q4, y, right).
transition(q0, z, qreject, z, stay).
transition(q0, blank, qaccept, blank, stay).

transition(q1, 0, q1, 0, right).
transition(q1, 1, q2, y, right).
transition(q1, 2, qreject, 2, stay).
transition(q1, x, qreject, x, stay).
transition(q1, y, q1, y, right).
transition(q1, z, qreject, z, stay).
transition(q1, blank, qreject, blank, stay).

transition(q2, 0, qreject, 0, stay).
transition(q2, 1, q2, 1, right).
transition(q2, 2, q3, z, left).
transition(q2, x, qreject, x, stay).
transition(q2, y, qreject, y, stay).
transition(q2, z, q2, z, right).
transition(q2, blank, qreject, blank, stay).

transition(q3, 0, q3, 0, left).
transition(q3, 1, q3, 1, left).
transition(q3, 2, q3, 2, left).
transition(q3, x, q3, x, left).
transition(q3, y, q3, y, left).
transition(q3, z, q3, z, left).
transition(q3, blank, q0, blank, right).

transition(q4, 0, qreject, 0, stay).
transition(q4, 1, qreject, 1, stay).
transition(q4, 2, qreject, 2, stay).
transition(q4, x, qreject, x, stay).
transition(q4, y, q4, y, right).
transition(q4, z, q5, z, right).
transition(q4, blank, qreject, blank, stay).

transition(q5, 0, qreject, 0, stay).
transition(q5, 1, qreject, 1, stay).
transition(q5, 2, qreject, 2, stay).
transition(q5, x, qreject, x, stay).
transition(q5, y, qreject, y, stay).
transition(q5, z, q5, z, right).
transition(q5, blank, qaccept, blank, stay).