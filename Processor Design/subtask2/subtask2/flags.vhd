library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY flags IS PORT(
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
END flags;
ARCHITECTURE description OF flags IS

BEGIN
    process(clock, clr)
        variable S: std_logic;
        variable Zfs: std_logic;
        variable Cfs: std_logic;
        variable Vfs: std_logic;
        variable Nfs: std_logic;
    begin
        if result(31)="1" then
            S<='1';
        else
            S<=0;
        end if;
        Cfs<=alu_carry;
        Vfs<= (msb1 and msb2 and (not(S)))or ((not(msb1)) and (not(msb2)) and (S)));
        if result="00000000000000000000000000000000" then
            Zfs<='1';
        else
            Zfs<='0';
        end if;
        Nfs<=S;

        if clr = '1' then
            Cf<='0';
            Zf<='0';
            Nf<='0';
            Vf<='0';
        elsif rising_edge(clock) then
            if Instrtype="00" then
                if Sbit='0' then
                    case operation is
                        when "1010"=>
                            Cf<=Cfs;
                            Zf<=Zfs;
                            Nf<=Nfs;
                            Vf<=Vfs;
                        when "1011"=>
                            Cf<=Cfs;
                            Zf<=Zfs;
                            Nf<=Nfs;
                            Vf<=Vfs;
                        when "1000" =>
                            Zf<=Zfs;
                            Nf<=Nfs;
                        when "1001"=> 
                            Zf<=Zfs;
                            Nf<=Nfs;
                            
                        when others=>
                    end case;
                end if;
                if Sbit='1' then
                    if shift='1' then
                        case operation is
                            when "0100"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0010"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0011"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0101"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0110"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0111"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "1010"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "1011"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0000"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Cf<=Cfs;
                            when "1100"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "0001"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1110"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1101"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1111"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1000"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Cf<=Cfs;
                            when "1001"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Cf<=Cfs;
                            when others=>
                        end case;
                    end if;
                    if shift='0' then 
                        case operation is
                            when "0100"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0010"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0011"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0101"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0110"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0111"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "1010"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "1011"=>
                                Cf<=Cfs;
                                Zf<=Zfs;
                                Nf<=Nfs;
                                Vf<=Vfs;
                            when "0000"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1100" =>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when  "0001"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1110" =>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when  "1101"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when  "1111"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when "1000" =>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when  "1001"=>
                                Zf<=Zfs;
                                Nf<=Nfs;
                            when others=>
                        end case;
                    end if;
                end if;
            end if;
        end if;
    end process;
END description;




