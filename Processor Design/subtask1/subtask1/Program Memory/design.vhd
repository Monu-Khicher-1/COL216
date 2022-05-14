-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity programmem is
    port  (
        address    : in std_logic_vector(5 downto 0);
        data_out   : out std_logic_vector(31 downto 0);
    );
    end programmem;


architecture programmem of programmem is

    type MEMP_type is array (0 to 63) of std_logic_vector(31 downto 0);
    signal MEMP : MEMP_type;
begin 
         MEMP(0)<="00000000000000000000000000000001";
         MEMP(1)<="00000000000000000000000000000010";
         MEMP(2)<="00000000000000000000000000000011";
         MEMP(3)<="00000000000000000000000000000111";
         MEMP(4)<="00000000000000000000000000000100";
         MEMP(5)<="00000000000000000000000000000101";
         MEMP(6)<="00000000000000000000000000000110";
         data_out <= MEMP(to_integer(unsigned(address))); 
   
end programmem;