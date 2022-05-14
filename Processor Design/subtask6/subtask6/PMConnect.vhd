library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PMConnect is
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
end PMConnect;

architecture Behavioral of PMConnect is

begin
   

    MW(3 downto 0)<="1111" when (((Instruction(27 downto 26)="01") and (Instruction(22)='0') and (Instruction(20)='0'))and (Adr1_0="00") and (Controlstate='1')) else
                     "0011" when (((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1'))and Adr1_0="00"and Controlstate='1') else
                     "1100" when (((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='0'))and Adr1_0="10"and Controlstate='1') else
                     "0001" when (((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0'))and Adr1_0="00"and Controlstate='1') else
                     "0010" when (((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0'))and Adr1_0="01"and Controlstate='1') else
                     "0100" when (((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0'))and Adr1_0="10"and Controlstate='1') else
                     "1000" when (((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0'))and Adr1_0="11"and Controlstate='1') else
                     "0000";
                     
     Min(7 downto 0)<=Rout(7 downto 0);
    Min(15 downto 8)<= Rout(15 downto 8) when ((((Instruction(27 downto 26)="01") and (Instruction(22)='0'))or ((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')))and (Instruction(20)='0')) else
                       Rout(7 downto 0) when ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0')) else
                       "00000000";
    Min(23 downto 16)<= Rout(23 downto 16) when  ((Instruction(27 downto 26)="01") and (Instruction(22)='0') and (Instruction(20)='0')) else
                       Rout(7 downto 0) when ((((Instruction(27 downto 26)="01") and (Instruction(22)='1'))or ((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')))and (Instruction(20)='0')) else
                       "00000000";
    Min(31 downto 24)<= Rout(31 downto 24) when  ((Instruction(27 downto 26)="01") and (Instruction(22)='0') and (Instruction(20)='0')) else
                       Rout(15 downto 8) when  ((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='0')) else
                       Rout(7 downto 0) when ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='0')) else
                       "00000000";
                     
    Rin<= Mout when (Adr1_0="00") and ((Instruction(27 downto 26)="01") and (Instruction(22)='0') and (Instruction(20)='1')) else
          "00000000"&"00000000"& Mout(15 downto 0) when (Adr1_0="00") and ((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          "00000000"&"00000000"& Mout(31 downto 16) when (Adr1_0="10") and ((Instruction(6 downto 5)="01")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)&  Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15 downto 0) when (Adr1_0="00") and ((Instruction(6 downto 5)="11")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)&  Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31 downto 16) when (Adr1_0="10") and ((Instruction(6 downto 5)="11")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          "00000000"&"00000000"&"00000000"& Mout(7 downto 0) when (Adr1_0="00") and ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='1')) else
          "00000000"&"00000000"&"00000000"& Mout(15 downto 8) when (Adr1_0="01") and ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='1')) else
          "00000000"&"00000000"&"00000000"& Mout(23 downto 16) when (Adr1_0="10") and ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='1')) else
          "00000000"&"00000000"&"00000000"& Mout(31 downto 24) when (Adr1_0="11") and ((Instruction(27 downto 26)="01") and (Instruction(22)='1') and (Instruction(20)='1')) else
          Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)&  Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7)& Mout(7 downto 0) when (Adr1_0="00") and ((Instruction(6 downto 5)="10")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)&  Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15)& Mout(15 downto 8) when (Adr1_0="01") and ((Instruction(6 downto 5)="10")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          Mout(23)& Mout(23)& Mout(23)& Mout(23)&Mout(23)& Mout(23)& Mout(23)& Mout(23)&Mout(23)& Mout(23)& Mout(23)& Mout(23)&Mout(23)& Mout(23)& Mout(23)& Mout(23)&Mout(23)& Mout(23)& Mout(23)& Mout(23)&Mout(23)& Mout(23)& Mout(23)& Mout(23)& Mout(23 downto 16) when (Adr1_0="10") and ((Instruction(6 downto 5)="10")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else 
          Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31)& Mout(31 downto 24) when (Adr1_0="11") and ((Instruction(6 downto 5)="10")and (Instruction(27 downto 25)="000")and (Instruction(4)='1') and(Instruction(7)='1')and (Instruction(20)='1')) else
          "00000000000000000000000000000000"; 
end Behavioral;

