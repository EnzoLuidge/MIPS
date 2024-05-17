library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( entrada_opcode : in std_logic_vector(5 downto 0);
			funct : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(18 downto 0)
			
  );
end entity;

architecture comportamento of decoderInstru is

  constant SW   : std_logic_vector(5 downto 0) := "101011";
  constant LW   : std_logic_vector(5 downto 0) := "100011";
  constant BEQ  : std_logic_vector(5 downto 0) := "000100";

  constant ADDI : std_logic_vector(5 downto 0) := "001000";
  constant ANDI : std_logic_vector(5 downto 0) := "001100";
  
  constant LUI : std_logic_vector(5 downto 0) := "001111";
  constant ORI  : std_logic_vector(5 downto 0) := "001101";
  
  constant JMP  : std_logic_vector(5 downto 0) := "000010";
  
  constant OP_R : std_logic_vector(5 downto 0) := "000000"; 
  
  CONSTANT SLTI : std_logic_vector(5 downto 0) := "001010";
  constant bne : std_logic_vector(5 downto 0) := "000101";
  constant jal : std_logic_vector(5 downto 0) := "000011";
  constant JR   : std_logic_vector(5 downto 0) := "001000";  -- Funct para JR no tipo R
  

begin

	saida <= "0" & entrada_opcode & "0" & "00100100"   when entrada_opcode = SW   else
				"0" & entrada_opcode & "0" & "01100011"   when entrada_opcode = LW   else
				"0" & entrada_opcode & "0" & "00001000"   when entrada_opcode = BEQ  else
				"0" & entrada_opcode & "0" & "011000001" when entrada_opcode = LUI else --feito
            -"0" & entrada_opcode & "0" & "0001100001" when entrada_opcode = ORI else
				"0" & entrada_opcode & "0" & "00100001" when entrada_opcode = ADDI else
				"0" & entrada_opcode & "0" & "00100001" when entrada_opcode = ANDI else
				"0" & entrada_opcode & "0" & "00100001" when entrada_opcode = SLTI else
				"0" & entrada_opcode & "0" & "00001000" when entrada_opcode = bne else
				"0" & entrada_opcode & "0" & "" when entrada_opcode = jal else
				"1" & entrada_opcode & "1" & "" when entrada_opcode = JR else
				"0" & entrada_opcode & "0" & "10000000"   when entrada_opcode = JMP  else
				"0" & entrada_opcode & "1" & "00010001" when entrada_opcode = OP_R else
				"0" & "000000" & "0" & "00000000";  -- NOP para os entradas Indefinidas
				
--ordem de bits: muxJR,opcode,tipoR,selMuxPc4JMP, selMuxULARAM_1,selMuxULARAM_0, selMuxRtImediato,ORI, selMuxRtRd, BEQ, habEscritaMEM, habLeituraMEM, habEscrita_Banco_Regs

end architecture;