--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--Entity
Entity Multi_NOT is
	generic ( n: integer :=7);--<-- nbits
	Port(
		A: in std_logic_vector(n-1 downto 0);
		B: out std_logic_vector(n-1 downto 0)
		);
end Multi_NOT;

--Architecture
Architecture solve of Multi_NOT is
	-- Signals,Constants,Variables,Components
	Begin
		B<=not(A);
end solve;
