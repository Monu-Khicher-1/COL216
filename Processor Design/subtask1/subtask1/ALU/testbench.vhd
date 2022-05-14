-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component alu is
    port(
        operation : in std_logic_vector(3 downto 0);
        op1: in std_logic_vector(31 downto 0);
        op2: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        result: out std_logic_vector(31 downto 0);
    );
end component;

signal operation_tb : std_logic_vector(3 downto 0);
signal op1_tb: std_logic_vector(31 downto 0);
signal op2_tb: std_logic_vector(31 downto 0);
signal cin_tb: std_logic;
signal cout_tb: std_logic;
signal result_tb: std_logic_vector(31 downto 0);

begin

  -- Connect DUT
  DUT: alu port map(operation_tb,op1_tb,op2_tb,cin_tb,cout_tb,result_tb);

  process
  begin

    --
    -- --------------------------------(0)------------------------------
    --

    operation_tb <= "0000";
    op1_tb <= "10000000100000000000000110000111";
    op2_tb <= "10000000000000001100000110000111";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/00" severity error;
    assert(result_tb="10000000000000000000000110000111") report "Fail 0/01" severity error;
    
  --
  -- ---------------------------------(1)------------------------------------
  --

    operation_tb <= "0001";
    op1_tb <= "10000000100000000000000110000111";
    op2_tb <= "10000000000000001100000110000111";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/10" severity error;
    assert(result_tb="00000000100000001100000000000000") report "Fail 0/11" severity error;
    
    --
    -- --------------------------------(2)-------------------------------------
    --

    operation_tb <= "0010";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/20" severity error;
    assert(result_tb="00000000000000000000000000000000") report "Fail 0/21" severity error;
    --
    -- -------------------------------(3)--------------------------------------
    --
    --
    operation_tb <= "0011";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000001000";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/30" severity error;
    assert(result_tb="00000000000000000000000000000111") report "Fail 0/31" severity error;
    
    --
    -- ----------------------------(4)-------------------------------------------
    --

    operation_tb <= "0100";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000010000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/40" severity error;
    assert(result_tb="00000000000000000000010000000010") report "Fail 0/41" severity error;
    
    --
    -- --------------------------(5)----------------------------------------------
    --

    operation_tb <= "0101";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000010000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/50" severity error;
    assert(result_tb="00000000000000000000010000000011") report "Fail 0/51" severity error;

    
    --
    -- --------------------------(6)----------------------------------------------
    --
    
    operation_tb <= "0110";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/60" severity error;
    assert(result_tb="00000000000000000000000000000000") report "Fail 0/61" severity error;
    
    
    --
    -- --------------------------(7)----------------------------------------------
    --
    
    operation_tb <= "0111";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000001000";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/70" severity error;
    assert(result_tb="00000000000000000000000000000111") report "Fail 0/71" severity error;
    
    
    --
    -- --------------------------(8)----------------------------------------------
    --
    
    operation_tb <= "1000";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/80" severity error;
    assert(result_tb="00000000000000000000000000000001") report "Fail 0/81" severity error;

    
    --
    -- --------------------------(9)----------------------------------------------
    --
    
    operation_tb <= "1001";
    op1_tb <= "10000000100000000000000110000111";
    op2_tb <= "10000000000000001100000110000111";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/90" severity error;
    assert(result_tb="00000000100000001100000000000000") report "Fail 0/91" severity error;

    
    --
    -- --------------------------(10)----------------------------------------------
    --
    
    operation_tb <= "1010";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/100" severity error;
    assert(result_tb="00000000000000000000000000000000") report "Fail 0/101" severity error;
    

    
    --
    -- --------------------------(11)----------------------------------------------
    --
    
    operation_tb <= "1011";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000010000000001";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/110" severity error;
    assert(result_tb="00000000000000000000010000000010") report "Fail 0/111" severity error;

    
    --
    -- --------------------------(12)----------------------------------------------
    --
    

    operation_tb <= "1100";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "10000000000000000000000000010101";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/120" severity error;
    assert(result_tb="10000000000000000000000000010101") report "Fail 0/121" severity error;

    
    --
    -- --------------------------(13)----------------------------------------------
    --
    
    operation_tb <= "1101";
    op1_tb <= "00000000000000001110000000000001";
    op2_tb <= "10000000000000000000000000010101";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/130" severity error;
    assert(result_tb="10000000000000000000000000010101") report "Fail 0/131" severity error;

    
    --
    -- --------------------------(14)----------------------------------------------
    --
    

    operation_tb <= "1110";
    op1_tb <= "00000000000000000000000000000001";
    op2_tb <= "00000000000000000000000000000000";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='1') report "Fail 0/140" severity error;
    assert(result_tb="00000000000000000000000000000000") report "Fail 0/141" severity error;
    


    
    --
    -- --------------------------(15)----------------------------------------------
    --
    
   
    operation_tb <= "1111";
    op1_tb <= "00000000000000001110000000000001";
    op2_tb <= "10000000000000000000000000010101";
    cin_tb <= '1';
    
    wait for 1 ns;
    assert(cout_tb='0') report "Fail 0/150" severity error;
    assert(result_tb="01111111111111111111111111101010") report "Fail 0/151" severity error;

   
    -- Clear inputs
    operation_tb <= "0000";
    op1_tb <= "00000000000000000000000000000000";
    op2_tb <= "00000000000000000000000000000000";
    cin_tb <= '0';
    
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
