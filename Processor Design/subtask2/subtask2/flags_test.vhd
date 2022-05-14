library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
  component pc is
    port  (
        clock: in std_logic;
        F_set: in std_logic;
        clr: in std_logic;
        Sbit: in std_logic;
        shift:in std_logic;
        Instrtype: in std_logic_vector(1 downto 0);
        operation: in std_logic_vector(3 downto 0);
        alu_carry: in std_logic;
        shift_carry: in std_logic;
        msb1:in std_logic;
        msb2:in std_logic;
        result:in std_logic_vector(31 downto 0);
        Cf:out std_logic;
        Zf:out std_logic;
        Nf:out std_logic;
        Vf:out std_logic;
    );
  end component;
  signal clock_TB: std_logic;
  signal F_set_TB: std_logic;
  signal  clr_TB: std_logic;
  signal  Sbit_TB: std_logic;
  signal  shift_TB: std_logic;
  signal Instrtype_TB: std_logic_vector(1 downto 0);
  signal operation_TB: std_logic_vector(3 downto 0);
  signal  alu_carry_TB: std_logic;
  signal shift_carry_TB: std_logic;
  signal msb1_TB:std_logic;
  signal msb2_TB:std_logic;
  signal result_TB:std_logic_vector(31 downto 0);
  signal Cf_TB:std_logic;
  signal Zf_TB:std_logic;
  signal Nf_TB:std_logic;
  signal Vf_TB:std_logic;
begin 
    DUT : pc port map (clock_TB,F_set_TB,clr_TB,Sbit_TB,shift_TB,Instrtype_TB,operation_TB,alu_carry_TB,shift_carry_TB,msb1_TB,msb2_TB,result_TB,Cf_TB,Zf_TB,Nf_TB,Vf_TB);
    -- Connect DUT
    process
    begin
        F_set_TB<='1';
        clr_TB<='1';
        Sbit_TB<='1';
        shift_TB_<='0';
        Instrtype<="00";
        operation_TB<="0001";
        alu_carry_TB<='0';
        shift_carry_TB<='0';
        msb1_TB<='1';
        msb2_TB<='1';
        result_TB<="00000000000000000000000000011000";


        wait for 1 ns;
        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        operation_TB<="1000";
        wait for 1 ns;
        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        operation_TB<="1000";
        wait for 1 ns;
        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        operation_TB<="1010";
        wait for 1 ns;
        clock_TB <='0';
        wait for 1 ns;
        clock_TB <='1';
        operation_TB<="1111";
        wait;   
    end process;
end tb;