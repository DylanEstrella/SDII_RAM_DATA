--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Entity
entity REGISTRO is 
	port(
			clk,IGUAL,Reset_Reg: in std_logic; 
			ADD2 : in std_logic_vector(1 downto 0); 
			RNUM2 : in std_logic_vector(7 downto 0);
			NUM_REG : out std_logic_vector(7 downto 0)
		 ); 
end REGISTRO;

Architecture solution of REGISTRO is

Component Demux4a1
	port(Y0,Y1,Y2,Y3: out std_logic_vector(7 downto 0);
		  sel : in std_logic_vector(1 downto 0);
		  en: in std_logic;
		  D : in std_logic_vector(7 downto 0)
		 );
end Component;

Component Mux4a1
	port (
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		C : in std_logic_vector(7 downto 0);
		D : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(1 downto 0);
		en: in std_logic;
		Q : out std_logic_vector(7 downto 0));
end Component;

Component Demux4a1_1B
		port (
		Y0 : out std_logic;
		Y1 : out std_logic;
		Y2 : out std_logic;
		Y3 : out std_logic;
		sel : in std_logic_vector(1 downto 0);
		en: in std_logic;
		D : in std_logic);
end Component;

Component Reg
		port(
		Clk,resetn,en: in std_logic;
		d: in std_logic_vector(7 downto 0);
		q: out std_logic_vector(7 downto 0));
end Component;

Signal NN1,NN2,NN3,NN4,RN1,RN2,RN3,RN4: std_logic_vector(7 downto 0);
Signal CR1,CR2,CR3,CR4: std_logic;
begin
	C1: Demux4a1 port map(NN1,NN2,NN3,NN4,ADD2,'1',RNUM2);
	C2: Demux4a1_1B port map(CR1,CR2,CR3,CR4,ADD2,'1',IGUAL);
	C3: Reg  port map(clk,Reset_Reg,CR1,NN1,RN1);
	C4: Reg  port map(clk,Reset_Reg,CR2,NN2,RN2);
	C5: Reg  port map(clk,Reset_Reg,CR3,NN3,RN3);
	C6: Reg  port map(clk,Reset_Reg,CR4,NN4,RN4);
	C7: Mux4a1  port map(RN1,RN2,RN3,RN4,ADD2,'1',NUM_REG);
	
END solution;