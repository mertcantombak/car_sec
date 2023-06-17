----------------------------------------------------------------------------------
-- Company: Marmara Univercity
-- Engineer: Mertcan TOMBAK, Fatih Mehmed BILGIN
-- 
-- Create Date: 06/02/2022 08:59:58 PM
-- Design Name: 
-- Module Name: CAR_SEC - Behavioral
-- Project Name: Car Security Alarm
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAR_SEC is
    Port (CLK: in std_logic;
          ABC: in std_logic_vector(2 downto 0);
          alarm: out std_logic);
end CAR_SEC;

architecture Behavioral of CAR_SEC is
    type type_sreg is (STATE0, STATE1);
    signal sreg, nex_sreg : type_sreg;
begin

process(CLK)
begin
    if(CLK = '0' and CLK'EVENT) then 
    case sreg is
    --State 0 to 1
    when STATE0 =>
    alarm <= '0';
    if(ABC = "101") then
        sreg <= STATE1;
    end if;
    if(ABC = "110") then
        sreg <= STATE1;
    end if;
    if(ABC = "111") then
        sreg <= STATE1;
    end if;
    --State 1 to 0
    when STATE1 =>
    alarm <= '1';
    if(ABC = "000") then
        sreg <= STATE0;
    end if;
    if(ABC = "001") then
        sreg <= STATE0;
    end if;
    if(ABC = "010") then
        sreg <= STATE0;
    end if;
    if(ABC = "011") then
        sreg <= STATE0;
    end if;
    
    end case;    
    end if;
end process;

end Behavioral;
