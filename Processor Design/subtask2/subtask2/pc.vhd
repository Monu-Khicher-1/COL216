library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY pc IS PORT(
    offset   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    PSrc  : IN STD_LOGIC; -- branch instruction or not.
    clr : IN STD_LOGIC; -- async. clear.
    clock : IN STD_LOGIC; -- clock.
    PW: IN STD_LOGIC;
    address  : INOUT STD_LOGIC_VECTOR(5 DOWNTO 0) -- output
);
END pc;

ARCHITECTURE description OF pc IS

BEGIN
    process(clock, clr)
    begin
        if clr = '1' then
            address <= "000000";
        elsif rising_edge(clock) then
            if PW='1' then
                if PSrc = '1' then
                    address <=address+8+offset(5 downto 0);
                end if;
                if PSrc='0' then
                    address<=address+4;
                end if;
            end if;
        end if;
    end process;
END description;