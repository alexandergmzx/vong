library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.numeric_std.all;
 
 entity sec_clk is
    Port ( 
           clks : in  std_logic;
			  rsts:  in  std_logic;
           ops  : out std_logic
    );
 end sec_clk;
 
 architecture RTC of sec_clk is
   constant max_count : natural := 15000;
   --signal rsts: std_logic;
 begin
       
	 
    compteur : process(clks,rsts)
        variable count : natural range 0 to max_count;
    begin
	     if rsts='0' then
		  count := 0;
		  ops<='1';
        elsif rising_edge(clks) then
            if count < max_count/2 then
                ops    <='1';
                count := count + 1;
            elsif count < max_count then
                ops    <='0';
                count := count + 1;
            else
                count := 0;
                ops   <='1';
            end if;
        end if;
    end process compteur; 
 end RTC;