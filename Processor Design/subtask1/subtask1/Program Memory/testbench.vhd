-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is

  end testbench; 

architecture tb of testbench is

  -- DUT component
  component programmem is
      port(
          address    : in std_logic_vector(5 downto 0);
          data_out   : out std_logic_vector(31 downto 0);
      );
  end component;

  signal address_tb    : std_logic_vector(5 downto 0);
  signal data_out_tb   : std_logic_vector(31 downto 0);

  begin

    -- Connect DUT
    DUT: programmem port map(address_tb,data_out_tb);
    process 
    begin
      address_tb<="000000";
      wait for 1 ns;
      assert(data_out_tb = "00000000000000000000000000000001") report "Fail 0/01" severity error;

      address_tb<="000001";
      wait for 1 ns;
      assert(data_out_tb = "00000000000000000000000000000010") report "Fail 0/01" severity error;
      

      address_tb<="000010";
      wait for 1 ns;
      assert(data_out_tb = "00000000000000000000000000000011") report "Fail 0/02" severity error;
      
     

      address_tb<="000011";
      wait for 1 ns;
      assert(data_out_tb = "00000000000000000000000000000111") report "Fail 0/03" severity error;

      address_tb<="000100";
      wait for 1 ns;
      assert(data_out_tb = "00000000000000000000000000000100") report "Fail 0/04" severity error;
      
      address_tb<= "000000";
      wait for 1 ns;

      assert false report "Test done." severity note;
      wait;
    end process;
  end tb;