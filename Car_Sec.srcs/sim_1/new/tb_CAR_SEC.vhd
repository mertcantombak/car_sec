-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CAR_SEC_tb is
end;

architecture bench of CAR_SEC_tb is

  component CAR_SEC
      Port (CLK: in std_logic;
            ABC: in std_logic_vector(2 downto 0);
            alarm: out std_logic);
  end component;

  signal CLK: std_logic;
  signal ABC: std_logic_vector(2 downto 0);
  signal alarm: std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: CAR_SEC port map ( CLK   => CLK,
                          ABC   => ABC,
                          alarm => alarm );

  stimulus: process
  begin
  
    ABC <= "000"; wait for 20ns;
    ABC <= "001"; wait for 20ns;
    ABC <= "010"; wait for 20ns;
    ABC <= "011"; wait for 20ns;
    ABC <= "100"; wait for 20ns;
    ABC <= "101"; wait for 20ns;
    ABC <= "110"; wait for 20ns;
    ABC <= "111"; wait for 20ns;
    ABC <= "011"; wait for 20ns;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;