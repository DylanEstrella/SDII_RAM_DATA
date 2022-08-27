library ieee;
use ieee.std_logic_1164.all;
--Entity
entity MSS is
	port(
		resetn,clk,Start,READ_Reg,READ_RAM,U_REG,U_RAM,IGUAL: in std_logic;
		LED_REG,LED_RAM,LED_READ,LED_INICIO,LED_IGUAL,ON_LCD,CON_RAM,CON_REG,CRS_RAM,CRS_REG,MODE: out std_logic );
		
end MSS;
--Architecture
architecture solve of MSS is
	-- Signals,Constants,Variables,Components
	type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tk,Tm,Tn,Tp);
	signal y: estado;
	signal non: std_logic;
	signal  LEDS: std_logic_vector (4 downto 0);

	begin
	--Process #1: Next state decoder and state memory
	LED_REG<=LEDS(0);
	LED_RAM<=LEDS(1);
	LED_READ<=LEDS(2);
	LED_INICIO<=LEDS(3);
	LED_IGUAL<=LEDS(4);
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn = '0' then y<= Ta;
			elsif (clk'event and clk = '1') then
				case y is
					when Ta => 
							  if Start='0' then y <= Ta;
							  elsif Start='1' then y <= Tb; end if;						  
					when Tb => 
							  if Start='1' then y <= Tb;
							  elsif Start='0' then y <= Tc; end if;	
					when Tc => 
							  if READ_RAM='0' and READ_REG='0' then y <= Tc;
							  elsif READ_RAM='1' then y <= Tm; 
							  elsif READ_REG='1' then y<= Tg; end if;	
					when Tm => 
							  if READ_RAM='0' then y <= Td;
							  elsif READ_RAM='1' then y <= Tm; end if;								  
					when Td => 
							  if IGUAL='1' then y <= Te;
							  elsif IGUAL='0' then y <= Tf; end if;	
					when Te =>
							  if Start='1' then y <= Ti;
							  elsif Start='0' then y <= Te; end if;
				   when Ti => 
							  if Start='1' then y <= Ti;
							  elsif Start='0' then y <= Tn; end if;
					when Tf => 
							  --if IGUAL='1' then y <= Te;
							  if U_RAM='0' then y <= Td; 
							  elsif U_RAM='1' then y <= Tc; end if;
					when Tg => 
							  if Start='1' then y <= Tk;
							  elsif Start='0' then y <= Tg; end if;
					when Tk => 
							  if Start='1' then y <= Tk;
							  elsif Start='0' then y <= Th; end if;
					when Th => 
							  if U_REG='0' then y <= Tg;
							  elsif U_REG='1' then y <= Tc; end if;
					when Tn => 
							  if Start='1' then y <= Tp;
							  elsif Start='0' then y <= Tn; end if;
					when Tp => 
							  if Start='1' then y <= Tp;
							  elsif Start='0' then y <= Tf; end if;		  
					end case;
			end if;
	end process;
	--Process #2: Output decoder
	process(y)
	--Sequential programming
		begin
			LEDS<="00000";
			ON_LCD<='0';
			CON_RAM<='0';
			CON_REG<='0';
			CRS_REG<='0';
			CRS_RAM<='0';
			MODE<='0';

			case y is
				when Ta =>LEDS<="11111";
				when Tb =>LEDS<="01000";
				when Tc =>LEDS<="00100";CRS_RAM<='1';CRS_REG<='1';
				when Tm =>LEDS<="00010";CON_RAM<='1';
				when Td =>LEDS<="00001";CON_REG<='1';
				when Te =>LEDS<="11000";ON_LCD<='1';
				when Ti =>LEDS<="01100";ON_LCD<='1';
				when Tf =>LEDS<="00110";CON_RAM<='1';CON_REG<='1';MODE<='1'; 
				when Tg =>LEDS<="00011";ON_LCD<='1';CON_REG<='1';CRS_RAM<='1';MODE<='1';
				when Tk =>LEDS<="11100";CRS_RAM<='1';CON_REG<='1';
				when Th =>LEDS<="01110";CRS_RAM<='1'; 
				when Tn =>LEDS<="00111";ON_LCD<='1';MODE<='1';
				when Tp =>LEDS<="11110";ON_LCD<='1';MODE<='1';
				
			end case;
	end process;
	--Process #n... 
end solve;