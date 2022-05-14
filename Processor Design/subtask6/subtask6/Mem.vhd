library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datamem is
    port  (
        clock      : in std_logic;
        address    : in std_logic_vector(31 downto 0);
        data_in    : in std_logic_vector(31 downto 0);
        WE         : in std_logic_vector(3 downto 0);
        data_out   : out std_logic_vector(31 downto 0);
    );
    end datamem;


architecture datamem of datamem is

    type MEM_type is array (0 to 255) of std_logic_vector(31 downto 0);
    signal MEM : MEM_type;
    
begin
    MEM(0)<="00101010000000000010101000000000";
    MEM(4)<=X"E3A00102";
    MEM(8)<=X"E3A00206";
    MEM(12)<=X"E2811002";
    process(clock)
    begin 
        if ( WE(3) = '1') then
            if (rising_edge(clock)) then
               MEM( to_integer(unsigned(address)))(31 downto 24)  <=  data_in(31 downto 24);
            end if;
        elsif ( WE(2) = '1') then
            if (rising_edge(clock)) then
                MEM( to_integer(unsigned(address)))(23 downto 16)  <=  data_in(23 downto 16);
            end if;
        elsif ( WE(1) = '1') then
            if (rising_edge(clock)) then
                MEM( to_integer(unsigned(address)))(15 downto 8)  <=  data_in(15 downto 8);
            end if;
        elsif ( WE(0) = '1') then
            if (rising_edge(clock)) then
                MEM( to_integer(unsigned(address)))(7 downto 0)  <=  data_in(7 downto 0);
            end if;
        end if;
    end process;
    data_out <= X"E3A00002" when (address="00000000000000000000000000000000") else 
                X"E3A00104" when (address="00000000000000000000000000000100")  else 
                X"E2811002" when (address="00000000000000000000000000001000")  else 
                X"E0832001" when (address="00000000000000000000000000001100")  else 
                X"E0440001" when (address="00000000000000000000000000010000")  else 
                MEM(to_integer(unsigned(address)));
end architecture datamem;