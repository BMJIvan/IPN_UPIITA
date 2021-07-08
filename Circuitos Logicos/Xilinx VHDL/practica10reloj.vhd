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

entity reloj is
    Port ( --bin : in  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
			  clk : in std_logic;
			  vista : in STD_LOGIC
			  
			  --down: in STD_LOGIC 
			  );
end reloj;

architecture Behavioral of reloj is

signal BCDs: std_logic_vector(7 downto 0);
signal BCDm: std_logic_vector(7 downto 0);
signal BCDh: std_logic_vector(7 downto 0);
--signal mux: std_logic_vector (3 downto 0);
signal divisor: integer range 0 to 50000000;
signal conts: std_logic_vector (5 downto 0);
signal contm: std_logic_vector (5 downto 0);
signal conth: std_logic_vector (5 downto 0);
--signal contador: integer range 0 to 10000;
signal cont_sel: integer range 0 to 3;
--signal aup: STD_LOGIC;
--signal adown: STD_LOGIC;
signal cont_desp: integer range 0 to 50000;
signal B0,B1,B2,B3: std_logic_vector (3 downto 0);
signal mux: std_logic_vector (3 downto 0);
--signal input: integer;
--signal acont: std_logic_vector (13 downto 0);
begin

BCDs1:process(conts)
variable z:std_logic_vector (13 downto 0);
begin
for i in 0 to 13 loop
z(i):='0';
end loop;
--z(15 downto 2):=output;
z(8 downto 3):=conts(5 downto 0);
for i in 0 to 2 loop
if z(9 downto 6)>4 then 
z(9 downto 6):=z(9 downto 6)+3;
end if;
if z(13 downto 10)>4 then 
z(13 downto 10):=z(13 downto 10)+3;
end if;
z(13 downto 1):=z(12 downto 0);
end loop;
BCDs<=z(13 downto 6);
end process;


BCDm1:process(contm)
variable z:std_logic_vector (13 downto 0);
begin
for i in 0 to 13 loop
z(i):='0';
end loop;
--z(15 downto 2):=output;
z(8 downto 3):=contm(5 downto 0);
for i in 0 to 2 loop
if z(9 downto 6)>4 then 
z(9 downto 6):=z(9 downto 6)+3;
end if;
if z(13 downto 10)>4 then 
z(13 downto 10):=z(13 downto 10)+3;
end if;
z(13 downto 1):=z(12 downto 0);
end loop;
BCDm<=z(13 downto 6);
end process;


BCDh1:process(conth)
variable z:std_logic_vector (13 downto 0);
begin
for i in 0 to 13 loop
z(i):='0';
end loop;
--z(15 downto 2):=output;
z(8 downto 3):=conth(5 downto 0);
for i in 0 to 2 loop
if z(9 downto 6)>4 then 
z(9 downto 6):=z(9 downto 6)+3;
end if;
if z(13 downto 10)>4 then 
z(13 downto 10):=z(13 downto 10)+3;
end if;
z(13 downto 1):=z(12 downto 0);
end loop;
BCDh<=z(13 downto 6);
end process;



divisor<=0 when divisor=50000000 else divisor+1 when clk'event and clk='1';
conts<="000000" when conts="111100" else conts+1 when divisor=49999999 and clk'event and clk='1';
contm<="000000" when contm="111100" else contm+1 when conts=59 and divisor=49999999 and clk'event and clk='1';
conth<="000000" when conth="011000" else conth+1 when contm=59 and conts=59 and divisor=49999998 and clk'event and clk='1';
--contador<="00000000000000" when contador="10011100010000"  else 
--contador+1 when divisor=49999 and clk'event and clk='1';			

cont_desp<=0 when cont_desp=50000 else cont_desp+1 when clk'event and clk='1';
--cont_sel<=0 when cont_desp=4 else cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
cont_sel<=cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
--
B0<=BCDs(3 downto 0) when vista='0' else BCDm(3 downto 0);
B1<=BCDs(7 downto 4) when vista='0' else BCDm(7 downto 4);
B2<=BCDm(3 downto 0) when vista='0' else BCDh(3 downto 0);
B3<=BCDm(7 downto 4) when vista='0' else BCDh(7 downto 4);
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


end Behavioral;
