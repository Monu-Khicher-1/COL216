library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu is
    port(
        operation : in std_logic_vector(3 downto 0);
        op1: in std_logic_vector(31 downto 0);
        op2: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        result: out std_logic_vector(31 downto 0);
    );
    end alu;

architecture alu of alu is
begin
    process(operation,op1,op2,cin)
        variable temp:std_logic_vector(32 downto 0);
        variable rslt:std_logic_vector(31 downto 0);
        variable cvf:std_logic;
        variable carry:std_logic_vector(32 downto 0);
    begin
        cout<='0';
        temp:="000000000000000000000000000000000";
        carry:="000000000000000000000000000000000";
        cvf:='0';
        
        if(cin='1') then
              carry:="000000000000000000000000000000001";
        end if;
        case operation is
            when "0000"=>     -- op1 and op2
                rslt:=op1 and op2;
            when "0001" =>    -- op1 eor op2
                rslt := op1 xor op2;
            when "0010"=>    -- op1 + Not op2 +1
                temp:= ('0'& op1)+ ('0'& not(op2)) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "0011"=>    -- not op1 + op2 +1
                temp:= ('0'& not(op1))+ ('0'& op2) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "0100"=>    -- op1 + op2 
                temp:= ('0'& op1)+ ('0'& op2);
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "0101"=>    -- op1 +  op2 +c
                temp:= ('0'& op1)+ ('0'& op2) + carry;
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "0110"=>    -- op1 + Not op2 +c
                temp:= ('0'& op1)+ ('0'& not(op2)) +carry;
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "0111"=>    -- Not op1 + op2 +c
                temp:= ('0'& not(op1))+ ('0'& op2) +carry;
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "1000"=>    -- op1 and op2 
                rslt:= op1 and op2 ;
                
            when "1001"=>    -- op1 eor op2 
                rslt := op1 xor op2;
            when "1010"=>    -- op1 + Not op2 +1
                temp:= ('0'& op1)+ ('0'& not(op2)) + "000000000000000000000000000000001";
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "1011"=>    -- op1 +  op2 
                temp:= ('0'& op1)+ ('0'& op2);
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "1100"=>    -- op1 or op2 
                rslt:=op1 or op2;
            when "1101"=>    -- op2 
                rslt:=op2;
            when "1110"=>    -- op1 + Not op2 
                temp:= ('0'& op1)+('0'& not(op2));
                rslt:= temp(31 downto 0);
                cvf :=temp(32);
                cout<=cvf;
            when "1111"=>    --  Not op2 
                 rslt:= not(op2);
            when others =>
                 rslt := op1;
        end case;
        result<=rslt;
    end process;
end alu;