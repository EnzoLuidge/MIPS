library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( entrada_opcode : in std_logic_vector(5 downto 0);
			funct : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(25 downto 0)
			
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
  
  
  
  CONSTANT SLTI : std_logic_vector(5 downto 0) := "001010";
  constant bne : std_logic_vector(5 downto 0) := "000101";
  constant jal : std_logic_vector(5 downto 0) := "000011";
  
  
  --TIPO R 
  constant OP_R : std_logic_vector(5 downto 0) := "000000"; 
  --functs tipo R
  constant SLT : std_logic_vector(5 downto 0) := "101010";
  constant ANDz : std_logic_vector(5 downto 0) := "100100";
  constant ADD : std_logic_vector(5 downto 0) := "100000";
  constant JR   : std_logic_vector(5 downto 0) := "001000"; 
  constant ORz : std_logic_vector(5 downto 0) := "100101";
  constant SUB : std_logic_vector(5 downto 0) := "100010";
  
  
begin
--precisa arrumar ula ram
	saida <=
				"0" & "0" & funct & entrada_opcode & "000000000001" when entrada_opcode = SW else
				"0" & "0" & funct & entrada_opcode & "000110100010" when entrada_opcode = LW else
				"0" & "0" & funct & entrada_opcode & "000000001000" when entrada_opcode = BEQ else
				"0" & "1" & funct & entrada_opcode & "000000000000" when entrada_opcode = JMP else
				"0" & "0" & funct & entrada_opcode & "011101000000" when entrada_opcode = OP_R and funct = ANDz else
				"0" & "0" & funct & entrada_opcode & "011101000000" when entrada_opcode = OP_R and funct = ORz else
				"0" & "0" & funct & entrada_opcode & "010101000000" when entrada_opcode = OP_R and funct = ADD else
				"0" & "0" & funct & entrada_opcode & "010101000000" when entrada_opcode = OP_R and funct = SUB else
				"0" & "0" & funct & entrada_opcode & "010101000000" when entrada_opcode = OP_R and funct = SLT else
				"0" & "0" & funct & entrada_opcode & "000010110000" when entrada_opcode = LUI else
				"0" & "1" & funct & entrada_opcode & "100100100000" when entrada_opcode = JAL else
				"0" & "0" & funct & entrada_opcode & "001110000000" when entrada_opcode = ORI else
				"0" & "0" & funct & entrada_opcode & "000110000000" when entrada_opcode = ADDI else
				"0" & "0" & funct & entrada_opcode & "001110000000" when entrada_opcode = ANDI else
				"0" & "0" & funct & entrada_opcode & "000110000000" when entrada_opcode = SLTI else
				"0" & "0" & funct & entrada_opcode & "000000000100" when entrada_opcode = BNE else
				"1" & "0" & funct & entrada_opcode & "000001000000" when entrada_opcode = OP_R and funct = JR else
            "0" & "0" & funct & entrada_opcode & "000000000000";  -- NOP para os entradas Indefinidas
				
--ordem de bits:  muxJR,selMuxPc4JMP,funct,opcode, selMuxRtRd_1,selMuxRt_Rd_0,ORI_AND,habEscrita_Banco_Regs,selMuxRtImediato,tipoR, selMuxULARAM_1,selMuxULARAM_0, BEQ,BNE, habLeituraMEM, habEscritaMEM
end architecture;