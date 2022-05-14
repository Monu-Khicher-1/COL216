-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registerfile is
    port  (
        clock      : in std_logic;
        rd_addr1   : in std_logic_vector(3 downto 0);
        rd_addr2   : in std_logic_vector(3 downto 0);
        wr_add     : in std_logic_vector(3 downto 0);
        wr_data    : in std_logic_vector(31 downto 0);
        WE         : in std_logic;
        rd_data1   : out std_logic_vector(31 downto 0);
        rd_data2   : out std_logic_vector(31 downto 0);
    );
    end registerfile;


architecture registerfile of registerfile is

    type MEMR_type is array (0 to 15) of std_logic_vector(31 downto 0);
    signal MEMR : MEMR_type;
    
begin
    process(clock)
    begin
        
        if ( WE = '1') then
           if (clock='1') then
                  MEMR( to_integer(unsigned(wr_add)))  <=  wr_data;
           end if;
        end if;
        
    end process;
    rd_data1 <= MEMR(to_integer(unsigned(rd_addr1)));
    rd_data2 <= MEMR(to_integer(unsigned(rd_addr2)));
end registerfile;