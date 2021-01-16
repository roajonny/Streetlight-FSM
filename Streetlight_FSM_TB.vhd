----------------------------------------------------------------------------------
-- Engineer: Jonathan Roa
-- Create Date: 01/15/2021 09:06:17 PM
-- Module Name: Streetlight_FSM_TB - Behavioral
-- Project Name: 
-- Target Devices: Zynq-7020
-- Description: 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Streetlight_FSM_TB is
--  Port ( );
end Streetlight_FSM_TB;

architecture Behavioral of Streetlight_FSM_TB is

component Streetlight_FSM is
    Port (clk : in STD_LOGIC;
          rst : in STD_LOGIC;
           L1 : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           L2 : out STD_LOGIC_VECTOR(2 DOWNTO 0));
end component;

signal clk_tst, rst_tst : STD_LOGIC;
signal L1_tst, L2_tst : STD_LOGIC_VECTOR (2 DOWNTO 0);
constant cp : time := 10ns;

begin
UUT : Streetlight_FSM
port map (clk => clk_tst, rst => rst_tst, L1 => L1_tst, L2 => L2_tst);

RESET : process
begin
    rst_tst <= '1';
        wait for cp;
    rst_tst <= '0';
        wait;
end process RESET;

CLOCK : process
begin 
    clk_tst <= '1';
        wait for cp/2;
    clk_tst <= '0';
        wait for cp/2;
end process CLOCK;
        
end Behavioral;
