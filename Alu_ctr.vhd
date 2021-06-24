LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ALU_Control IS PORT (
 OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0):= "000000";
 ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 Operation: OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END ALU_Control;

architecture behav of ALU_Control is
begin
process(ALU_op,OP_5to0)
begin
if ALU_op = "00" then
Operation <= "000010";
elsif ALU_op = "01" then
Operation <= "000110";
elsif ALU_op = "11" then
Operation <= "000010";
elsif ALU_op = "10" and OP_5to0(3)='0' and OP_5to0(2)='0' and OP_5to0(1)='0' and OP_5to0(0)='0' then
Operation <= "000010";
elsif ALU_op = "11" and OP_5to0(3)='0' and OP_5to0(2)='0' and OP_5to0(1)='0' and OP_5to0(0)='0' then
Operation <= "000010";
elsif ALU_op = "10" and OP_5to0(3)='0' and OP_5to0(2)='0' and OP_5to0(1)='1' and OP_5to0(0)='0' then
Operation <= "000110";
elsif ALU_op = "11" and OP_5to0(3)='0' and OP_5to0(2)='0' and OP_5to0(1)='1' and OP_5to0(0)='0' then
Operation <= "000110";
elsif ALU_op = "10" and OP_5to0(3)='0' and OP_5to0(2)='1' and OP_5to0(1)='0' and OP_5to0(0)='0' then
Operation <= "000000";
elsif ALU_op = "11" and OP_5to0(3)='0' and OP_5to0(2)='1' and OP_5to0(1)='0' and OP_5to0(0)='0' then
Operation <= "000000";
elsif ALU_op = "10" and OP_5to0(3)='0' and OP_5to0(2)='1' and OP_5to0(1)='0' and OP_5to0(0)='1' then
Operation <= "000001";
elsif ALU_op = "11" and OP_5to0(3)='0' and OP_5to0(2)='1' and OP_5to0(1)='0' and OP_5to0(0)='1' then
Operation <= "000001";
elsif ALU_op = "10" and OP_5to0(3)='1' and OP_5to0(2)='0' and OP_5to0(1)='1' and OP_5to0(0)='0' then
Operation <= "000111";
elsif ALU_op = "11" and OP_5to0(3)='1' and OP_5to0(2)='0' and OP_5to0(1)='1' and OP_5to0(0)='0' then
Operation <= "000111";
end if;
end process;
end behav;
