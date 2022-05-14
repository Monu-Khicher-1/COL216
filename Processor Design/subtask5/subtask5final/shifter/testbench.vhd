-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component shiftbytype is
    Port ( opr1 : in STD_LOGIC_VECTOR (31 downto 0);
           amount : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0);
           carry : out STD_LOGIC_VECTOR(0 downto 0);
           shifttype: in STD_LOGIC_VECTOR(1 downto 0));
end component;

signal opr1_tb : std_logic_vector(31 downto 0);
signal amount_tb: std_logic_vector(4 downto 0);
signal output_tb: std_logic_vector(31 downto 0);
signal carry_tb: STD_LOGIC_VECTOR(0 downto 0);
signal shifttype_tb: std_logic_vector(1 downto 0);

begin

  -- Connect DUT
  DUT: shiftbytype port map(opr1_tb,amount_tb,output_tb,carry_tb,shifttype_tb);

  process
  begin
    
    opr1_tb <="10000000000000001110000000000001";
    amount_tb <= "00110";
    shifttype_tb <= "10";
   
    
    wait for 1 ns;
    opr1_tb <="00000000000000001110000000000011";
    amount_tb <= "00010";
    shifttype_tb <= "00";
   
    
    wait for 1 ns;

    opr1_tb <="00000000000000001110000000000001";
    amount_tb <= "00101";
    shifttype_tb <= "00";
   
    
    wait for 1 ns;

    opr1_tb <="00110000000000001110000000000101";
    amount_tb <= "00100";
    shifttype_tb <= "01";
   
    
    wait for 1 ns;
   
   
    -- Clear inputs
    opr1_tb <="00000000000000000000000000000000";
    amount_tb <= "00000";
    shifttype_tb <= "10";
   
    
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
