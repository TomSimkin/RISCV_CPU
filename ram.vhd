----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:31:31 10/31/2024 
-- Design Name: 
-- Module Name:    ram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
           write_enable_in : in  STD_LOGIC;
           address_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end ram;

architecture Behavioral of ram is
	type ram_array is array (0 to 255) of STD_LOGIC_VECTOR (15 downto 0);
	signal ram: ram_array := (others => x"0000");
begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if reset = '1' then
				ram <= (others => x"0000");
			elsif enable_in = '1' then
				if write_enable_in = '1' then
					ram(to_integer(unsigned(address_in(7 downto 0)))) <= data_in;
				end if;
			end if;
		end if;
	end process;
	
	data_out <= ram(to_integer(unsigned(address_in(7 downto 0))));
	
end Behavioral;

