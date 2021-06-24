LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ALU_Control IS PORT (
 OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
 ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU_Control; 

architecture behav of ALU_Control is
signal s1,s2: STD_LOGIC;
begin
s1 <= OP_5to0(0) OR OP_5to0(3);
Operation(0) <= ALU_op(1) AND s1;
Operation(1) <= ALU_op(1) NOR OP_5to0(2);
s2 <= ALU_op(1) AND OP_5to0(1);
Operation(2) <= ALU_op(0) OR s2;
Operation(3) <= '0';
end behav; 