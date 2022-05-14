-- Code your design here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ============
-- shift-1
-- ============

entity shift1 is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           carry1 : out STD_LOGIC_VECTOR(0 downto 0);
           carryin: in STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shift1;

architecture Behavioral of shift1 is

begin
    

out1(30 downto 1) <= (op1(31 downto 2)) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                op1(29 downto 0) when (amount='1' and shifttype="00") else
                op1(30 downto 1) when amount='0';
                
out1(0)<='0' when ((shifttype="00") and amount='1') else
         op1(1) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
         op1(0) when amount='0';
         
out1(31) <= '0' when (shifttype="01" and amount='1') else
            op1(31) when (shifttype="10" and amount='1') else
            op1(0) when (shifttype="11" and amount='1') else
            op1(30) when ( (amount='1' and shifttype="00")) else
            op1(31) when amount='0';
            
carry1(0) <= op1(0) when ((shifttype="01" or shifttype="10") and amount='1') else
            op1(1) when ((shifttype="11") and amount='1') else
            op1(31) when ((shifttype="00") and amount='1') else
            carryin(0) when amount='0';

end Behavioral;

-- ============
-- Shift-2
-- ============


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift2 is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           carry1 : out STD_LOGIC_VECTOR(0 downto 0);
           carryin: in STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shift2;

architecture Behavioral of shift2 is

begin

    out1(29 downto 2) <= (op1(31 downto 4)) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                         op1(27 downto 0) when ((amount='1' and shifttype="00")) else
                         op1(29 downto 2) when amount='0';
    
    out1(31 downto 30) <= op1(1 downto 0) when (amount='1' and (shifttype="11")) else
                           "00" when (amount='1' and (shifttype="01" )) else
                           op1(31)&op1(31) when (amount='1' and (shifttype="10")) else
                           op1(29 downto 28) when ((amount='1' and shifttype="00")) else
                           op1(31 downto 30) when amount='0';

    out1(1 downto 0) <= "00" when (amount='1' and (shifttype="00")) else
                        op1(3 downto 2) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                        op1(1 downto 0) when amount='0';
                
    carry1(0) <= op1(1) when ((shifttype="01" or shifttype="10") and amount='1') else
                op1(2) when ((shifttype="11") and amount='1') else
                op1(30) when ((shifttype="00") and amount='1') else
                carryin(0) when amount='0';
    

end Behavioral;

-- ==================
-- Shift-4
-- ==================


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity shift4 is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           carry1 : out STD_LOGIC_VECTOR(0 downto 0);
           carryin: in STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shift4;

architecture Behavioral of shift4 is

begin

    out1(27 downto 4) <= (op1(31 downto 8)) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                        op1(23 downto 0) when (amount='1' and shifttype="00") else
                        op1(27 downto 4) when amount='0';
    
    out1(31 downto 28) <= op1(3 downto 0) when (amount='1' and (shifttype="11")) else
                           "0000" when (amount='1' and (shifttype="01" )) else
                           (op1(31))&(op1(31))&(op1(31))&(op1(31)) when (amount='1' and (shifttype="10")) else
                           op1(27 downto 24) when (amount='1' and shifttype="00") else
                           op1(31 downto 28) when amount='0';

    out1(3 downto 0) <= "0000" when (amount='1' and (shifttype="00")) else
                        op1(7 downto 4) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                        op1(3 downto 0) when amount='0';
       
    carry1(0) <= op1(3) when ((shifttype="01" or shifttype="10") and amount='1') else
                op1(4) when ((shifttype="11") and amount='1') else
                op1(28) when ((shifttype="00") and amount='1') else
                carryin(0) when amount='0';
    
end Behavioral;

-- =================
-- Shift-8
-- =================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity shift8 is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           carry1 : out STD_LOGIC_VECTOR(0 downto 0);
           carryin: in STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shift8;

architecture Behavioral of shift8 is

begin

            out1(23 downto 8) <= (op1(31 downto 16)) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                                op1(15 downto 0) when (amount='1' and shifttype="00") else
                                op1(23 downto 8) when amount='0';
            
            out1(31 downto 24) <= op1(7 downto 0) when (amount='1' and (shifttype="11")) else
                                   "00000000" when (amount='1' and (shifttype="01" )) else
                                   (op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)) when (amount='1' and (shifttype="10")) else
                                    op1(23 downto 16) when (amount='1' and shifttype="00") else
                                    op1(31 downto 24) when amount='0';
            out1(7 downto 0) <= "00000000" when (amount='1' and (shifttype="00")) else
                                op1(15 downto 8) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                                op1(7 downto 0) when amount='0';
               
            carry1(0) <= op1(7) when ((shifttype="01" or shifttype="10") and amount='1') else
                        op1(8) when ((shifttype="11") and amount='1') else
                        op1(24) when ((shifttype="00") and amount='1') else
                        carryin(0) when amount='0';
            
end Behavioral;

-- =================
-- Shift-16
-- =================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shift16 is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           carry1 : out STD_LOGIC_VECTOR(0 downto 0);
           carryin: in STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shift16;

architecture Behavioral of shift16 is

begin

        out1(15 downto 0) <= (op1(31 downto 16)) when ((shifttype="11" or shifttype="01" or shifttype="10") and amount='1') else
                             "0000000000000000" when (amount='1' and (shifttype="00")) else
                              op1(15 downto 0) when amount='0';
        out1(31 downto 16) <= op1(15 downto 0) when (amount='1' and shifttype="00") else
                            op1(31 downto 16) when amount='0' else
                            op1(15 downto 0) when (amount='1' and (shifttype="11")) else
                            "0000000000000000" when (amount='1' and (shifttype="01" )) else
                             (op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)&op1(31)) when (amount='1' and (shifttype="10"));
           
        carry1(0) <= op1(15) when ((shifttype="01" or shifttype="10") and amount='1') else
                    op1(16) when ((shifttype="11") and amount='1') else
                    op1(16) when ((shifttype="00") and amount='1') else
                    carryin(0) when amount='0';

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shiftbytype is
    Port ( opr1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0);
           carry : out STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end shiftbytype;


architecture Behavioral of shiftbytype is
signal out01: STD_LOGIC_VECTOR (31 downto 0);
signal carry01: STD_LOGIC_VECTOR(0 downto 0);
signal out02: STD_LOGIC_VECTOR (31 downto 0);
signal carry02: STD_LOGIC_VECTOR(0 downto 0);
signal out04: STD_LOGIC_VECTOR (31 downto 0);
signal carry04: STD_LOGIC_VECTOR(0 downto 0);
signal out08: STD_LOGIC_VECTOR (31 downto 0);
signal carry08: STD_LOGIC_VECTOR(0 downto 0);
signal out16: STD_LOGIC_VECTOR (31 downto 0);
signal carry16 :STD_LOGIC_VECTOR(0 downto 0);
begin
shift1: entity work.shift1 port map(opr1,amount(0),out01,carry01,"0", shifttype);
shift2: entity work.shift2 port map(out01,amount(1),out02,carry02,carry01,shifttype);
shift4: entity work.shift4 port map(out02,amount(2),out04,carry04,carry02,shifttype);
shift8: entity work.shift8 port map(out04,amount(3),out08,carry08,carry04,shifttype);
shift16: entity work.shift16 port map(out08,amount(4),out16,carry16,carry08,shifttype);

            output <= out16;
            carry <= carry16;
end Behavioral;