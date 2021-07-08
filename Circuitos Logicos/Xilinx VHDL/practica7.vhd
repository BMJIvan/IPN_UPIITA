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
    Port ( 
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
			  cont_sel: in STD_LOGIC_VECTOR (1 downto 0);
			  bin : in STD_LOGIC_VECTOR (7 downto 0)
			 
			  );
end practica6;

architecture Behavioral of practica6 is

signal BCD: std_logic_vector(15 downto 0);
--signal mux: std_logic_vector (3 downto 0);
signal contador: std_logic_vector (13 downto 0);
signal contador: integer range 0 to 10000;

signal B0,B1,B2,B3: std_logic_vector (3 downto 0);
signal mux: std_logic_vector (3 downto 0);
--signal input: integer;

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


--cont:process(bin)
--begin
--contador(7 downto 0)<=bin(7 downto 0);
--end process;

B0<=BCD(3 downto 0);
B1<=BCD(7 downto 4);
B2<=BCD(11 downto 8);
B3<=BCD(15 downto 12);
--B3<=BCD(15 downto 12);

mux<=B0 when cont_sel="00" else
B1 when cont_sel="01" else
B2 when cont_sel="10" else
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

an<="1110" when cont_sel="00" else
"1101" when cont_sel="01" else
"1011" when cont_sel="10" else
"0111";

--output<=to_unsigned(contador,output'length);

end Behavioral;

