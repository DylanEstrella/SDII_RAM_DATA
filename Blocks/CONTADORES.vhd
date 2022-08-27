--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Entity
entity CONTADORES is
	port(
		CON_RAM,CON_REG,CRS_RAM,CRS_REG: in std_logic; 
		U_RAM,U_REG: out std_logic;
		ADD1: out std_logic_vector(7 downto 0);
		ADD2: out std_logic_vector(1 downto 0)
	 ); 
	 
end CONTADORES;

Architecture solution of CONTADORES is

Component Comparator

	Port(
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		AigualB, AmayorB: out std_logic);
end Component;
		
Component contador8bits
	 Port ( reset : in STD_LOGIC;
	 clk : in STD_LOGIC;
	 mode: in STD_LOGIC := '0';
	 Q : out STD_LOGIC_VECTOR (7 downto 0));
end Component;
	 
Component contador2bits	
	 Port ( reset : in STD_LOGIC;
	 clk : in STD_LOGIC;
	 mode: in STD_LOGIC := '0';
	 Q : out STD_LOGIC_VECTOR (1 downto 0));
end Component;
	Signal adra: std_logic_vector(7 downto 0);
	Signal adre: std_logic_vector(1 downto 0);	
	Signal cma1,cma2,cmb1,cmb2: STD_LOGIC;
begin
	C1: contador8bits port map(CRS_RAM,CON_RAM,'1',adra);
	C2: contador2bits port map(CRS_REG,CON_REG,'1',adre);
	C3: Comparator port map(adra,"01100100",cma1,cma2);--"0000100"
	C4: Comparator port map("000000"&adre,"00000011",cmb1,cmb2);
	
	U_RAM<=cma1 or cma2;
	U_REG<=cmb2 or cmb1;
	ADD1<=adra;
	ADD2<=adre;
end solution;