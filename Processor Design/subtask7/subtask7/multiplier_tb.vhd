library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component multiplier is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           op2 : in STD_LOGIC_VECTOR (31 downto 0);
           op3 : in STD_LOGIC_VECTOR (31 downto 0);
           op4 : in STD_LOGIC_VECTOR (31 downto 0);
           A: in std_logic;
           U: in std_logic;
           S: in std_logic;
           typ: in std_logic;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           out2 : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal s:std_logic_vector(31 downto 0);
signal s1:std_logic_vector(31 downto 0);
signal s2:std_logic_vector(31 downto 0);
signal s3:std_logic_vector(31 downto 0);
signal s4:std_logic;
signal s5:std_logic;
signal s6:std_logic;
signal s7:std_logic;
signal s8:std_logic_vector(31 downto 0);
signal s9:std_logic_vector(31 downto 0);



begin

  -- Connect DUT
  DUT: multiplier port map(s,s1,s2,s3,s4,s5,s6,s7,s8,s9);
  
process

begin
    s<="10101000000010001010100010101011";
    s3<="11110111101010101010100010101011";
    s1<="10101000000010001010100010101011";
    s2<="11110111101010101010100010101011";
    s4<='1';
    s5<='1';
    s6<='0';
    s7<='0';
    wait for 10 ns;

    s<="10101000000010001010100010101011";
    s3<="11110111101010101010100010101011";
    s1<="10101000000010001010100010101011";
    s2<="11110111101010101010100010101011";
    s4<='0';
    s5<='0';
    s6<='1';
    s7<='0';
    wait for 10 ns;
    
    s<="10101000000010001010100010101011";
    s3<="11110111101010101010100010101011";
    s1<="10101000000010001010100010101011";
    s2<="11110111101010101010100010101011";
    s4<='0';
    s5<='0';
    s6<='0';
    s7<='0';
    wait for 10 ns;
    
    wait;
 
end process;
end tb;
