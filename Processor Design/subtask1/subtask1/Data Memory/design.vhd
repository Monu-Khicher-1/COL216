library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity datamem is
    port  (
        clock      : in std_logic;
        address    : in std_logic_vector(5 downto 0);
        data_in    : in std_logic_vector(31 downto 0);
        WE         : in std_logic;
        data_out   : out std_logic_vector(31 downto 0);
    );
    end datamem;


architecture datamem of datamem is

    type MEM_type is array (0 to 63) of std_logic_vector(31 downto 0);
    signal MEM : MEM_type;
    
begin
    process(clock)
    begin 
        if ( WE = '1') then
            if (rising_edge(clock)) then
               MEM( to_integer(unsigned(address)))  <=  data_in;
            end if;
        end if;
    end process;
    data_out <= MEM(to_integer(unsigned(address)));
end architecture datamem;