--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.ram_type_pck.all;

--Entity
entity Memoria_RAM is
	
	port(
			CLK,Reset_Reg: in std_logic;
			ADD: in std_logic_vector(7 downto 0);
			RNUM1,RNUM2: out std_logic_vector(7 downto 0)
		 );

end Memoria_RAM;

--Architecture
architecture solution of Memoria_RAM is

Component SRAM is 
	port(
		clk,en,wr: in std_logic; 
		addr : in std_logic_vector(7 downto 0); 
		Dout : out std_logic_vector(7 downto 0)); 
end Component;

Component SRAM2 is 
	port(
		clk,en,wr: in std_logic; 
		addr : in std_logic_vector(7 downto 0); 
		Dout : out std_logic_vector(7 downto 0)); 
end Component;

begin
	
	C1: SRAM port map(CLK,'1','0',ADD,RNUM1);
	C2: SRAM2 port map(CLK,'1','0',ADD,RNUM2);

end solution;