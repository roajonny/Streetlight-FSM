----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2021 06:14:52 PM
-- Design Name: 
-- Module Name: Streetlight_FSM - Behavioral
-- Project Name: 
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

entity Streetlight_FSM is
    Port (clk : in STD_LOGIC;
          rst : in STD_LOGIC;
           L1 : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           L2 : out STD_LOGIC_VECTOR(2 DOWNTO 0));
end Streetlight_FSM;

architecture Behavioral of Streetlight_FSM is
    type StateType is (S0, S1, S2, S3, S4, S5);
    signal CurrentState, NextState : StateType;
begin

-- next state logic
process (CurrentState, clk)
begin
    case CurrentState is
        when (S0) =>
            NextState <= S1;
        when (S1) =>
            NextState <= S2;
        when (S2) =>
            NextState <= S3;
        when (S3) =>
            NextState <= S4;
        when (S4) =>
            NextState <= S5;
        when (S5) => 
            NextState <= S0;
    end case;
end process;
  
-- current state logic   
process (rst, clk, CurrentState)
begin
    if (rst = '1') then
        CurrentState <= S0;
    elsif (rising_edge(clk)) then
        CurrentState <= NextState;
    end if;
end process;      

-- output logic
with CurrentState select
L1 <= "100" when S0,
      "100" when S1,
      "100" when S2,
      "001" when S3,
      "010" when S4,
      "100" when others;
      
with CurrentState select
L2 <= "001" when S0,
      "010" when S1,
      "100" when S2,
      "100" when S3,
      "100" when S4,
      "100" when others;

end Behavioral;
