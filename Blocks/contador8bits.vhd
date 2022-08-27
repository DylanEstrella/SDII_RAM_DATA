library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity contador8bits is
	 Port ( reset : in STD_LOGIC;
	 clk : in STD_LOGIC;
	 mode: in STD_LOGIC := '0';
	 Q : out STD_LOGIC_VECTOR (7 downto 0));
end contador8bits;

architecture Behavioral of contador8bits is
signal counter : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
	process(reset,clk)
	begin
		if reset='1' then
		counter <= "00000000";
		
		elsif clk'event and clk = '1' then
			if mode = '1' then
			counter <= counter + 1;
			else
			counter <= counter - 1;
			end if;
			Q <= counter;		
		end if;
	end process;
end Behavioral;
