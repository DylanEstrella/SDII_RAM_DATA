--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Controlador_LCD is
	
	port(
			ON_LCD,MODE: in std_logic;
			NUM_REG,ADDRAM: in std_logic_vector(7 downto 0);
			SPU1,SPD1,SPC1,SPU2,SPD2,SPC2: out std_logic_vector(6 downto 0)
		 );

end Controlador_LCD;

Architecture solution of Controlador_LCD is

Component DecoBin_BCD
	    port(
        num_bin: in  std_logic_vector(8 downto 0);
        num_bcd: out std_logic_vector(10 downto 0));
end Component;

Component DecoBCD_7seg
	port(
		BCD: in std_logic_vector(3 downto 0);
		anodo7: out std_logic_vector(6 downto 0));
end Component;

Signal BCD1,BCD2: std_logic_vector(10 downto 0);
Signal U1,D1,C1,U2,D2,C2: std_logic_vector(3 downto 0);
Signal PU1,PD1,PC1,PU2,PD2,PC2: std_logic_vector(6 downto 0);
Signal mo: std_logic_vector(1 downto 0);
begin
	mo<=ON_LCD&MODE;
	--Y1: DecoBin_BCD port map('0'&NUM_REG,BCD1);
	Y1: DecoBin_BCD port map('0'&ADDRAM,BCD1);
	--Y2: DecoBin_BCD port map('0'&ADDRAM,BCD2);
	Y2: DecoBin_BCD port map('0'&NUM_REG,BCD2);
	
	U1<=BCD1(3)&BCD1(2)&BCD1(1)&BCD1(0);
	D1<=BCD1(7)&BCD1(6)&BCD1(5)&BCD1(4);
	C1<='0'&BCD1(10)&BCD1(9)&BCD1(8);
	
	--U1<=not(BCD1(3))&not(BCD1(2))&not(BCD1(1))&not(BCD1(0));
	--D1<=not(BCD1(7))&not(BCD1(6))&not(BCD1(5))&not(BCD1(4));
	--C1<=not('0')&not(BCD1(10))&not(BCD1(9))&not(BCD1(8));
	
	U2<=BCD2(3)&BCD2(2)&BCD2(1)&BCD2(0);
	D2<=BCD2(7)&BCD2(6)&BCD2(5)&BCD2(4);
	C2<='0'&BCD2(10)&BCD2(9)&BCD2(8);
	
	--U2<=not(BCD2(3))&not(BCD2(2))&not(BCD2(1))&not(BCD2(0));
	--D2<=not(BCD2(7))&not(BCD2(6))&not(BCD2(5))&not(BCD2(4));
	--C2<='1'&not(BCD2(10))&not(BCD2(9))&not(BCD2(8));
	
	Y3: DecoBCD_7seg port map(U1,PU1);
	Y4: DecoBCD_7seg port map(D1,PD1);
	Y5: DecoBCD_7seg port map(C1,PC1);
	
	Y6: DecoBCD_7seg port map(U2,PU2);
	Y7: DecoBCD_7seg port map(D2,PD2);
	Y8: DecoBCD_7seg port map(C2,PC2);
	
	SPU1<=PU1 		 when mo="10" else 
			PU2 		 when mo="11" else
			"0000000" when mo="01" else
			"0000000" when mo="00";
			
	SPD1<=PD1 		 when mo="10" else 
			PD2 		 when mo="11" else
			"0000000" when mo="01" else
			"0000000" when mo="00";
			
	SPC1<=PC1 		 when mo="10" else 
			PC2 		 when mo="11" else
			"0000000" when mo="01" else
			"0000000" when mo="00";	
	
	--SPU1<=PU1 when ON_LCD='1' else "1111111";
	--SPD1<=PD1 when ON_LCD='1' else "1111111";
	--SPC1<=PC1 when ON_LCD='1' else "1111111";
	
	SPU2<=PU2 when ON_LCD='1' else "0000000";
	SPD2<=PD2 when ON_LCD='1' else "0000000";
	SPC2<=PC2 when ON_LCD='1' else "0000000";
	
	
	--SPU2<=PU2 when ON_LCD='1' else "1111111";
	--SPD2<=PD2 when ON_LCD='1' else "1111111";
	--SPC2<=PC2 when ON_LCD='1' else "1111111";
	
end solution;
