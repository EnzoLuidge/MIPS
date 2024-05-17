library ieee;
use ieee.std_logic_1164.all;

entity Somador1bit is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
    A, B : in std_logic;
	 Cin : in std_logic;
    Soma : out std_logic;
    Cout : out std_logic
  );
end entity;

architecture comportamento of Somador1bit is
  begin
  
Soma <= Cin xor (A xor B);
Cout <= (A and B) or (Cin and (A xor B));
    
end architecture;