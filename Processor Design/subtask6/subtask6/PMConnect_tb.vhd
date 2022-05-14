library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component PMConnect is
    Port ( 
        Rout:in STD_LOGIC_VECTOR(31 downto 0);
        Instruction:in STD_LOGIC_VECTOR(31 downto 0);
        Controlstate:in STD_LOGIC;
        Adr1_0: in STD_LOGIC_VECTOR(1 downto 0);
        Min: out STD_LOGIC_VECTOR(31 downto 0);
        Mout: in STD_LOGIC_VECTOR(31 downto 0);
        Rin: out STD_LOGIC_VECTOR(31 downto 0);
        MW: out STD_LOGIC_VECTOR(3 downto 0);
    );
end component;

signal s1:std_logic_vector(31 downto 0);
signal s2:std_logic_vector(31 downto 0);
signal s3:std_logic;
signal s4:std_logic_vector(1 downto 0);
signal s5:std_logic_vector(31 downto 0);
signal s6:std_logic_vector(31 downto 0);
signal s7:std_logic_vector(31 downto 0);
signal s8:std_logic_vector(3 downto 0);



begin

  -- Connect DUT
  DUT: PMConnect port map(s1,s2,s3,s4,s5,s6,s7,s8);
  
process

begin
    
    s1<="10101000000010001010100010101011";
    s2<="11110111101010101010100010101011";
    s3<='1';
    s4<="00";
    s6<="00000000000000000000000000011000";
    
    wait for 10 ns;

    s1<="10101000000010001010100010101011";
    s2<="11110111101010101010100010101011";
    s3<='0';
    s4<="00";
    s6<="00000000000000000000000000011000";
    
    wait for 10 ns;
    
    s1<="10101000000010001010100010101011";
    s2<="11110111101110101010100010101011";
    s3<='1';
    s4<="00";
    s6<="00000000000000000000000000000011";
    
    wait for 10 ns;
    
    wait;
 
end process;
end tb;
