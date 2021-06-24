LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity clk2 is
PORT(
clk : in std_logic;
 A: in std_logic_vector(7 downto 0);
 B: in std_logic;
 out1: out std_logic_vector(7 downto 0);
 out2: out std_logic);
end clk2;

architecture behav of clk2 is
  begin
    process (clk)
    begin
    if (clk'event and clk = '1') then
      out1 <= A;
      out2 <= B;
    end if;
  end process;
end behav;
