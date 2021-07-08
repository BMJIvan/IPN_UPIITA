
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



entity practica6 is
    Port ( 
           led : out  STD_LOGIC_VECTOR (2 downto 0);
			  clk : in std_logic;
			  reset : in std_logic
			  );
end practica6;

architecture Behavioral of practica6 is
Type estados is (A,B,C);
signal est_act, est_sig: estados;
--signal contador: std_logic_vector (6 downto 0);
signal contador:integer range 0 to 70;
signal cont_desp:integer range 0 to 50000000;
signal contr:integer range 0 to 1;
begin

cont_desp<=0 when cont_desp=5000000 else cont_desp+1 when clk'event and clk='1';
--cont_sel<=cont_sel+1 when cont_desp=49999 and clk'event and clk='1';
--contador<="0000000" when contador="1000101" and cont_desp=49999999 else contador=contador+1 when clk'event and clk='1'; 
contador<=0 when contador=70 and cont_desp=4999999 else
				0 when contr=1 else 
				contador+1 when clk'event and clk='1'; 

process (clk,reset)
begin
if(reset='1') then
est_act<=A;
contr<=1;
elsif (clk'event and clk='1') then
est_act<=est_act;
contr<=0;
end if;
end process;

process(est_act,contador,reset)
begin
if reset='1' then
est_sig<=A;
end if;
case est_act is when A=>
		led<="001";
if(contador=30) then
		est_sig<=B;
		else
		est_sig<=A;
		end if;

when B=>
		led<="010";
if(contador=40) then
		est_sig<=C;
		else
		est_sig<=B;
		end if;
		
when C=>
		led<="100";
if(contador=69) then
		est_sig<=A;
		else
		est_sig<=C;
		end if;
end case;
end process;

end Behavioral;
