library ieee;
use ieee.std_logic_1164.all;

entity DecoderFunct is
  port ( funct : in std_logic_vector(5 downto 0);
         operacaoFunct : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of DecoderFunct is

  constant funct_add : std_logic_vector(5 downto 0) := "100000";
  constant funct_sub : std_logic_vector(5 downto 0) := "100010";
  constant funct_and : std_logic_vector(5 downto 0) := "100100";
  constant funct_or : std_logic_vector(5 downto 0) := "100101";
  constant funct_slt : std_logic_vector(5 downto 0) := "101010";

  

  begin
  -- seletor da operação = "1" quando soma e "0" quando subtração
  -- soma quando:
  	-- tipoR = "0" e opcode = lw
	-- tipoR = "0" e opcode = sw
	-- tipoR = "1" e funct = add
  -- subtracao quando:
	-- tipoR = "0" e opcode = beq
	-- tipoR = "1" e funct = sub

  
  operacaoFunct <= "010" when funct = funct_add else
						  "110" when funct = funct_sub else
						  "000" when funct = funct_and else
						  "001" when funct = funct_or else
						  "111" when funct = funct_slt else
						  "000";
  
			  
end architecture;