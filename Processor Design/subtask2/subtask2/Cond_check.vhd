library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY conditionchecker IS PORT(
    Cf:in std_logic;
    Zf:in std_logic;
    Nf:in std_logic;
    Vf:in std_logic;
    ins3128:in std_logic_vector(3 downto 0);
    predication: out std_logic;
);
end conditionchecker;

architecture bech of Cond_check is
    
begin
    process(clock)
            case ins3128 is
                when "0000" =>
                    predication<=Zf;
                when "0001" =>
                    predication<=not Zf;
                others=>
                    predication<='0';
            end case;
end architecture bech;