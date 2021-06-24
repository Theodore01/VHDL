library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY reg8 IS PORT (
 KA1, KA2, KE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 Resetn, Clock, RegWrite : IN STD_LOGIC;
 DE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 DA1, DA2: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END reg8;
architecture behavioral of reg8 is
type regArray is array(0 to 3) of std_logic_vector(3 downto 0);
signal reg8 : regArray;
begin
process(Clock)
begin
if (Clock'event and Clock='0') then
if RegWrite='1' then
reg8(to_integer(unsigned(KE))) <= DE;
else if RegWrite='0' then
DA1 <= reg8(to_integer(unsigned(KA1)));
DA2 <= reg8(to_integer(unsigned(KA2)));
if Resetn = '1' then
reg8(to_integer(unsigned(KE))) <= "0000";
end if;
end if;
end if;
end if;

end process;
END behavioral;