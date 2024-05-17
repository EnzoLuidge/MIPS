library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULASomaSub is
    generic ( larguraDados : natural := 32);
    port (
      entradaA, entradaB: in STD_LOGIC_VECTOR(larguraDados-1 downto 0);
      seletor: in STD_LOGIC_VECTOR(1 downto 0);  -- Seletor de operação
      resultado: out STD_LOGIC_VECTOR(larguraDados-1 downto 0);
      overflow: out STD_LOGIC;  -- Indicação de overflow
      zero: out STD_LOGIC       -- Indicação se o resultado é zero
    );
end entity;

architecture comportamento of ULASomaSub is
   function POG_NOR(res: STD_LOGIC_VECTOR) return STD_LOGIC is
       variable nor_res: STD_LOGIC := '1';
   begin
       for i in res'range loop
           if res(i) = '1' then
               nor_res := '0';
               exit;
           end if;
       end loop;
       return nor_res;
   end function;

   signal entradaA_mod, entradaB_mod, resultado_temp: STD_LOGIC_VECTOR(larguraDados-1 downto 0);
   signal carry_in, overflow_int, slt_result: STD_LOGIC;
   signal carry_in_vector: UNSIGNED(larguraDados-1 downto 0);
begin
   -- Ajustando os sinais de entrada baseados no seletor
   entradaA_mod <= NOT entradaA when (seletor = "11") else entradaA;
   entradaB_mod <= NOT entradaB when (seletor = "10" or seletor = "11") else entradaB;
   carry_in <= '1' when (seletor = "10" or seletor = "11") else '0';
   carry_in_vector <= (others => carry_in);

   -- Realizando a soma ou subtração com o circuito de somador completo
   resultado_temp <= STD_LOGIC_VECTOR(unsigned(entradaA_mod) + unsigned(entradaB_mod) + carry_in_vector);

   -- Calculando o resultado SLT
   slt_result <= (entradaA(larguraDados-1) xor entradaB(larguraDados-1)) xor resultado_temp(larguraDados-1);

   -- Selecionando a operação com base no seletor
   with seletor select
   resultado <=
      entradaA and entradaB when "00",
      entradaA or entradaB when "01",
      resultado_temp when "10",
      (others => slt_result) when "11";  -- Resultado de SLT em todos os bits

   -- Definindo os sinais de overflow e zero
   overflow <= overflow_int;
   zero <= POG_NOR(resultado_temp);  -- Usando a função para calcular zero
end architecture;