library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROMMIPS IS
   generic (
          dataWidth: natural := 32;
          addrWidth: natural := 32;
       memoryAddrWidth:  natural := 6 );   -- 64 posicoes de 32 bits cada
   port (
          Endereco : in  std_logic_vector (addrWidth-1 downto 0);
          Dado     : out std_logic_vector (dataWidth-1 downto 0) );
end entity;

architecture assincrona OF ROMMIPS IS
  type blocoMemoria IS ARRAY(0 TO 2**memoryAddrWidth - 1) OF std_logic_vector(dataWidth-1 downto 0);
  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
        -- Inicializa os endereços:
		  tmp(0) := "00111100000010010000000000000000"; -- --lui $t1, 0x0000;
		  tmp(1) := "00110101001010010000000000001010"; -- --ori $t1, $t1, 0x0A  ($t1  := 0x0000000A)
		  tmp(2) := "00111100000010100000000000000000"; -- lui $t2, 0x0000;
		  tmp(3) := "00110101010010100000000000001011"; -- ori $t2, $t2, 0x0B;   ($t2  := 0x0000000B)
		  tmp(4) := "00111100000010110000000000000000"; -- lui $t3, 0x0000
		  tmp(5) := "00110101011010110000000000001100"; -- ori $t3, $t3, 0x0C;   ($t3  := 0x0000000C)
		  tmp(6) := "00111100000011000000000000000000"; -- lui $t4, 0x0000;
		  tmp(7) := "00110101100011000000000000001101"; -- ori $t4, $t4, 0x0D;   ($t4  := 0x0000000D)
		  tmp(8) := "00111100000011010000000000000000"; -- lui $t5, 0x0000;
		  tmp(9) := "00110101101011011000000000010110"; -- ori $t5, $t5, 0x8016;   ($t5  := 0x00008016)
        return tmp;
    end initMemory;
  signal memROM: blocoMemoria := initMemory;
 -- attribute ram_init_file : string;
 -- attribute ram_init_file of memROM:
 -- signal is "ROMcontent.mif";

-- Utiliza uma quantidade menor de endereços locais:
   signal EnderecoLocal : std_logic_vector(memoryAddrWidth-1 downto 0);

begin
  EnderecoLocal <= Endereco(memoryAddrWidth+1 downto 2);
  Dado <= memROM (to_integer(unsigned(EnderecoLocal)));
end architecture;