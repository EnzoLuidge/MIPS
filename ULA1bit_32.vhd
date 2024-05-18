library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA1bit_32 is
    generic ( larguraDados : natural := 1 );
    port (
      entradaA, entradaB:  in STD_LOGIC;
      selecao:  in STD_LOGIC_VECTOR(1 downto 0);
		inverteB:  in STD_LOGIC;
		Cin : in std_logic;
		SLT: in STD_LOGIC;
		Resultado: out STD_LOGIC;
		Overflow: out std_logic
    );
end entity;

architecture comportamento of ULA1bit_32 is

signal Not_Mux2x1 : STD_LOGIC;
signal SaidaMux2x1 : STD_LOGIC;
signal And_Mux4x1 : STD_LOGIC;
signal Or_Mux4x1 : STD_LOGIC;
signal Soma_Mux4x1 : STD_LOGIC;
signal Cout : std_logic;
   

	
begin



-- MUX2x1
MUX2x1 : entity work.muxGenerico2x1bit generic map (larguraDados => larguraDados)
			port map(entradaA_MUX => entradaB,
						entradaB_MUX => Not_Mux2x1,
						seletor_MUX => inverteB,
						saida_MUX => SaidaMux2x1);
						
-- MUX4X1
MUX4X1 : entity work.muxGenerico4x1bit generic map (larguraDados => larguraDados)
			port map(entradaA_MUX => And_Mux4x1,
						entradaB_MUX => Or_Mux4x1,
						entradaC_MUX => Soma_Mux4x1,
						entradaD_MUX => SLT,
						seletor_MUX => selecao,
						saida_MUX => Resultado);
						
-- SOMADOR
SOMADOR : entity work.Somador1bit generic map (larguraDados => larguraDados)
			port map(A => entradaA,
						B => SaidaMux2x1,
						Cin => Cin,
						Cout => Cout,
						Soma => Soma_Mux4x1);


Not_Mux2x1 <= not(entradaB);
And_Mux4x1 <= entradaA and SaidaMux2x1;
Or_Mux4x1 <= entradaA or SaidaMux2x1;
Overflow <= Soma_Mux4x1 xor (Cin xor Cout);

      

end architecture;