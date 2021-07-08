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
    Port ( led : out  STD_LOGIC_VECTOR (7 downto 0);
			  clk : in std_logic;
			  down : in STD_LOGIC;
			  up : in STD_LOGIC
			  );
end practica6;

architecture Behavioral of practica6 is

signal contador: std_logic_vector (7 downto 0);
constant CNT_size: integer :=19;
signal btn_prev_up: std_logic:='0';
signal btn_prev_down: std_logic:='0';
signal counter: std_logic_vector (CNT_size downto 0):=(others=>'0');
signal counter1: std_logic_vector (CNT_size downto 0):=(others=>'0');
signal btn_out_up: STD_logic;
signal btn_out_up_an: STD_logic;
signal btn_out_down: STD_logic;
signal btn_out_down_an: STD_logic;

begin

btn_out_up_an<=btn_out_up when clk'event and clk='1';
btn_out_down_an<=btn_out_down when clk'event and clk='1';
led<=contador;

process (clk,up,down)
begin

if(clk'event and clk='1') then

if(btn_out_up_an='0' and btn_out_up='1') then
contador<=contador+'1';
end if;

if(btn_out_down_an='0' and btn_out_down='1')then
contador<=contador-1;
end if;

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
