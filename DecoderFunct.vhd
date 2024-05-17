library ieee;
use ieee.std_logic_1164.all;

entity DecoderFunct is
  port ( funct : in std_logic_vector(5 downto 0);
         operacaoFunct : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of DecoderFunct is

  constant function_add : std_logic_vector(5 downto 0) := "100000";
  constant function_sub : std_logic_vector(5 downto 0) := "100010";
  constant function_and : std_logic_vector(5 downto 0) := "100100";
  constant function_or  : std_logic_vector(5 downto 0) := "100101";
  constant function_slt : std_logic_vector(5 downto 0) := "101010";

 begin
  -- seletor da operação = "1" quando soma e "0" quando subtração
  -- soma quando:
  	-- tipoR = "0" e opcode = lw
	-- tipoR = "0" e opcode = sw
	-- tipoR = "1" e funct = add
  -- subtracao quando:
	-- tipoR = "0" e opcode = beq
	-- tipoR = "1" e funct = sub

  
  operacaoFunct <= "010" when funct = function_add else
						  "110" when funct = function_sub else
						  "000" when funct = function_and else
						  "001" when funct = function_or else
						  "111" when funct = function_slt else
						  "000";
  
			  
end architecture;