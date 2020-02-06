library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seg7 is

port(m: in integer range 0 to 16;
     num: out std_logic_vector(6 downto 0));
end seg7;

architecture s7 of seg7 is
begin
process(m)
begin
case m is
	when 0=> num <="0000001";  -- '0'
	when 1=> num <="1001111";  -- '1'
	when 2=> num <="0010010";  -- '2'
	when 3=> num <="0000110";  -- '3'
	when 4=> num <="1001100";  -- '4'
	when 5=> num <="0100100";  -- '5'
	when 6=> num <="0100000";  -- '6'
	when 7=> num <="0001111";  -- '7'
	when 8=> num <="0000000";  -- '8'
	when 9=> num <="0000100";  -- '9'
	when 10=> num <="0001000";  -- 'A'
	when 11=> num <="1100000";  -- 'b'
	when 12=> num <="1110010";  -- 'c'
	when 13=> num <="1000010";  -- 'd'
	when 14=> num <="0110000";  -- 'E'
	when 15=> num <="0111000";  -- 'F'
	when others => num <= "1111111"; 
end case;
end process;
end s7;