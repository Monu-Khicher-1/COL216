-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
    -- empty
    end testbench; 
    
    architecture tb of testbench is
    
    -- DUT component
    component registerfile is
        port  (
            clock      : in std_logic;
            rd_addr1   : in std_logic_vector(3 downto 0);
            rd_addr2   : in std_logic_vector(3 downto 0);
            wr_add     : in std_logic_vector(3 downto 0);
            wr_data    : in std_logic_vector(31 downto 0);
            WE         : in std_logic;
            rd_data1   : out std_logic_vector(31 downto 0);
            rd_data2   : out std_logic_vector(31 downto 0);
        );
    end component;
    
    signal clock_tb      : std_logic;
    signal rd_addr1_tb   : std_logic_vector(3 downto 0);
    signal rd_addr2_tb   : std_logic_vector(3 downto 0);
    signal wr_add_tb     : std_logic_vector(3 downto 0);
    signal wr_data_tb    : std_logic_vector(31 downto 0);
    signal WE_tb         : std_logic;
    signal rd_data1_tb   : std_logic_vector(31 downto 0);
    signal rd_data2_tb   : std_logic_vector(31 downto 0);
    
    begin
    
      -- Connect DUT
      DUT: registerfile port map(clock_tb,rd_addr1_tb,rd_addr2_tb,wr_add_tb,wr_data_tb,WE_tb,rd_data1_tb,rd_data2_tb);
    
      process
      begin
    
        clock_tb<='1';
       
        --
        -- --------------------------------(WRITE TO REGISTERS)------------------------------
        --
    
        wr_add_tb  <= "0000";
        wr_data_tb <= "00000000000000000000000000000000";
        WE_tb <='1';
        wait for 1 ns;
    
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
        
        wr_add_tb  <= "0001";
        wr_data_tb <= "00000000000000000000000000000001";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
    
        wr_add_tb  <= "0010";
        wr_data_tb <= "00000000000000000000000000000010";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "0011";
        wr_data_tb <= "00000000000000000000000000000011";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "0100";
        wr_data_tb <= "00000000000000000000000000000100";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "0101";
        wr_data_tb <= "00000000000000000000000000000101";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "0110";
        wr_data_tb <= "00000000000000000000000000000110";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "0111";
        wr_data_tb <= "00000000000000000000000000000111";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1000";
        wr_data_tb <= "00000000000000000000000000001000";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1001";
        wr_data_tb <= "00000000000000000000000000001001";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1010";
        wr_data_tb <= "00000000000000000000000000001010";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1011";
        wr_data_tb <= "00000000000000000000000000001011";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1100";
        wr_data_tb <= "00000000000000000000000000001100";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1101";
        wr_data_tb <= "00000000000000000000000000001101";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1110";
        wr_data_tb <= "00000000000000000000000000001110";
        WE_tb <='1';
        wait for 1 ns;
        
        clock_tb<='0';
        wait for 1 ns;
        clock_tb<='1';
    
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000001111";
        WE_tb <='1';
        wait for 1 ns;
    
        --
        -- --------------------------(READING AND CHECKING REGISTERS)----------------------------------------
        --
    
        --
        -- --------------------------(0-1)---------------------------------
        --
        clock_tb<='0';
        
        rd_addr1_tb <= "0000";
        rd_addr2_tb <= "0001";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000000000") report "Fail 0/01" severity error;
        assert(rd_data2_tb = "00000000000000000000000000000001") report "Fail 0/11" severity error;
        
        
       
        --
        -- --------------------------(2-3)---------------------------------
        --
    
        rd_addr1_tb <= "0010";
        rd_addr2_tb <= "0011";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000000010") report "Fail 0/02" severity error;
        assert(rd_data2_tb = "00000000000000000000000000000011") report "Fail 0/12" severity error;
        
         
        --
        -- --------------------------(4-5)---------------------------------
        --
        rd_addr1_tb <= "0100";
        rd_addr2_tb <= "0101";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000000100") report "Fail 0/03" severity error;
        assert(rd_data2_tb = "00000000000000000000000000000101") report "Fail 0/13" severity error;
         
        --
        -- --------------------------(6-7)---------------------------------
        --
    
        rd_addr1_tb <= "0110";
        rd_addr2_tb <= "0111";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000000110") report "Fail 0/04" severity error;
        assert(rd_data2_tb = "00000000000000000000000000000111") report "Fail 0/14" severity error;
        
    
        --
        -- --------------------------(8-9)---------------------------------
        --
    
        rd_addr1_tb <= "1000";
        rd_addr2_tb <= "1001";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000001000") report "Fail 0/01" severity error;
        assert(rd_data2_tb = "00000000000000000000000000001001") report "Fail 0/01" severity error;
        
         
    
        --
        -- --------------------------(10-11)---------------------------------
        --
    
        rd_addr1_tb <= "1010";
        rd_addr2_tb <= "1011";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000001010") report "Fail 0/01" severity error;
        assert(rd_data2_tb = "00000000000000000000000000001011") report "Fail 0/01" severity error;
        
        --
        -- --------------------------(12-13)---------------------------------
        --
    
        rd_addr1_tb <= "1100";
        rd_addr2_tb <= "1101";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000001100") report "Fail 0/01" severity error;
        assert(rd_data2_tb = "00000000000000000000000000001101") report "Fail 0/01" severity error;
        
         
    
        --
        -- --------------------------(14-15)---------------------------------
        --
    
        rd_addr1_tb <= "1110";
        rd_addr2_tb <= "1111";
        wr_add_tb  <= "1111";
        wr_data_tb <= "00000000000000000000000000010111";
        WE_tb <='0';
        wait for 1 ns;
        assert(rd_data1_tb = "00000000000000000000000000001110") report "Fail 0/01" severity error;
        assert(rd_data2_tb = "00000000000000000000000000001111") report "Fail 0/01" severity error;
        
         
    
       
        -- Clear inputs
        rd_addr1_tb <= "0000";
        rd_addr2_tb <= "0000";
        wr_add_tb  <= "0000";
        wr_data_tb <= "00000000000000000000000000000000";
        WE_tb <='0';
        wait for 1 ns;
        
        assert false report "Test done." severity note;
        wait;
      end process;
    end tb;
    