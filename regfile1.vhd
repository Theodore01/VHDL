library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity regfile is
generic ( dw : natural := 5;
size : natural := 5;
adrw : natural := 5);
port ( A : in std_logic_vector(7 downto 0);
rAddr1: in std_logic_vector(4 downto 0);
rAddr2: in std_logic_vector(4 downto 0);
wAddr : in std_logic_vector(4 downto 0);
we : in std_logic;
clk : in std_logic;
reset : in std_logic;
B : out std_logic_vector(7 downto 0);
C : out std_logic_vector(7 downto 0));
end regfile;
architecture behavioral of regfile is
type regArray is array(0 to size-1) of std_logic_vector(7 downto 0);
signal regfile : regArray;
begin
process(clk)
begin
if (clk'event and clk='0') then
if we='1' then
regfile(to_integer(unsigned(wAddr))) <= A;
else if we='0' then
C <= regfile(to_integer(unsigned(rAddr1)));
B <= regfile(to_integer(unsigned(rAddr2)));
if reset = '1' then
regfile(to_integer(unsigned(wAddr))) <= "00000000";
end if;
end if;
end if;
end if;
end process;
END behavioral;
