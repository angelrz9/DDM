LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ASM IS
	PORT(CLK: IN STD_LOGIC;
			 A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	       P: OUT STD_LOGIC;
			 Y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE BEAS OF ASM IS
TYPE ESTADOS IS (INICIO, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10);
SIGNAL PRESENTE: ESTADOS := INICIO;
SIGNAL AUX: INTEGER RANGE 0 TO 10000 := 0;
BEGIN

	PROCESS(A,CLK)
	BEGIN
		IF RISING_EDGE(CLK) THEN
			CASE PRESENTE IS
				WHEN INICIO => P <= '1';
									PRESENTE <= E1;
				
				WHEN E1 => 		Y <= "10010011";
									P <= '1';
									IF A = "1111" THEN
										PRESENTE <= E1;
									ELSE
										PRESENTE <= E2;
									END IF;
				
				WHEN E2 =>		Y <= "10010011";
									P <= '1';
									IF A(0) = '0' THEN
										PRESENTE <= E3;
									ELSE
										PRESENTE <= E4;
									END IF;
									
				WHEN E3 =>		Y <= "10011111";
									P <= '0';
									PRESENTE <= E10;
									
				WHEN E4 =>		Y <= "10010011";
									P <= '1';
									IF A(1) = '0' THEN
										PRESENTE <= E5;
									ELSE
										PRESENTE <= E6;
									END IF;
									
				WHEN E5 =>		Y <= "00100101";
									P <= '0';
									PRESENTE <= E10;
									
				WHEN E6 =>		Y <= "10010011";
									P <= '1';
									IF A(2) = '0' THEN
										PRESENTE <= E7;
									ELSE
										PRESENTE <= E8;
									END IF;
				
				WHEN E7 =>		Y <= "00001101";
									P <= '0';
									PRESENTE <= E10;
									
				WHEN E8 =>		Y <= "10010011";
									P <= '1';
									IF A(3) = '0' THEN
										PRESENTE <= E9;
									ELSE
										PRESENTE <= E1;
									END IF;
				
				WHEN E9 =>		Y <= "10011001";
									P <= '0';
									PRESENTE <= E10;
				
				WHEN E10 =>		IF AUX = 10000 THEN
										AUX <= 0;
										PRESENTE <= INICIO;
									ELSE
										AUX <= AUX + 1;
										PRESENTE <= E10;
									END IF;
			END CASE;
		END IF;
	END PROCESS;

END BEAS;