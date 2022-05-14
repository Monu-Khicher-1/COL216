-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--                 *************** COMPONENTS****************
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


--===========
-- 1. ALU
--===========

entity alu is
    port(
        operation : in std_logic_vector(3 downto 0);
        op1: in std_logic_vector(31 downto 0);
        op2: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        result: out std_logic_vector(31 downto 0);
        flags:out std_logic_vector(3 downto 0);
    );
    end alu;

architecture alu of alu is
   signal flag: std_logic_vector(3 downto 0);
begin
    process(operation,op1,op2,cin)
        variable temp:std_logic_vector(32 downto 0);
        variable rslt:std_logic_vector(31 downto 0);
        variable carry:std_logic_vector(32 downto 0);
        variable c31: std_logic;
        variable c32: std_logic;
        variable f:std_logic_vector(3 downto 0);
    begin
        temp:="000000000000000000000000000000000";
        carry:="000000000000000000000000000000000";
        f:="0000";
        
        if(cin='1') then
              carry:="000000000000000000000000000000001";
        end if;
        case operation is
            when "0000"=>     -- op1 and op2
                rslt:=op1 and op2;
                 result<=rslt;
            when "0001" =>    -- op1 eor op2
                rslt := op1 xor op2;
                 result<=rslt;
            when "0010"=>    -- op1 + Not op2 +1
                temp:= ('0'& op1)+ ('0'& not(op2)) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "0011"=>    -- not op1 + op2 +1
                temp:= ('0'& not(op1))+ ('0'& op2) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "0100"=>    -- op1 + op2 
                temp:= ('0'& op1)+ ('0'& op2);
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "0101"=>    -- op1 +  op2 +c
                temp:= ('0'& op1)+ ('0'& op2) + carry;
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "0110"=>    -- op1 + Not op2 +c
                temp:= ('0'& op1)+ ('0'& not(op2)) +carry;
                rslt:= temp(31 downto 0);
                result<=rslt;
            when "0111"=>    -- Not op1 + op2 +c
                temp:= ('0'& not(op1))+ ('0'& op2) +carry;
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "1000"=>    -- op1 and op2 
                rslt:= op1 and op2 ;
                 result<=rslt;
                
            when "1001"=>    -- op1 eor op2 
                rslt := op1 xor op2;
            when "1010"=>    -- op1 + Not op2 +1
                temp:= ('0'& op1)+ ('0'& not(op2)) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "1011"=>    -- op1 +  op2 
                temp:= ('0'& op1)+ ('0'& op2);
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "1100"=>    -- op1 or op2 
                rslt:=op1 or op2;
                 result<=rslt;
            when "1101"=>    -- op2 
                rslt:=op2;
                result<=rslt;
            when "1110"=>    -- op1 + Not op2 
                temp:= ('0'& op1)+('0'& not(op2));
                rslt:= temp(31 downto 0);
                 result<=rslt;
            when "1111"=>    --  Not op2 
                 rslt:= not(op2);
                  result<=rslt;
            when others =>
                 rslt := op1;
                  result<=rslt;
        end case;
         c31 := (op1(31) xor op2(31) xor result(31)); 
         c32 := ((op1(31) and c31) xor (op1(31) and c31) xor (op1(31)and op2(31)));
         f(0):= c32;
         f(1):= (c32 xor c31);
         f(2):= '1' when rslt="0000000000000000000000000000000" else '0';
         f(3):=rslt(31);
         flags<=f;
         flag<=f;
         --result<=rslt;
         
        
    end process;
end alu;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


-- =================
-- 2. Register File
-- =================


entity registerfile is
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
    end registerfile;


architecture registerfile of registerfile is

    type MEMR_type is array (0 to 15) of std_logic_vector(31 downto 0);
    signal MEMR : MEMR_type;
    
begin
    process(clock)
    begin
        
        if ( WE = '1') then
           if (clock='1') then
                  MEMR( to_integer(unsigned(wr_add)))  <=  wr_data;
           end if;
        end if;
        
    end process;
    rd_data1 <= MEMR(to_integer(unsigned(rd_addr1)));
    rd_data2 <= MEMR(to_integer(unsigned(rd_addr2)));
end registerfile;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;




-- =====================
-- 3. Memory
-- =====================

entity datamem is
    port  (
        clock      : in std_logic;
        address    : in std_logic_vector(31 downto 0);
        data_in    : in std_logic_vector(31 downto 0);
        WE         : in std_logic;
        data_out   : out std_logic_vector(31 downto 0);
    );
    end datamem;


architecture datamem of datamem is

    type MEM_type is array (0 to 255) of std_logic_vector(31 downto 0);
    signal MEM : MEM_type;
    
begin
    MEM(0)<="00101010000000000010101000000000";
    MEM(4)<=X"E3A00102";
    MEM(8)<=X"E3A00206";
    MEM(12)<=X"E2811002";
    process(clock)
    begin 
        if ( WE = '1') then
            if (rising_edge(clock)) then
               MEM( to_integer(unsigned(address)))  <=  data_in;
            end if;
        end if;
    end process;
    data_out <= X"E3A00002" when (address="00000000000000000000000000000000") else 
                X"E3A00104" when (address="00000000000000000000000000000100")  else 
                X"E2811002" when (address="00000000000000000000000000001000")  else 
                X"E0832001" when (address="00000000000000000000000000001100")  else 
                X"E0440001" when (address="00000000000000000000000000010000")  else 
                MEM(to_integer(unsigned(address)));
end architecture datamem;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



-- ======================
-- 4. PC
-- ======================

ENTITY progc IS PORT(
    clr : IN STD_LOGIC; -- async. clear.
    indata: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clock : IN STD_LOGIC; -- clock.
    PW: IN STD_LOGIC;
    address  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- output
);
END progc;

ARCHITECTURE description OF progc IS
BEGIN
    process(clock, clr)
    begin
        if clr = '1' then
            address <= "00000000000000000000000000000000";
        elsif (rising_edge(clock)) then
            if PW='1' then
                address<=indata;
            end if;
        end if;
    end process;
END description;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



-- =================
-- 5. Decoder
-- =================
entity decode is
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
      operation:out std_logic_vector(3 downto 0); --24-21
      DT_offset_sign:out std_logic;  
      condition: out std_logic_vector(3 downto 0);
      imm:out std_logic;
      immediate:out std_logic_vector(7 downto 0);
    );
    end decode;

architecture bech of decode  is
begin

    ins19_16<=instruction(19 downto 16);
    ins3_0<=instruction(3 downto 0);
    ins15_12<=instruction(15 downto 12);
    ins11_0<=instruction(11 downto 0);
    ins23_0<=instruction(23 downto 0);
    load_store<=instruction(20);  -- 1=>load
    RSrc<='0' when (instruction(27 downto 26)="00") else '1';
    Instr_type<=instruction(27 downto 26);
    DP_subclass<=instruction(24 downto 22);
    operation<=instruction(24 downto 21);
    DT_offset_sign<=instruction(23); -- '1'=>+
    condition<=instruction(31 downto 28);
    imm<=instruction(25);
    immediate<=instruction(7 downto 0);
   
end bech;

-- ======================
-- 6. Condition Checker
-- ======================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity cond_check is
    port(
        cond : in std_logic_vector(3 downto 0);
        flags: in std_logic_vector(3 downto 0);
        cout: out std_logic;
    );
    end cond_check ;

architecture cond_check of cond_check  is
begin
    cout<= flags(1) when cond="0000" else
        (not flags(1)) when cond="0001" else
            '0';
end cond_check ;

-- ====================
-- 7. Flags
-- ====================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity flag is
    port(
        inflags:in std_logic_vector(3 downto 0);
        DP_subtype:in std_logic_vector(2 downto 0);
        F_set:in std_logic;
        outflags:out std_logic_vector(3 downto 0);
    );
    end flag;

architecture bech of flag is
begin
    outflags<=inflags when ((DP_subtype="101") and (F_set='1'));
end bech;


-- ######################################################################################################
-- ######################################################################################################

-- =======================
-- 1. FSM
-- =======================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity fsm is
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
    end fsm;

architecture bech of fsm is  -- Define the states   -- Create a signal that uses 
begin
 process(reset,clock)
 begin
        if (reset='1') then
            State<="0001";
        elsif rising_edge(clock) then
            case State is
                when "0001"=>
                    State<="0010";
                when "0010"=>
                    if (Instrtype="00") then
                        State<="0011";
                    elsif (Instrtype="11") then 
                        State<="0100";
                    elsif (Instrtype="10") then 
                        State <="0101";
                    else 
                        State<="0001";
                    end if;
                when "0011"=>
                   State<="0110";
                when "0100"=>
                    if (load_store='1') then
                        State<="0111";
                    else 
                        State<="1000";
                    end if;
                when "0101"=>
                     State<="0001";
                when "0110"=>
                     State<="0001";
                when "0111"=>
                     State<="0001";
                when "1000"=>
                     State<="1001";
                when "1001"=>
                     State<="0001";
                when others=>
                     State<="0001";
            end case;
        end if;
        IW<='1' when (State="0001") else '0';
        AW<='1' when (State="0010") else '0';
        BW<='1' when (State="0010") else '0';
        DW<='1' when (State="1000") else '0';
        ReW<='1' when ((State="0100") or (State="0011")or (State="0101")) else '0';

        PW<='1' when ((State="0001")or ((State="0101")and cond='1')) else '0';
        MW<='1' when (State="0111") else '0';
        RW<='1' when ((State="0110") or (State="1001")) else '0';
        M2R<='1' when (State="1001") else '0';
        IorD<='1' when ((State="0111") or (State="1000")) else '0';
        ASrc1<='1' when ((State="0010") or (State="0011")) else '0';
        ASrc2<="01" when (State="0001")  else  "10" when (State="0010")  else "11" when (State="0101")  else "00";
        F_set<= '1' when ((State="0011")and (DP_subclass="101")) else '0';
        opc<= "0100" when (State="0001") else "0100" when ((State="0101") and offset_sign='1') else "0010" when (State="0101") else operation;
    end process;

    
end bech;

-- ====================
-- Register-32-bit
-- ====================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY register32 IS PORT(
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END register32;

ARCHITECTURE description OF register32 IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= "00000000000000000000000000000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;


--#############################################################################
-- OTHER LOGICAL COMPONENTS
-- ############################################################################

-- =======================
-- Multiplexer 32 bit
-- =======================

-- 1. Mux 4 to 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity mux32bit4to1 is
    port(
        inp0: in std_logic_vector(31 downto 0);
        inp1: in std_logic_vector(31 downto 0);
        inp2: in std_logic_vector(31 downto 0);
        inp3: in std_logic_vector(31 downto 0);
        triger: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
    end mux32bit4to1;

architecture bech of mux32bit4to1 is
begin
    with triger select output<= inp0 when "00",
                                inp1 when "01",
                                inp2 when "10",
                                inp3 when others;
end bech;

-- 2. Mux 2 to 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity mux32bit2to1 is
    port(
        inp0: in std_logic_vector(31 downto 0);
        inp1: in std_logic_vector(31 downto 0);
        triger: in std_logic;
        output: out std_logic_vector(31 downto 0);
    );
    end mux32bit2to1;

architecture bech of mux32bit2to1  is
begin

    with triger select output<= inp0 when '0',
                                inp1 when others;
end bech;

-- =======================
-- Multiplexer 4 bit
-- =======================

-- Mux 2 to 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity mux4bit2to1 is
    port(
        inp0: in std_logic_vector(3 downto 0);
        inp1: in std_logic_vector(3 downto 0);
        triger: in std_logic;
        output: out std_logic_vector(3 downto 0);
    );
    end mux4bit2to1;

architecture bech of mux4bit2to1  is
begin
    with triger select output<= inp0 when '0',
                                inp1 when others;
end bech;

-- ===============
-- Sign Extension
-- ===============

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity s2 is
    port(
        input: in std_logic_vector(23 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
    end s2;

architecture bech of s2 is
begin
    with input(23) select output<= ("11111111" & input) when '1' ,
                                   ("00000000"& input) when others;
end bech;

-- ====================
-- Extention
-- ====================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity ex is
    port(
        input: in std_logic_vector(11 downto 0);
        output: out std_logic_vector(31 downto 0);
    );
    end ex;

architecture bech of ex is
begin
    output<=("00000000000000000000"&input);
end bech;
 



