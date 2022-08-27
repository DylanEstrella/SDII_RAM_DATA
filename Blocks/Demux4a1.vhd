--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Demux4a1 is
	generic ( n: integer:=8);--<-- nbits
	port (
		Y0 : out std_logic_vector(n-1 downto 0);
		Y1 : out std_logic_vector(n-1 downto 0);
		Y2 : out std_logic_vector(n-1 downto 0);
		Y3 : out std_logic_vector(n-1 downto 0);
		sel : in std_logic_vector(1 downto 0);
		en: in std_logic;
		D : in std_logic_vector(n-1 downto 0));
end Demux4a1;

--Architecture
architecture solve of Demux4a1 is
	-- Signals,Constants,Variables,Components
	signal ff: std_logic_vector(n-1 downto 0);
	begin
		ff <= "00000000";
		
		Y0<= D when (sel="00" and en='1') else ff;
		Y1<= D when (sel="01" and en='1') else ff;
		Y2<= D when (sel="10" and en='1') else ff;
		Y3<= D when (sel="11" and en='1') else ff; 

end solve;