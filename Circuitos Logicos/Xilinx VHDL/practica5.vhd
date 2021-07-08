----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:11 03/27/2012 
-- Design Name: 
-- Module Name:    practica2 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity practica2 is
    Port ( seg : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
--           bin : in  STD_LOGIC_VECTOR (0 to 3);
           clk: in	std_logic;
			  A,B,C,D: in std_logic_vector (1 downto 0));
end practica2;

architecture Behavioral of practica2 is

signal cont1: integer range 0 to 50000;
signal cont2: integer range 0 to 3;
signal mux: std_logic_vector (1 downto 0);
--signal sel : STD_LOGIC_VECTOR (1 downto 0);
begin

--seg<="0000001" when bin="0000"else
--"1001111" when bin="0001"else
--"0010010" when bin="0010"else
--"0000110" when bin="0011"else
--"1001100" when bin="0100"else
--"0100100" when bin="0101"else
--"0100000" when bin="0110"else
--"0001111" when bin="0111"else
--"0000000" when bin="1000"else
--"0001100" when bin="1001"else
--"0001000" when bin="1010"else
--"1100000" when bin="1011"else
--"0110001" when bin="1100"else
--"1000010" when bin="1101"else
--"0110000" when bin="1110"else
--"0111000";

an<="1110"when cont2=0 else
"1101" when cont2=1 else
"1011" when cont2=2 else
"0111";

seg<="0000001" when mux="00"else
"1001111" when mux="01"else
"0010010" when mux="10"else
"0000110";

mux<=A when cont2=0 else
B when cont2=1 else
C when cont2=2 else
D;

cont1<=0 when cont1=50000 else
cont1+1 when clk'event and clk='1';

cont2<=cont2+1 when cont1=49999 and clk'event and clk='1';

end Behavioral;

