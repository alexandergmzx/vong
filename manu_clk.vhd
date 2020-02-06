library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.numeric_std.all;
 
 entity manu_clk is
    Port ( set       : in  std_logic;
			  clk       : in std_logic;
                  
           opu       : out std_logic
         );
 end manu_clk;
 
 architecture RTC of manu_clk is
 constant max_count : natural := 4000000;  
 signal w: std_logic;
 
 begin
    w<=set;
    process(w,clk)
     variable count : natural range 0 to max_count;
    begin
	      if w = '1' then
         elsif rising_edge(clk) then
            if count < max_count/2 then
                opu    <='1';
                count := count + 1;
            elsif count < max_count then
                opu    <='0';
                count := count + 1;
            else
                count := 0;
                opu   <='1';
            end if;
        end if;
		  
                             
                
                    
     end process; 
    
 end RTC;