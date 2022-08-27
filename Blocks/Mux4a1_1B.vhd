--4-to-1 n-bit multiplexer
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Mux4a1_1B is
	port (
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		en: in std_logic;
		Q : out std_logic);
end Mux4a1_1B;

--Architecture
architecture solve of Mux4a1_1B is
	-- Signals,Constants,Variables,Components
	signal f: std_logic;
	begin
		with sel select 
		f<= A when "00",
			 B when "01",
			 C when "10",
			 D when others;
		Q<= f when en='1' else ('0');	 
end solve;