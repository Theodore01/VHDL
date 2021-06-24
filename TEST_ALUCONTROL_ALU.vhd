LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY TEST_ALUCONTROL_ALU IS PORT (
 OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
 ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 ALUin1: in std_logic_vector(3 downto 0);
 ALUin2: in std_logic_vector(3 downto 0);
 ALUout1: out std_logic_vector(3 downto 0);
 zero: out std_logic);
END TEST_ALUCONTROL_ALU;

architecture structural of TEST_ALUCONTROL_ALU is

  component ALU_Control
  port(
   OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0):= "000000";
   ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
   Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
 end component;

 component ALU4_3
 port(
 ALUin1: in std_logic_vector(3 downto 0);
 ALUin2: in std_logic_vector(3 downto 0);
 ALUctrl: in std_logic_vector(3 downto 0);
 ALUout1: out std_logic_vector(3 downto 0);
 zero: out std_logic);
end component;
  signal s0 : std_logic_vector(3 downto 0):="0000";
begin
  H1 : ALU_Control port map(
  OP_5to0 => OP_5to0,
  ALU_op => ALU_op,
  Operation => s0
  );
  H2 : ALU4_3 port map(
  ALUin1 => ALUin1,
  ALUin2 => ALUin2,
  ALUctrl => s0,
  zero => zero,
  ALUout1 => ALUout1
  );
end structural;
