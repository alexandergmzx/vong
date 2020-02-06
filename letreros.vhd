library ieee;
use ieee.std_logic_1164.all;
entity letreros is port(
CLK: in std_logic; 
keys: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
SW: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
RS, RW, EN, LCDON, LCDBLON: out std_logic;
DATA: out std_logic_vector (7 downto 0));	
end letreros;

architecture RTL of letreros is
type EDOS is (IDLE,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15,E16,E17,E18,E19,E20,E21,E22,E23,E24,E25,E26,E27,E28,E29,E30,E31,E32,E33,E34,E35,E36,E37,E38,E39,E40,E41,E42,E43,E44,E45,E46,E47,E48,E49,E50,E51,E52,E53,E54,E55,E56,E57,E58,E59,E60,E61,E62,E63,E64,E65,E66,E67,E68,E69,E70,E71,E72,E73,E74,E75,E76,E77,E78,E79,E80,E81,E82,E83,E84,E85,E86,E87,E88,ESPERA);
signal CUENTA: integer range 0 to 50000000;  				
signal EDO, EDO_F,EDO_X, EDO_Y : EDOS:=IDLE;
signal sel: std_logic_vector (1 downto 0);
signal D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31: std_logic_vector(7 downto 0);		
begin
process (CLK,CUENTA,EDO_Y)							
	begin			
		if (CLK'event and CLK = '1') then
			CUENTA <= CUENTA + 1;--ACTUALIZA EL CONTEO
			if CUENTA = 390625 then--ACTUALIZACION DE ESTADOS 390625
				EDO <= EDO_F;
				EDO_Y <= EDO_X;				
				CUENTA<= 0;
			end if;
		end if;
end process;

process(SW)
begin
CASE SW IS
--A:0 B:0
WHEN "0000"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"30";--0
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"30";--0
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
--A:0 B:1				
	WHEN "0001"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"30";--0
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"31";--1
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
--A:0 B:2				
	WHEN "0010"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"30";--0
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"32";--2
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
--A:0 B:3	
	WHEN "0011"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"30";--0
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"33";--3
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--

---------------------------------------------------------5
--A:1 B:0
	WHEN "0100"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"31";--1
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"30";--0
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
--A:1 B:1
	WHEN "0101"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"31";--1
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"31";--1
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
--A:1 B:2
	WHEN "0110"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"31";--1
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"32";--2
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--

------------------------------------------------------11
--A:1 B:3
	WHEN "0111"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"31";--1
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"33";--3
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--				
				
--A:2 B:0
	WHEN "1000"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"32";--2
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"30";--0
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
				
--A:2 B:1
	WHEN "1001"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"32";--2
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"31";--1
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--

--------------------------------------------16			
--A:2 B:2
	WHEN "1010"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"32";--2
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"32";--2
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--				
				
--A:2 B:3
	WHEN "1011"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"32";--2
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"33";--3
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
				
--A:2 B:0
	WHEN "1100"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"33";--3
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"30";--0
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--

-----------------------------------------21

--A:3 B:1
	WHEN "1101"=>D0 <= X"41";----A
				D1 <= X"3A";--:
				D2 <= X"33";--3
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"31";--1
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--				
				
--A:3 B:2
	WHEN "1110"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"33";--3
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"32";--2
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
				
--A:3 B:3
WHEN "1111"=>D0 <= X"41";--A
				D1 <= X"3A";--:
				D2 <= X"33";--3
				D3 <= X"42";--B
				D4 <= X"3A";--:
				D5 <= X"33";--3
				D6 <= X"20";--
				D7 <= X"20";--
				D8 <= X"20";--
				
	WHEN OTHERS=> NULL;
END CASE;
end process;

process(KEYs)
	begin
		CASE KEYs IS
WHEN "00" => D9  <= X"47";--G
				D10 <= X"41";--A
				D11 <= X"4E";--N
				D12 <= X"41";--A
				D13 <= X"44";--D
				D14 <= X"4F";--O
				D15 <= X"52";--R
				D16 <= X"20";--
				D17 <= X"20";--
				D19 <= X"20";
				D20 <= X"20";
				D21 <= X"20";
				D22 <= X"20";
				D23 <= X"20";
				D24 <= X"20";
				D25 <= X"20";

	WHEN "01" => D9  <= X"47";--G
				D10 <= X"41";--A
				D11 <= X"4E";--N
				D12 <= X"41";--A
				D13 <= X"44";--D
				D14 <= X"4F";--O
				D15 <= X"52";--R
				D16 <= X"3A";--:
				D17 <= X"41";--A
				D18 <= X"20";
				D19 <= X"20";
				D20 <= X"20";
				D21 <= X"20";
				D22 <= X"20";
				D23 <= X"20";
				D24 <= X"20";
				D25 <= X"20";
				
		WHEN "10" => D9  <= X"47";--G
				D10 <= X"41";--A
				D11 <= X"4E";--N
				D12 <= X"41";--A
				D13 <= X"44";--D
				D14 <= X"4F";--O
				D15 <= X"52";--R
				D16 <= X"3A";--:
				D17 <= X"42";--B
				D18 <= X"20";
				D19 <= X"20";
				D20 <= X"20";
				D21 <= X"20";
				D22 <= X"20";
				D23 <= X"20";
				D24 <= X"20";
				D25 <= X"20";
				
		WHEN OTHERS =>NULL;
end case;
end process;



process (EDO,EDO_X,EDO_F,EDO_Y)	---MAQUINA DE ESTADOS
	begin
	

	case EDO is
		
		when IDLE => 	RS <= '0';				--ESTADO IDLE
						RW <= '0'; 				
						EN <= '0'; 
						DATA <= x"00";
						EDO_X <= E1; 
						EDO_F <= ESPERA; 
		---------PRIMEROS ESTADO NECESARIOS PARA GENERAR UN RETRASO ANTES DE ESCRIBIR EN EL DISPLAY----
		
		when E1 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"38"; 
						EDO_X <= E2; 
						EDO_F <= ESPERA;
						
		when E2 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"38";
						EDO_X <= E4; 
						EDO_F <= ESPERA; 
						
		when E3 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"38"; 
						EDO_X <= E4; 
						EDO_F <= ESPERA; 
						
		when E4 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"0D"; 
						EDO_X <= E5; 
						EDO_F <= ESPERA;
						
		when E5 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"01"; 
						EDO_X <= E6; 
						EDO_F <= espera; 

		when E6 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"38";
						EDO_X <= E7; 
						EDO_F <= ESPERA;
						
		when E7 => 		RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= x"06"; 
						EDO_X <= E8; 
						EDO_F <= ESPERA;
						
		---------PRIMEROS ESTADO NECESARIOS PARA GENERAR UN RETRASO ANTES DE ESCRIBIR EN EL DISPLAY----				
		when E8 => 		RS <= '1'; 
						RW <= '0';
						EN <= '1';
						DATA <= D0;	--A								
						EDO_X <= E9; 
						EDO_F <= ESPERA; 
						
		when E9 =>		RS <= '1'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= D1;	--0
						EDO_X<= E10;
						EDO_F <=ESPERA;
						
		when E10 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D2;	 --1
						EDO_X <= E11;
						EDO_F <= ESPERA;
						
		when E11 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D3; 	 --0
						EDO_X <= E12;
						EDO_F <= ESPERA;
						
		when E12 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D4;	 --2
						EDO_X <= E13;
						EDO_F <= ESPERA;
						
		when E13 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D5; 	 --0
						EDO_X <= E14;
						EDO_F <= ESPERA;
						
		when E14 => 		RS <= '1'; 
						RW <= '0';
						EN <= '1'; 
						DATA <= D6; 	--1
						EDO_X <= E15; 
						EDO_F <= ESPERA; 
						
		when E15 =>		RS <= '1'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <=  D7;	--9
						EDO_X<= E16;
						EDO_F <=ESPERA;
						
		when E16 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D8;	 --9
						EDO_X <= E17;
						EDO_F <= ESPERA;
						
		when E17 => 	RS <= '0';
						RW <= '0';
						EN <= '1';
						DATA <= X"C0";	 --0
						EDO_X <= E18;
						EDO_F <= ESPERA;
						
		when E18 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D9;	 --2
						EDO_X <= E19;
						EDO_F <= ESPERA;
						
		when E19 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D10; 	 --0
						EDO_X <= E20;
						EDO_F <= ESPERA;
						
		when E20 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D11;	 --9
						EDO_X <= E21;
						EDO_F <= ESPERA;
						
		when E21 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D12; 	 --0
						EDO_X <= E22;
						EDO_F <= ESPERA;
						
		when E22 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D13;	 --2
						EDO_X <= E23;
						EDO_F <= ESPERA;
						
		when E23 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D14; 	 --0
						EDO_X <= E24;
						EDO_F <= ESPERA;
						
		when E24 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D15; 	 --0
						EDO_X <= E25;
						EDO_F <= ESPERA;
						
		when E25 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D16;	 --9
						EDO_X <= E26;
						EDO_F <= ESPERA;
						
		when E26 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D17; 	 --0
						EDO_X <= E27;
						EDO_F <= ESPERA;
						
						
		when E27 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D18;	 --9
						EDO_X <= E28;
						EDO_F <= ESPERA;
						
		when E28 => 	RS <= '1'; 
						RW <= '0';
						EN <= '1';
						DATA <= D19;									
						EDO_X <= E29; 
						EDO_F <= ESPERA; 
						
		when E29 =>		RS <= '1'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= D20;	--0
						EDO_X<= E30;
						EDO_F <=ESPERA;
						
		when E30 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D21;	 --1
						EDO_X <= E31;
						EDO_F <= ESPERA;
						
		when E31 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D22; 	 --0
						EDO_X <= E32;
						EDO_F <= ESPERA;
						
		when E32 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D23;	 --2
						EDO_X <= E33;
						EDO_F <= ESPERA;
						
		when E33 => 	RS <= '1';
						RW <= '0';
						EN <= '1';
						DATA <= D24; 	 --0
						EDO_X <= E34;
						EDO_F <= ESPERA;
						
						
		when E34 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1';
						DATA <=  X"02";	--9
						EDO_F <=ESPERA;
		
		when E35 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= X"08";	--9
						EDO_F <=ESPERA;
						
		when E36 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= X"0F";	--9
						EDO_F <=ESPERA;
						
		when E37 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= X"18";	--9
						EDO_F <=ESPERA;
						
		when E38 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= X"1C";	--9
						EDO_F <=ESPERA;
						
		when E39 =>		EDO_X<= E8;
						RS <= '0'; 
						RW <= '0'; 
						EN <= '1'; 
						DATA <= X"0E";	--9
						EDO_F <=ESPERA;
						

		when ESPERA =>	---ESTADO DE ESPERA, NO REALIZA NINGUN COMANDO
						RS <= '0'; 
						RW <= '0'; 
						EN <= '0';
						DATA <= x"00"; 
						EDO_F <= EDO_Y;
										
		when others => null; 		
	end case;
end process;

LCDON <= '1';  --ENCIENDE EL DISPLAY LCD
LCDBLON <= '1'; --ENCIENDE EL BACK LIGHT DEL DISPLAY
	
end RTL;