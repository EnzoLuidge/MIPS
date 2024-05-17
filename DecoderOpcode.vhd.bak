library ieee;
use ieee.std_logic_1164.all;

entity DecoderOpcode is
  port ( opcode : in std_logic_vector(5 downto 0);
         operacaoOpcode : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of DecoderOpcode is

  constant lw  : std_logic_vector(5 downto 0) := "100011";
  constant sw  : std_logic_vector(5 downto 0) := "101011";
  constant beq : std_logic_vector(5 downto 0) := "000100";
  constant jmp : std_logic_vector(5 downto 0) := "000010";

  

  begin
  -- seletor da operação = "1" quando soma e "0" quando subtração
  -- soma quando:
  	-- tipoR = "0" e opcode = lw
	-- tipoR = "0" e opcode = sw
	-- tipoR = "1" e funct = add
  -- subtracao quando:
	-- tipoR = "0" e opcode = beq
	-- tipoR = "1" e funct = sub

  
  operacaoOpcode <= "010" when opcode = lw else
						  "010" when opcode = sw else 
						  "110" when opcode = beq else 
						  "000" when opcode = jmp else
						  "000";
  
			  
end architecture;