library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControleULA is
  port ( opcode : in std_logic_vector(5 downto 0);
			tipoR : in std_logic;
			funct : in std_logic_vector(5 downto 0);
         operacao : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of UnidadeControleULA is

signal saidaOpcode : std_logic_vector (2 downto 0);
signal saidaFunct : std_logic_vector (2 downto 0);
  

begin
 
OPCODECODER : entity work.DecoderOpcode
			port map (opcode => opcode,
						operacaoOpcode => saidaOpcode);

						
FUNCTDECODER : entity work.DecoderFunct
			port map (funct => funct,
						operacaoFunct => saidaFunct);

						
MUXGEN : entity work.muxGenerico2x1 generic map (larguraDados => 3)
			port map(entradaA_MUX => saidaOpcode,
						entradaB_MUX => saidaFunct,
						seletor_MUX => tipoR,
						saida_MUX => operacao);
  
			  
end architecture;