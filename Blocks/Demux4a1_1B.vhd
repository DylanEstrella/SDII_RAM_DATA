library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Demux4a1_1B is
	port (
		Y0 : out std_logic;
		Y1 : out std_logic;
		Y2 : out std_logic;
		Y3 : out std_logic;
		sel : in std_logic_vector(1 downto 0);
		en: in std_logic;
		D : in std_logic);
end Demux4a1_1B;

--Architecture
architecture solve of Demux4a1_1B is
	-- Signals,Constants,Variables,Components
	signal ff: std_logic;
	begin
		ff <= '0';
		
		Y0<= D when (sel="00" and en='1') else ff;
		Y1<= D when (sel="01" and en='1') else ff;
		Y2<= D when (sel="10" and en='1') else ff;
		Y3<= D when (sel="11" and en='1') else ff; 

end solve;