LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity ALU4_3 is port (
 ALUin1: in std_logic_vector(3 downto 0);
 ALUin2: in std_logic_vector(3 downto 0);
 ALUctrl: in std_logic_vector(3 downto 0);
 ALUout1: out std_logic_vector(3 downto 0);
 zero: out std_logic);
end ALU4_3;


architecture dataflow of ALU4_3 is
signal result : std_logic_vector(3 downto 0) := "0000";
begin

process (Aluctrl,ALUin1,ALUin2)
begin
if ALUctrl = "0000" then
 result <= ALUin1 and ALUin2;
elsif ALUctrl = "0001" then
 result <= ALUin1 or ALUin2;
elsif Aluctrl = "0010" then
 result <= ALUin1 + ALUin2;
elsif Aluctrl = "0110" then
 result <= ALUin1 - ALUin2;
elsif Aluctrl = "0111" then
	if ALUin1 < ALUin2 then
	result <= "0001";
	else
	result <= "0000";
	end if;
 end if;
 if result = "0000" then
zero <= '1';
else
zero <= '0';
end if;
 end process;

ALUout1 <= result;


 end dataflow;
