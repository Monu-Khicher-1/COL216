library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity controller is
end controller;

architecture cr of controller is
component alu is
    port(
        operation : in std_logic_vector(3 downto 0);
        op1: in std_logic_vector(31 downto 0);
        op2: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        result: out std_logic_vector(31 downto 0);
        flags:out std_logic_vector(3 downto 0);
    );
end component;
component registerfile is
    port(
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
component datamem is
    port(
        clock      : in std_logic;
        address    : in std_logic_vector(31 downto 0);
        data_in    : in std_logic_vector(31 downto 0);
        WE         : in std_logic;
        data_out   : out std_logic_vector(31 downto 0);
    );
end component;
component progc is
    port(
        clr : IN STD_LOGIC; -- async. clear.
        indata: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        clock : IN STD_LOGIC; -- clock.
        PW: IN STD_LOGIC;
        address  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- output
    );
end component;
component decode is
    port(
        instruction:in std_logic_vector(31 downto 0);
        ins19_16: out std_logic_vector(3 downto 0);
        ins3_0: out std_logic_vector(3 downto 0);
        ins15_12: out std_logic_vector(3 downto 0);
        ins11_0: out std_logic_vector(11 downto 0);
        ins23_0: out std_logic_vector(23 downto 0);
        load_store:out std_logic; -- instruction(20)
        Rsrc:out std_logic;
        Instr_type: out std_logic_vector(1 downto 0);  -- 27-26
        DP_subclass: out std_logic_vector(2 downto 0);
        operation:out std_logic_vector(3 downto 0);
        DT_offset_sign:out std_logic;  
        condition: out std_logic_vector(3 downto 0);
        imm:out std_logic;
        immediate:out std_logic_vector(7 downto 0);
    );
end component;
component cond_check is
    port(
        cond : in std_logic_vector(3 downto 0);
        flags: in std_logic_vector(3 downto 0);
        cout: out std_logic;
    );
end component;
component flag is
    port(
        inflags:in std_logic_vector(3 downto 0);
        DP_subtype:in std_logic_vector(2 downto 0);
        F_set:in std_logic;
        outflags:out std_logic_vector(3 downto 0);
    );
end component;
component fsm is
    port(
        clock: in std_logic;
        Instrtype: in std_logic_vector(1 downto 0);
        DP_subclass: in std_logic_vector(2 downto 0);
        load_store:in std_logic;
        reset:in std_logic;
        operation:in std_logic_vector(3 downto 0);
        cond:in std_logic;
        offset_sign: in std_logic;
        IW: out std_logic;
        AW: out std_logic;
        BW: out std_logic;
        DW: out std_logic;
        ReW: out std_logic;
        PW: out std_logic;
        MW: out std_logic;
        RW: out std_logic;
        M2R: out std_logic;
        IorD: out std_logic;
        ASrc1: out std_logic;
        ASrc2: out std_logic_vector(1 downto 0);
        F_set: out std_logic;
        opc:out std_logic_vector(3 downto 0);
        state:inout std_logic_vector(3 downto 0);
    );
end component;
component register32 is
    port(
        d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        ld  : IN STD_LOGIC; -- load/enable.
        clr : IN STD_LOGIC; -- async. clear.
        clk : IN STD_LOGIC; -- clock.
        q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
    );
end component;
component mux32bit4to1 is
    port(
        inp0: in std_logic_vector(31 downto 0);
        inp1: in std_logic_vector(31 downto 0);
        inp2: in std_logic_vector(31 downto 0);
        inp3: in std_logic_vector(31 downto 0);
        triger: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
end component;
component mux32bit2to1 is
    port(
        inp0: in std_logic_vector(31 downto 0);
        inp1: in std_logic_vector(31 downto 0);
        triger: in std_logic;
        output: out std_logic_vector(31 downto 0);
    );
end component;
component mux4bit2to1 is
    port(
        inp0: in std_logic_vector(3 downto 0);
        inp1: in std_logic_vector(3 downto 0);
        triger: in std_logic;
        output: out std_logic_vector(3 downto 0);
    );
end component;
component s2 is
    port(
        input: in std_logic_vector(23 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
end component;
component ex is
    port(
        input: in std_logic_vector(11 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
end component;

signal clock_cr:std_logic;
signal clear_cr:std_logic;

signal aluout: std_logic_vector(31 downto 0);
signal pcout: std_logic_vector(31 downto 0);
signal rslt_cr:std_logic_vector(31 downto 0);
signal addr:std_logic_vector(31 downto 0);
signal Bdata: std_logic_vector(31 downto 0);
signal data: std_logic_vector(31 downto 0);
signal ins: std_logic_vector(31 downto 0);
signal DRdata: std_logic_vector(31 downto 0);
signal wrdata: std_logic_vector(31 downto 0);
signal rd1: std_logic_vector(31 downto 0);
signal rd2: std_logic_vector(31 downto 0);
signal rd: std_logic_vector(31 downto 0);
signal Adata: std_logic_vector(31 downto 0);
signal num: std_logic_vector(31 downto 0);
signal opr1: std_logic_vector(31 downto 0);
signal opr2: std_logic_vector(31 downto 0);
signal s2plus4: std_logic_vector(31 downto 0);
signal exsig: std_logic_vector(31 downto 0);
signal s2sig: std_logic_vector(31 downto 0);
signal carryin: std_logic;
signal flgs:std_logic_vector(3 downto 0);
signal flg:std_logic_vector(3 downto 0);
signal state_cr:std_logic_vector(3 downto 0);


signal d1: std_logic_vector(3 downto 0);
signal d2: std_logic_vector(3 downto 0);
signal d3: std_logic_vector(3 downto 0);
signal d4: std_logic_vector(11 downto 0);
signal d5: std_logic_vector(23 downto 0);
signal d6: std_logic;
signal d7: std_logic;
signal d8: std_logic_vector(1 downto 0);
signal d9: std_logic_vector(2 downto 0);
signal d10: std_logic_vector(3 downto 0);
signal d11: std_logic;
signal d12: std_logic_vector(3 downto 0);
signal d13: std_logic;
signal d14: std_logic_vector(7 downto 0);
signal d15: std_logic_vector(31 downto 0);
signal r2: std_logic_vector(3 downto 0);


signal PW_cr: std_logic;
signal IW_cr: std_logic;
signal MW_cr: std_logic;
signal RW_cr: std_logic;
signal AW_cr: std_logic;
signal BW_cr: std_logic;
signal DW_cr: std_logic;
signal ReS_cr: std_logic;
signal IorD_cr: std_logic;
signal M2R_cr: std_logic;
signal ASrc1_cr: std_logic;
signal ASrc2_cr: std_logic_vector(1 downto 0);
signal opr: std_logic_vector(3 downto 0);
signal Fset:std_logic;
signal cond_cr:std_logic;
    
begin
    PC: progc port map(clear_cr,aluout,clock_cr,PW_cr,pcout);
    MUX1: mux32bit2to1 port map(pcout,rslt_cr,IorD_cr,addr);
    MEM: datamem port map(clock_cr,addr,Bdata,MW_cr,data);
    INSREG: register32 port map(data,IW_cr,clear_cr,clock_cr,ins);
    DREG: register32 port map(data,DW_cr,clear_cr,clock_cr,DRdata);
    DEC: decode port map(ins,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12);
    MUX2: mux32bit2to1 port map(rslt_cr,DRdata,M2R_cr,wrdata);
    MUX3:  mux4bit2to1 port map(d2,d3,d7,r2);
    RF: registerfile port map(clock_cr,d1,r2,d3,wrdata,RW_cr,rd1,rd2);
    AREG: register32 port map(rd1,AW_cr,clear_cr,clock_cr,Adata);
    BREG: register32 port map(rd,BW_cr,clear_cr,clock_cr,Bdata);
    MUX4: mux32bit2to1 port map(pcout,Adata,ASrc1_cr,opr1);
    MUX5: mux32bit4to1 port map(Bdata,num,exsig,s2plus4,ASrc2_cr,opr2);
    ARTHLU: alu port map(opr,opr1,opr2,carryin,aluout,flgs);
    FLG1: flag port map(flgs,d9,Fset,flg);
    RESREG: register32 port map(aluout,ReS_cr,clear_cr,clock_cr,rslt_cr);
    CHK: cond_check port map(d12,flg,cond_cr);
    FSM1: fsm port map(clock_cr,d8,d9,d6,clear_cr,d10,cond_cr,d11,IW_cr,AW_cr,BW_cr,DW_cr,ReS_cr,PW_cr,MW_cr,RW_cr,M2R_cr,IorD_cr,ASrc1_cr,ASrc2_cr,Fset,opr,state_cr);
    MUX6:mux32bit2to1 port map(rd2,d15,d13,rd);
    process 
    begin
 
    
        num<="00000000000000000000000000000100";
        d15<=("000000000000000000000000"& d14);
        s2plus4<= s2sig+"00000000000000000000000000000100";
        clear_cr<='1';
        clock_cr<='0';
        wait for 10 ns;
        clear_cr<='0';

        clock_cr<='1';
        wait for 10 ns;
        clock_cr<='0';
        wait for 10 ns;

        
     
    end process;

end cr;