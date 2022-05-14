-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
  component datamem is
    port  (
        clock      : in std_logic;
        address    : in std_logic_vector(5 downto 0);
        data_in    : in std_logic_vector(31 downto 0);
        WE         : in std_logic;
        data_out   : out std_logic_vector(31 downto 0);
    );
  end component;

  signal clock_TB    : std_logic;
  signal address_TB  : std_logic_vector(5 downto 0);
  signal data_in_TB  : std_logic_vector(31 downto 0);
  signal WE_TB       : std_logic;
  signal data_out_TB : std_logic_vector(31 downto 0);


begin 
     DUT : datamem port map (clock_TB,address_TB,data_in_TB,WE_TB,data_out_TB);
    -- Connect DUT
    process
    begin

    clock_TB <='0';
    wait for 1 ns;
    clock_TB <='1';
   
    address_TB  <= "000000";
    data_in_TB <= "00000000000000000000000000000000";
    WE_TB <='1';
    wait for 1 ns;

    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';
    
    address_TB  <= "000001";
    data_in_TB <= "00000000000000000000000000000001";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB <= "000010";
    data_in_TB <= "00000000000000000000000000000010";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "000011";
    data_in_TB <= "00000000000000000000000000000011";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "000100";
    data_in_TB <= "00000000000000000000000000000100";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "000101";
    data_in_TB <= "00000000000000000000000000000101";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "000110";
    data_in_TB <= "00000000000000000000000000000110";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "000111";
    data_in_TB <= "00000000000000000000000000000111";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB <= "001000";
    data_in_TB <= "00000000000000000000000000001000";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001001";
    data_in_TB <= "00000000000000000000000000001001";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001010";
    data_in_TB<= "00000000000000000000000000001010";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001011";
    data_in_TB <= "00000000000000000000000000001011";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001100";
    data_in_TB <= "00000000000000000000000000001100";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001101";
    data_in_TB <= "00000000000000000000000000001101";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001110";
    data_in_TB <= "00000000000000000000000000001110";
    WE_TB <='1';
    wait for 1 ns;
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    address_TB  <= "001111";
    data_in_TB <= "00000000000000000000000000001111";
    WE_TB <='1';
    wait for 1 ns;

    --
    -- --------------------------(READING AND CHECKING REGISTERS)----------------------------------------
    --

    --
    -- --------------------------(0-1)---------------------------------
    --
    
    
    
    clock_TB<='0';
    wait for 1 ns;
    clock_TB<='1';

    WE_TB <='0';

    address_TB  <= "000111";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000000111") report "Fail 0/01" severity error;
  
    address_TB  <= "000011";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000000011") report "Fail 0/01" severity error;
    
  
    address_TB  <= "000001";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000000001") report "Fail 0/01" severity error;
    
    
    address_TB  <= "001001";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000001001") report "Fail 0/01" severity error;
    
    

    
    address_TB  <= "001110";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000001110") report "Fail 0/01" severity error;
    
  
    
    address_TB  <= "000111";
    wait for 1 ns;
    assert(data_out_TB = "00000000000000000000000000000111") report "Fail 0/01" severity error;
    
    
    --
    --
    -- --------------------------(4-5)---------------------------------
    --
    address_TB  <= "000000";
    wait for 1 ns;
    
    assert false report "Test done." severity note;
    wait;
    end process;
end tb;