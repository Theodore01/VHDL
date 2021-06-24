LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY SIGN_Extension IS PORT (
 Instr_15to0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 Sign_extended: out std_logic_vector(31 downto 0));
END SIGN_Extension; 

architecture behavioural of SIGN_Extension is
begin
process (Instr_15to0)
begin
if Instr_15to0(15) = '0' then
Sign_extended <= "0000000000000000" & Instr_15to0;
elsif Instr_15to0(15) = '1' then
Sign_extended <= "1111111111111111" & Instr_15to0;
else 
Sign_extended <= "00000000000000000000000000000000";
end if;
end process;
end behavioural;