library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGAS is
port(
		clk: in std_logic;
		video_out: out std_logic;
		horiz_sync_out, vert_sync_out, pix_clk: out std_logic;
	   pixel_row, pixel_col: out unsigned (9 downto 0)
	 );
	 
end VGAS;

architecture a of VGAS is
signal horiz_sync, vert_sync: std_logic;
signal video_on, video_on_h, video_on_v: std_logic;
signal h_count, v_count: unsigned(9 downto 0);
signal clko: std_logic;
signal lock:std_logic;

component sycclk
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
end component;

begin

video_on<= video_on_h and video_on_v;
pix_clk<=clko;
sycclk_inst : sycclk PORT MAP (
		areset	 => '0',
		inclk0	 => clk,
		c0	 => clko,
		locked	 => lock
	);

process

begin

wait until rising_edge(clko);

if(h_count = 799) then
h_count<= (others=>'0');
else
h_count<=h_count+1;
end if;

if(h_count<= 755) and (h_count>=659) then
horiz_sync<='0';
else
horiz_sync<='1';
end if;

if (v_count >= 524) and (h_count >= 699) then
v_count<=(others=>'0');
elsif (h_count=699)then
v_count<=v_count+1;
end if;

if (v_count <= 494) and (v_count >= 493) then
vert_sync<='0';
else
vert_sync<='1';
end if;

if(h_count <= 639) then
video_on_h<='1';
pixel_col<=h_count;
else
video_on_h<='0';
end if;

if(v_count <=479) then
video_on_v<= '1';
pixel_row<= v_count;
else
video_on_v<='0';
end if;

video_out<=video_on;
horiz_sync_out<= horiz_sync;
vert_sync_out<= vert_sync;

end process;

end a;