LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Control IS PORT (
 clk : IN STD_LOGIC;
 reset : IN STD_LOGIC;
 OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
 RegDst, RegWrite, ALUSrc, Branch: out STD_LOGIC;
 MemRead, MemWrite, MemtoReg: out STD_LOGIC;
 ALU_op: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
 Mux_out: OUT STD_LOGIC);
END Control;

architecture behav of Control is
  signal cnt : integer;
begin
process(OP_5to0)
begin
if OP_5to0 = "000000" then
RegDst <= '1';
ALUSrc <= '0';
MemtoReg <= '0';
RegWrite <= '1';
MemRead <= '0';
MemWrite <= '0';
Branch <= '0';
ALU_op(5) <= '0';
ALU_op(4) <= '0';
ALU_op(3) <= '0';
ALU_op(2) <= '0';
ALU_op(1) <= '1';
ALU_op(0) <= '0';
Mux_out <= '0';
elsif OP_5to0 = "100011" then
RegDst <= '0';
ALUSrc <= '1';
MemtoReg <= '1';
RegWrite <= '1';
MemRead <= '1';
MemWrite <= '0';
Branch <= '0';
ALU_op(5) <= '0';
ALU_op(4) <= '0';
ALU_op(3) <= '0';
ALU_op(2) <= '0';
ALU_op(1) <= '0';
ALU_op(0) <= '0';
Mux_out <= '1';
elsif OP_5to0 = "101011" then
RegDst <= '-';
ALUSrc <= '1';
MemtoReg <= '-';
RegWrite <= '0';
MemRead <= '0';
MemWrite <= '1';
Branch <= '0';
ALU_op(5) <= '0';
ALU_op(4) <= '0';
ALU_op(3) <= '0';
ALU_op(2) <= '0';
ALU_op(1) <= '0';
ALU_op(0) <= '0';
Mux_out <= '1';
elsif OP_5to0 = "000100" then
RegDst <= '-';
ALUSrc <= '0';
MemtoReg <= '-';
RegWrite <= '0';
MemRead <= '0';
MemWrite <= '0';
Branch <= '1';
ALU_op(5) <= '0';
ALU_op(4) <= '0';
ALU_op(3) <= '0';
ALU_op(2) <= '0';
ALU_op(1) <= '0';
ALU_op(0) <= '1';
Mux_out <= '1';
else
RegDst <= '0';
ALUSrc <= '0';
MemtoReg <= '0';
RegWrite <= '0';
MemRead <= '0';
MemWrite <= '0';
Branch <= '0';
ALU_op(5) <= '0';
ALU_op(4) <= '0';
ALU_op(3) <= '0';
ALU_op(2) <= '0';
ALU_op(1) <= '0';
ALU_op(0) <= '0';
Mux_out <= '0';
end if;
end process;
--process(clk)
--begin
  --if reset = '1' then
    --cnt <= 0;
    --RegWrite <= '0';
  --else
    --if clk'event and clk='1' then
      --if OP_5to0 = "000000" then
        --RegWrite <='1';
      --else
        --RegWrite <= '0';
      --end if;
      --cnt <= cnt + 1;
    --else
      --cnt <= 0;
      --RegWrite <='0';
    --end if;
   --end if;
--end process;
end behav;
