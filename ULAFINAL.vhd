library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULAFINAL is
    generic ( larguraDados : natural := 32 );
    port (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR (2 downto 0);
		zero: out STD_LOGIC;
      result:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
    );
end entity;

architecture comportamento of ULAFINAL is

   signal C0_1 :      STD_LOGIC;
   signal C1_2 :      STD_LOGIC;
	signal C2_3 :      STD_LOGIC;
	signal C3_4 :      STD_LOGIC;
	signal C4_5 :      STD_LOGIC;
	signal C5_6 :      STD_LOGIC;
	signal C6_7 :      STD_LOGIC;
	signal C7_8 :      STD_LOGIC;
	signal C8_9 :      STD_LOGIC;
   signal C9_10 :      STD_LOGIC;
	signal C10_11 :      STD_LOGIC;
	signal C11_12 :      STD_LOGIC;
	signal C12_13 :      STD_LOGIC;
	signal C13_14 :      STD_LOGIC;
	signal C14_15 :      STD_LOGIC;
	signal C15_16 :      STD_LOGIC;
	signal C16_17 :      STD_LOGIC;
   signal C17_18 :      STD_LOGIC;
	signal C18_19 :      STD_LOGIC;
	signal C19_20 :      STD_LOGIC;
	signal C20_21 :      STD_LOGIC;
	signal C21_22 :      STD_LOGIC;
	signal C22_23 :      STD_LOGIC;
	signal C23_24 :      STD_LOGIC;
	signal C24_25 :      STD_LOGIC;
   signal C25_26 :      STD_LOGIC;
	signal C26_27 :      STD_LOGIC;
	signal C27_28 :      STD_LOGIC;
	signal C28_29 :      STD_LOGIC;
	signal C29_30 :      STD_LOGIC;
	signal C30_31 :      STD_LOGIC;
	signal C31_32 :      STD_LOGIC;
	
	
	signal resultado: std_logic_vector(31 downto 0);
	
	signal saidaOverflow: std_logic;
	
	signal selecao: std_logic_vector (1 downto 0);
	
	signal inverteB: std_logic;
	
begin
	inverteB <= seletor(2);
	selecao <= seletor(1 downto 0);
-- ULA1BIT_0
ULA1BIT_0 : entity work.ULA1bit generic map (larguraDados => larguraDados)
				port map(entradaA => entradaA(0),
							entradaB =>entradaB(0),
							selecao => selecao,
							inverteB => inverteB,
							Cin => inverteB,
							SLT => saidaOverflow,
							Resultado => resultado(0),
							Cout => C0_1);
							
-- ULA1BIT_1
ULA1BIT_1 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(1),
                                                 entradaB =>entradaB(1),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C0_1,
                                                 SLT => '0',
                                                 Resultado => resultado(1),
                                                 Cout => C1_2);
    

-- ULA1BIT_2
ULA1BIT_2 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(2),
                                                 entradaB =>entradaB(2),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C1_2,
                                                 SLT => '0',
                                                 Resultado => resultado(2),
                                                 Cout => C2_3);


-- ULA1BIT_3
ULA1BIT_3 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(3),
                                                 entradaB =>entradaB(3),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C2_3,
                                                 SLT => '0',
                                                 Resultado => resultado(3),
                                                 Cout => C3_4);


-- ULA1BIT_4
ULA1BIT_4 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(4),
                                                 entradaB =>entradaB(4),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C3_4,
                                                 SLT => '0',
                                                 Resultado => resultado(4),
                                                 Cout => C4_5);


-- ULA1BIT_5
ULA1BIT_5 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(5),
                                                 entradaB =>entradaB(5),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C4_5,
                                                 SLT => '0',
                                                 Resultado => resultado(5),
                                                 Cout => C5_6);


-- ULA1BIT_6
ULA1BIT_6 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(6),
                                                 entradaB =>entradaB(6),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C5_6,
                                                 SLT => '0',
                                                 Resultado => resultado(6),
                                                 Cout => C6_7);


-- ULA1BIT_7
ULA1BIT_7 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(7),
                                                 entradaB =>entradaB(7),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C6_7,
                                                 SLT => '0',
                                                 Resultado => resultado(7),
                                                 Cout => C7_8);


-- ULA1BIT_8
ULA1BIT_8 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(8),
                                                 entradaB =>entradaB(8),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C7_8,
                                                 SLT => '0',
                                                 Resultado => resultado(8),
                                                 Cout => C8_9);


-- ULA1BIT_9
ULA1BIT_9 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(9),
                                                 entradaB =>entradaB(9),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C8_9,
                                                 SLT => '0',
                                                 Resultado => resultado(9),
                                                 Cout => C9_10);


-- ULA1BIT_10
ULA1BIT_10 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(10),
                                                 entradaB =>entradaB(10),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C9_10,
                                                 SLT => '0',
                                                 Resultado => resultado(10),
                                                 Cout => C10_11);


-- ULA1BIT_11
ULA1BIT_11 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(11),
                                                 entradaB =>entradaB(11),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C10_11,
                                                 SLT => '0',
                                                 Resultado => resultado(11),
                                                 Cout => C11_12);


-- ULA1BIT_12
ULA1BIT_12 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(12),
                                                 entradaB =>entradaB(12),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C11_12,
                                                 SLT => '0',
                                                 Resultado => resultado(12),
                                                 Cout => C12_13);


-- ULA1BIT_13
ULA1BIT_13 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(13),
                                                 entradaB =>entradaB(13),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C12_13,
                                                 SLT => '0',
                                                 Resultado => resultado(13),
                                                 Cout => C13_14);


-- ULA1BIT_14
ULA1BIT_14 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(14),
                                                 entradaB =>entradaB(14),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C13_14,
                                                 SLT => '0',
                                                 Resultado => resultado(14),
                                                 Cout => C14_15);


-- ULA1BIT_15
ULA1BIT_15 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(15),
                                                 entradaB =>entradaB(15),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C14_15,
                                                 SLT => '0',
                                                 Resultado => resultado(15),
                                                 Cout => C15_16);


-- ULA1BIT_16
ULA1BIT_16 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(16),
                                                 entradaB =>entradaB(16),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C15_16,
                                                 SLT => '0',
                                                 Resultado => resultado(16),
                                                 Cout => C16_17);


-- ULA1BIT_17
ULA1BIT_17 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(17),
                                                 entradaB =>entradaB(17),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C16_17,
                                                 SLT => '0',
                                                 Resultado => resultado(17),
                                                 Cout => C17_18);


-- ULA1BIT_18
ULA1BIT_18 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(18),
                                                 entradaB =>entradaB(18),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C17_18,
                                                 SLT => '0',
                                                 Resultado => resultado(18),
                                                 Cout => C18_19);


-- ULA1BIT_19
ULA1BIT_19 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(19),
                                                 entradaB =>entradaB(19),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C18_19,
                                                 SLT => '0',
                                                 Resultado => resultado(19),
                                                 Cout => C19_20);


-- ULA1BIT_20
ULA1BIT_20 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(20),
                                                 entradaB =>entradaB(20),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C19_20,
                                                 SLT => '0',
                                                 Resultado => resultado(20),
                                                 Cout => C20_21);


-- ULA1BIT_21
ULA1BIT_21 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(21),
                                                 entradaB =>entradaB(21),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C20_21,
                                                 SLT => '0',
                                                 Resultado => resultado(21),
                                                 Cout => C21_22);


-- ULA1BIT_22
ULA1BIT_22 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(22),
                                                 entradaB =>entradaB(22),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C21_22,
                                                 SLT => '0',
                                                 Resultado => resultado(22),
                                                 Cout => C22_23);


-- ULA1BIT_23
ULA1BIT_23 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(23),
                                                 entradaB =>entradaB(23),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C22_23,
                                                 SLT => '0',
                                                 Resultado => resultado(23),
                                                 Cout => C23_24);


-- ULA1BIT_24
ULA1BIT_24 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(24),
                                                 entradaB =>entradaB(24),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C23_24,
                                                 SLT => '0',
                                                 Resultado => resultado(24),
                                                 Cout => C24_25);


-- ULA1BIT_25
ULA1BIT_25 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(25),
                                                 entradaB =>entradaB(25),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C24_25,
                                                 SLT => '0',
                                                 Resultado => resultado(25),
                                                 Cout => C25_26);


-- ULA1BIT_26
ULA1BIT_26 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(26),
                                                 entradaB =>entradaB(26),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C25_26,
                                                 SLT => '0',
                                                 Resultado => resultado(26),
                                                 Cout => C26_27);


-- ULA1BIT_27
ULA1BIT_27 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(27),
                                                 entradaB =>entradaB(27),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C26_27,
                                                 SLT => '0',
                                                 Resultado => resultado(27),
                                                 Cout => C27_28);


-- ULA1BIT_28
ULA1BIT_28 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(28),
                                                 entradaB =>entradaB(28),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C27_28,
                                                 SLT => '0',
                                                 Resultado => resultado(28),
                                                 Cout => C28_29);


-- ULA1BIT_29
ULA1BIT_29 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(29),
                                                 entradaB =>entradaB(29),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C28_29,
                                                 SLT => '0',
                                                 Resultado => resultado(29),
                                                 Cout => C29_30);


-- ULA1BIT_30
ULA1BIT_30 : entity work.ULA1bit generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(30),
                                                 entradaB =>entradaB(30),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C29_30,
                                                 SLT => '0',
                                                 Resultado => resultado(30),
                                                 Cout => C30_31);


-- ULA1BIT_31
ULA1BIT_31 : entity work.ULA1bit_32 generic map (larguraDados => larguraDados)
                                port map(entradaA => entradaA(31),
                                                 entradaB =>entradaB(31),
                                                 selecao => selecao,
                                                 inverteB => inverteB,
                                                 Cin => C30_31,
                                                 SLT => '0',
                                                 Resultado => resultado(31),
                                                 Overflow => saidaOverflow);
      
zero <= not(resultado(31) or resultado(30)or resultado(29)or resultado(28)or resultado(27)or resultado(26)or resultado(25)or resultado(24)or resultado(23)or resultado(22)or resultado(21)or resultado(20)or resultado(19)or resultado(18)or resultado(17)or resultado(16)or resultado(15)or resultado(14)or resultado(13)or resultado(12)or resultado(11)or resultado(10)or resultado(9)or resultado(8)or resultado(7)or resultado(6)or resultado(5)or resultado(4)or resultado(3)or resultado(2)or resultado(1)or resultado(0)) ;
result <= resultado;

end architecture;	