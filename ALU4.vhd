LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity ALU4 is port (
 ALUin1: in std_logic_vector(7 downto 0);
 ALUin2: in std_logic_vector(7 downto 0);
 ALUctrl: in std_logic_vector(5 downto 0);
 ALUout1: out std_logic_vector(7 downto 0);
 zero: out std_logic);
end ALU4;

architecture dataflow of ALU4 is
signal result : std_logic_vector(7 downto 0) := "00000000";
begin

process (Aluctrl,ALUin1,ALUin2)
begin
if ALUctrl = "000000" then
 result <= ALUin1 and ALUin2;
elsif ALUctrl = "000001" then
 result <= ALUin1 or ALUin2;
elsif Aluctrl = "000010" then
 result <= ALUin1 + ALUin2;
elsif Aluctrl = "000110" then
 result <= ALUin1 - ALUin2;
elsif Aluctrl = "000111" then
	if ALUin1 < ALUin2 then
	result <= "00000001";
	else
	result <= "00000000";
	end if;
 end if;
 if result = "00000000" then
zero <= '1';
else
zero <= '0';
end if;
 end process;

ALUout1 <= result;


 end dataflow;
