LIBRARY ieee;
USE ieee.std_logic_1164.all;
Entity shiftleft2 is port (
 In1: in std_logic_vector(31 downto 0);
 d: out std_logic_vector(31 downto 0));
end shiftleft2;

architecture behavioural of shiftleft2 is
begin
process(In1)
begin
S1: for I in 0 to 31 loop
d(I) <= In1(I);
end loop S1;
d(0) <= '0';
d(1) <= '0';
end process;
end behavioural;