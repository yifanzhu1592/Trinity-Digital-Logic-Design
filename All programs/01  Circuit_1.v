module  Circuit_1(A, B, C, F1, F2);
output  F1, F2;
input   A, B, C;

and     G1(T2, A, B, C);
or      G2(T1, A, B, C);
and     G3(T4, A, B);
and     G4(T5, A, C);
and     G5(T6, B, C);
or      G6(F2, T4, T5, T6);
not     G7(T7, F2);
and     G8(T3, T1, T7);
or      G9(F1, T2, T3);

endmodule
