----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:54 04/03/2012 
-- Design Name: 
-- Module Name:    practica6 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity practica6 is
    Port ( --bin : in  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
			  clk : in std_logic;
			  down : in STD_LOGIC;
			  up : in STD_LOGIC
			  --down: in STD_LOGIC 
			  );
end practica6;

architecture Behavioral of practica6 is

signal BCD: std_logic_vector(15 downto 0);
--signal mux: std_logic_vector (3 downto 0);
--signal divisor: integer range 0 to 5000000;
signal contador: std_logic_vector (13 downto 0);
--signal contador: integer range 0 to 10000;
signal cont_sel: integer range 0 to 3;
--signal aup: STD_LOGIC;
--signal adown: STD_LOGIC;
signal cont_desp: integer range 0 to 50000;
signal B0,B1,B2,B3: std_logic_vector (3 downto 0);
signal mux: std_logic_vector (3 downto 0);
--signal down_an : STD_LOGIC;
--signal up_an : STD_LOGIC;
constant CNT_size: integer :=19;
signal btn_prev_up: std_logic:='0';
signal btn_prev_down: std_logic:='0';
signal counter: std_logic_vector (CNT_size downto 0):=(others=>'0');
signal counter1: std_logic_vector (CNT_size downto 0):=(others=>'0');
signal btn_out_up: STD_logic;
signal btn_out_up_an: STD_logic;
signal btn_out_down: STD_logic;
signal btn_out_down_an: STD_logic;
--signal input: integer;
--signal acont: std_logic_vector (13 downto 0);
begin

BCD1:process(contador)
variable z:std_logic_vector (29 downto 0);
begin

for i in 0 to 29 loop
z(i):='0';
end loop;
--z(15 downto 2):=output;
z(16 downto 3):=contador(13 downto 0);
for i in 0 to 10 loop

if z(17 downto 14)>4 then 
z(17 downto 14):=z(17 downto 14)+3;
end if;

if z(21 downto 18)>4 then 
z(21 downto 18):=z(21 downto 18)+3;
end if;

if z(25 downto 22)>4 then 
z(25 downto 22):=z(25 downto 22)+3;
end if;

if z(29 downto 26)>4 then 
z(29 downto 26):=z(29 downto 26)+3;
end if;


z(29 downto 1):=z(28 downto 0);
end loop;
BCD<=z(29 downto 14);
end process;

--divisor<=0 when divisor=50000 else divisor+1 when clk'event and clk='1';

--contador<="00000000000000" when contador="10011100010000"  else 
--contador+1 when divisor=49999 and clk'event and clk='1';
--			

cont_desp<=0 when cont_desp=50000 else cont_desp+1 when clk'event and clk='1';
--cont_sel<=0 when cont_desp=4 else cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
cont_sel<=cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
--
B0<=BCD(3 downto 0);
B1<=BCD(7 downto 4);
B2<=BCD(11 downto 8);
B3<=BCD(15 downto 12);
--B3<=BCD(15 downto 12);

mux<=B0 when cont_sel=0 else
B1 when cont_sel=1 else
B2 when cont_sel=2 else
B3;

seg<="0000001" when mux="0000"else
"1001111" when mux="0001"else
"0010010" when mux="0010"else
"0000110" when mux="0011"else
"1001100" when mux="0100"else
"0100100" when mux="0101"else
"0100000" when mux="0110"else
"0001111" when mux="0111"else
"0000000" when mux="1000"else
"0001100" when mux="1001"else
"0001000" when mux="1010"else
"1100000" when mux="1011"else
"0110001" when mux="1100"else
"1000010" when mux="1101"else
"0110000" when mux="1110"else
"0111000";

an<="1110" when cont_sel=0 else
"1101" when cont_sel=1 else
"1011" when cont_sel=2 else
"0111";

--up_an<= up when clk'event and clk='1';
btn_out_up_an<=btn_out_up when clk'event and clk='1';
btn_out_down_an<=btn_out_down when clk'event and clk='1';
--down_an<=down when clk'event and clk='1';
--aux2<=aux;
--contador<=contador-3 when aux=0 and up_an='0' else contador+3 when aux=0 and down_an='0';
process (clk,up,down)
begin



if(clk'event and clk='1') then

if(btn_out_up_an='0' and btn_out_up='1') then
contador<=contador+'1';
end if;

if(btn_out_down_an='0' and btn_out_down='1')then
contador<=contador-1;
end if;


if (contador=10000) then
contador<="00000000000001";
end if;


if (contador=0) then
contador<="10011100001111";
end if;

--if (up_an='0' or down_an='0') then
--aux<=1;
--end if;
--
--if (up_an='1' or down_an='0') then
--aux<=0;
--end if;

end if;

end process;

process(clk)
begin
if (clk'event and clk='1') then
		if(btn_prev_up xor up)='1' then
		counter1<=(others=>'0');
		btn_prev_up<=up;
		elsif (counter1(CNT_SIZE)='0') then
		counter1<=counter1+1;
		else
		btn_out_up<=btn_prev_up;
		end if;
		end if;
		end process;
		
		process(clk)
begin
if (clk'event and clk='1') then
		if(btn_prev_down xor down)='1' then
		counter<=(others=>'0');
		btn_prev_down<=down;
		elsif (counter(CNT_SIZE)='0') then
		counter<=counter+1;
		else
		btn_out_down<=btn_prev_down;
		end if;
		end if;
		end process;

end Behavioral;
