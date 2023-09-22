library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity practica01 is
	port(j1,j2,j3 : in std_logic;
			p,gp,gu : out std_logic);
			
end practica01;

architecture operaciones of practica01 is
	signal A,B,C,D,E,F : std_logic;
	begin
	A <= not j1 and not j2;
	B <= not j2 and not j3;
	C <= not j1 and not j3;
	p <= A or B or C;
	
	D <= j1 and not j2 and j3;
	E <= not j1 and j2 and j3;
	F <= j1 and j2 and not j3;
	gp <= D or E or F;
	
	gu <= j1 and j2 and j3;
	
end operaciones;