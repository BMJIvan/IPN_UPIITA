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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity practica6 is
    Port ( bin : in  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
			  clk : in std_logic
			  );
end practica6;

architecture Behavioral of practica6 is

signal BCD: std_logic_vector(11 downto 0);
--signal mux: std_logic_vector (3 downto 0);
--signal divisor: integer range 0 to 5000000;
--signal contador: integer range 0 to 9999;
signal cont_sel: integer range 0 to 3;
signal cont_desp: integer range 0 to 50000;
signal B0,B1,B2: std_logic_vector (3 downto 0);
signal mux: std_logic_vector (3 downto 0); 
begin

BCD1:process(bin)
variable z:std_logic_vector (17 downto 0);
begin
for i in 0 to 17 loop
z(i):='0';
end loop;
z(10 downto 3):=bin;

for i in 0 to 4 loop

if z(11 downto 8)>4 then 
z(11 downto 8):=z(11 downto 8)+3;
end if;

if z(15 downto 12)>4 then 
z(15 downto 12):=z(15 downto 12)+3;
end if;
z(17 downto 1):=z(16 downto 0);
end loop;
BCD<="00"&z(17 downto 8);
end process;

--divisor<=0 when divisor=5000000 else divisor+1 when clk'event and clk='1';
--contador<=0 when contador=10000 else contador+1 when divisor=4999999 and clk'event and clk='1';
cont_desp<=0 when cont_desp=50000 else cont_desp+1 when clk'event and clk='1';
--cont_sel<=0 when cont_desp=4 else cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
cont_sel<=cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
--
B0<=BCD(3 downto 0);
B1<=BCD(7 downto 4);
B2<=BCD(11 downto 8);

mux<=B0 when cont_sel=0 else
B1 when cont_sel=1 else
B2 when cont_sel=2 else
"0000";

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

