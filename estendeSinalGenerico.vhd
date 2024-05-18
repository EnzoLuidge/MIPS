library ieee;
use ieee.std_logic_1164.all;

-- Unidade responsável por extender um dado, para que ele seja corretamente operado
entity estendeSinalGenerico is
    generic
    (
        larguraDadoEntrada : natural := 8;
        larguraDadoSaida : natural := 8
    );
    port
    (
        -- Input ports
        estendeSinal_IN : in std_logic_vector(larguraDadoEntrada-1 downto 0);
        seletor : in std_logic;
        -- Output ports
        estendeSinal_OUT : out std_logic_vector(larguraDadoSaida-1 downto 0)
    );
end entity;

architecture comportamento of estendeSinalGenerico is
begin
    process(estendeSinal_IN, seletor)
    begin
        if seletor = '1' then
            estendeSinal_OUT <= (larguraDadoSaida - larguraDadoEntrada - 1 downto 0 => '0') & estendeSinal_IN;
        else
            estendeSinal_OUT <= (larguraDadoSaida - larguraDadoEntrada - 1 downto 0 => estendeSinal_IN(larguraDadoEntrada - 1)) & estendeSinal_IN;
        end if;
    end process;
end architecture comportamento;
