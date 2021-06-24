LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity clk4 is
PORT(
clk : in std_logic;
 A,B,E: in std_logic_vector(7 downto 0);
 C: in std_logic_vector(5 downto 0);
 D: in std_logic;
 out1,out2,out5 : out std_logic_vector(7 downto 0);
 out3: out std_logic_vector(5 downto 0);
 out4: out std_logic);
end clk4;

architecture behav of clk4 is
  begin
    process (clk)
    begin
    if (clk'event and clk = '1') then
      out1 <= A;
      out2 <= B;
      out3 <= C;
      out4 <= D;
      out5 <= E;
    end if;
  end process;
end behav;
