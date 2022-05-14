library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
  component pc is
    port  (
      offset   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      PSrc  : IN STD_LOGIC; -- branch instruction or not.
      clr : IN STD_LOGIC; -- async. clear.
      clock : IN STD_LOGIC; -- clock.
      PW: IN STD_LOGIC;
      address  : INOUT STD_LOGIC_VECTOR(5 DOWNTO 0) -- output
    );
  end component;

  signal clock_TB   : std_logic;
  signal PW_TB      : std_logic;
  signal PSrc_TB    : std_logic;
  signal clr_TB    : std_logic;
  signal address_TB : std_logic_vector(5 downto 0);
  signal offset_TB : std_logic_vector(31 downto 0);


begin 
    DUT : pc port map (offset_TB,PSrc_TB,clr_TB,clock_TB,PW_TB,address_TB);
    -- Connect DUT
    process
    begin
        clr_TB<='1';
        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';

        clr_TB<='0';
        
        PW_TB<='1';
        PSrc_TB<='0';
        wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        

        wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        

        wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        

        wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        
         wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        
         wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        
         wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        
         wait for 1 ns;

        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        
        wait;   
    end process;
end tb;