library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component controller is
    Port ( 
        clock:in std_logic;
        reset:in std_logic;
    );
end component;

signal clock_cr : std_logic;
signal clear_cr: std_logic;


begin

  -- Connect DUT
  DUT: controller port map(clock_cr,clear_cr);
  
process

begin
    
    
    clear_cr<='1';
    clock_cr<='0';
    wait for 10 ns;
    clear_cr<='0';

    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;

    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;

    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;

    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;

    clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
     clock_cr<='1';
    wait for 10 ns;
    clock_cr<='0';
    wait for 10 ns;
    
    wait;
 
end process;
end tb;
