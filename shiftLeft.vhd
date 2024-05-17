library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  --Soma (esta biblioteca =ieee)

entity shiftLeft is
    generic
    (
        larguraDados : natural := 32
    );
    port
    (
        entrada: in  STD_LOGIC_VECTOR((larguraDados-1) downto 0);
        saida:   out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
    );
end entity;

architecture comportamento of shiftLeft is
    begin
        saida <= entrada((larguraDados-3) downto 0) & "00";
end architecture;