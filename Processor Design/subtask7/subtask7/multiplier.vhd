library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity multiplier is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           op2 : in STD_LOGIC_VECTOR (31 downto 0);
           op3 : in STD_LOGIC_VECTOR (31 downto 0);
           op4 : in STD_LOGIC_VECTOR (31 downto 0);
           A: in std_logic;
           U: in std_logic;
           S: in std_logic;
           typ: in std_logic;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           out2 : out STD_LOGIC_VECTOR (31 downto 0));
 end multiplier;

architecture Behavioral of multiplier is
signal outemp: std_logic_vector(63 downto 0);
signal op: std_logic_vector(63 downto 0);
begin
        outemp <= std_logic_vector(unsigned(op1)*unsigned(op2)+unsigned(op3)); 
        out1(31 downto 0) <= outemp(31 downto 0);
        
        op<=op4 & op3;
        outemp<= std_logic_vector(unsigned(op1)*unsigned(op2)+unsigned(op3)) when ((typ='0') and (A='1')) else
            std_logic_vector(unsigned(op1)*unsigned(op2)) when ((typ='0') and (A='0')) else
            std_logic_vector(unsigned(op1)*unsigned(op2)) when ((typ='1') and (A='0') and (S='0')) else
            std_logic_vector(signed(op1)*signed(op2)) when ((typ='1') and (A='0') and (S='1')) else
            std_logic_vector(unsigned(op1)*unsigned(op2)+unsigned(op)) when ((typ='1') and (A='1') and (S='0')) else
            std_logic_vector(signed(op1)*signed(op2)+signed(op)) when ((typ='1') and (A='1') and (S='1')) else
            "0000000000000000000000000000000000000000000000000000000000000000";
        out1<=outemp(31 downto 0);
        out2<=outemp(63 downto 32);        
end Behavioral;