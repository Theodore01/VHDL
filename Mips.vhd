LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY mips is
port(
  reset:in std_logic;
  clk:in std_logic;
  instr:in std_logic_vector(31 downto 0);
  cout:out std_logic_vector(31 downto 0));
end mips;

architecture behav of mips is
component clk4
port(clk : in std_logic;
 A,B,E: in std_logic_vector(7 downto 0);
 C: in std_logic_vector(5 downto 0);
 D: in std_logic;
 out1,out2,out5 : out std_logic_vector(7 downto 0);
 out3: out std_logic_vector(5 downto 0);
 out4:out std_logic);
end component;
component mux_2to1
 port(SEL : in  STD_LOGIC;
 A   : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
 B   : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
 X   : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;
component clk2
port(
clk : in std_logic;
 A: in std_logic_vector(7 downto 0);
 B: in std_logic;
 out1: out std_logic_vector(7 downto 0);
 out2: out std_logic);
end component;
component Control
port(
 clk : IN STD_LOGIC;
 reset : IN STD_LOGIC;
 OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
 RegDst, RegWrite, ALUSrc, Branch: out STD_LOGIC;
 MemRead, MemWrite, MemtoReg: out STD_LOGIC;
 ALU_op: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
 Mux_out: OUT STD_LOGIC);
END component;
component regfile1
port(
A : in std_logic_vector(7 downto 0);
rAddr1: in std_logic_vector(4 downto 0);
rAddr2: in std_logic_vector(4 downto 0);
wAddr : in std_logic_vector(4 downto 0);
we : in std_logic;
clk : in std_logic;
reset : in std_logic;
B : out std_logic_vector(7 downto 0);
C : out std_logic_vector(7 downto 0));
end component;
component shiftleft2
  port(
  In1: in std_logic_vector(31 downto 0);
  d: out std_logic_vector(31 downto 0));
end component;
 component ALU4 is
 port(
 ALUin1: in std_logic_vector(7 downto 0);
 ALUin2: in std_logic_vector(7 downto 0);
 ALUctrl: in std_logic_vector(5 downto 0);
 ALUout1: out std_logic_vector(7 downto 0);
 zero: out std_logic);
end component;
  signal s0 : std_logic_vector(5 downto 0);
  signal s1 : std_logic;
  signal s2 : std_logic_vector(7 downto 0);
  signal s3:  std_logic_vector(7 downto 0);
  signal s4:  std_logic_vector(5 downto 0);
  signal s5:  std_logic;
  signal s6:  std_logic_vector(7 downto 0);
  signal s7:  std_logic_vector(7 downto 0);
  signal s8:  std_logic_vector(7 downto 0):= instr(7 downto 0);
  signal s9:  std_logic_vector(7 downto 0);
  signal s10:  std_logic;
  signal s11:  std_logic_vector(7 downto 0);
  signal s12:  std_logic_vector (4 downto 0);
  signal s13: std_logic;
  signal s14: std_logic_vector(7 downto 0);
  signal s15: std_logic;
  begin
  H1 : regfile1 port map(
  A => s11,
  rAddr1 => instr(25 downto 21),
  rAddr2 => instr(20 downto 16),
  wAddr => s12,
  we => s10,
  clk => clk,
  reset => reset,
  B => s2,
  C => s3
  );
  H2 : Control port map(
  OP_5to0 => instr(5 downto 0),
  clk => clk,
  reset => reset,
  RegWrite => s1,
  RegDst => open,
  ALUSrc => open,
  Branch => open,
  MemRead => open,
  MemWrite => open,
  MemtoReg => s13,
  ALU_op => s0,
  Mux_out => s15
  );
  H3 : clk4 port map(
  A => s2,
  B => s3,
  C => s0,
  D => s1,
  E => s3,
  clk => clk,
  out1 => s6,
  out2 => s7,
  out3 => s4,
  out4 => s5
  );
  H4 : ALU4 port map(
  ALUin1 => s6,
  ALUin2 => s14,
  ALUctrl => s4,
  ALUout1 => s9
  );
  H5 : clk2 port map(
  A => s9,
  B => s5,
  clk => clk,
  out1 => s11,
  out2 => s10
  );
  H6 : mux_2to1 port map(
  SEL => s15,
  A => s7,
  B => s8,
  X => s14
  );
  cout <= "000000000000000000000000"&s9;
end behav;
