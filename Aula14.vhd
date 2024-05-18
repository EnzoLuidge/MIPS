	library ieee;
	use ieee.std_logic_1164.all;

	entity Aula14 is
	  -- Total de bits das entradas e saidas
	  generic ( larguraDados : natural := 32;
			  larguraEnderecos : natural := 9;
			  
			  simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
	  );
	  port   (
		 CLOCK_50, FPGA_RESET_N : in std_logic;
		 saida_pc2 : out std_logic_vector(31 downto 0);
		
		 SAIDA_ULA: out std_logic_vector(31 downto 0);
		 
		 
		 SW      : in  std_logic_vector(9 downto 0);
		 KEY      : in  std_logic_vector(3 downto 0);
		 HEX0,HEX1,HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0);
		 LEDR : out std_logic_vector(9 downto 0)
	  );
	end entity;


	architecture arquitetura of Aula14 is	
	  signal ROM_Address_signal : std_logic_vector (31 downto 0);
	  signal entrada_enable_mux: std_logic;
	  signal Dado : std_logic_vector (31 downto 0);
	  signal saida_dec: std_logic_vector(25 downto 0);
	  alias opcode : std_logic_vector(5 downto 0) is Dado(31 downto 26);
	  alias rs : std_logic_vector(4 downto 0) is Dado(25 downto 21);
	  alias imediato2: std_logic_vector(25 downto 0) is Dado(25 downto 0);
	  alias rt : std_logic_vector(4 downto 0) is Dado(20 downto 16);
	  alias rd : std_logic_vector(4 downto 0) is Dado(15 downto 11);
	  alias shamt : std_logic_vector(4 downto 0) is Dado(10 downto 6);
	  alias funct : std_logic_vector(5 downto 0) is Dado(5 downto 0);
	  alias imediato : std_logic_vector(15 downto 0) is Dado(15 downto 0);
	  
	  signal indica_overflow: std_logic;
	  signal saida_ram: std_logic_vector(31 downto 0);
	  signal CLK : std_logic;
	  signal entrada_pc : std_logic_vector(31 downto 0);
	  signal entrada_pc_mux : std_logic_vector(31 downto 0);
	  signal entrada_beq_pc: std_logic_vector(31 downto 0);
	  signal saida_incrementapc: std_logic_vector(31 downto 0);
	  
	  signal saida_pc : std_logic_vector(31 downto 0);
	 
	  signal saida_estende_sinal: std_logic_vector(31 downto 0);
	  
	  signal DadoLidoReg1: std_logic_vector(31 downto 0);
	  signal DadoLidoReg2: std_logic_vector(31 downto 0);
	  signal DadoEscritoReg3: std_logic_vector(31 downto 0);
	  
	  signal end_reg3: std_logic_vector(4 downto 0);
	  signal opcode_ou_funct: std_logic_vector(5 downto 0);
	  
	  signal entrada1_mux: std_logic_vector(31 downto 0);
	  signal entradab_ula : std_logic_vector(31 downto 0);
	  
	  signal saida_mux_ulamem: std_logic_vector(31 downto 0);
	  signal saida_ula2 : std_logic;
	  
	  signal shiftado : std_logic_vector(31 downto 0);
	  signal imediato2_shiftado: std_logic_vector(25 downto 0);
	  
	  signal seletorzada: std_logic_vector(2 downto 0);
	  
	  
	  signal displaySignal: std_logic_vector(31 downto 0);
	begin

	-- Instanciando os componentes:

	-- Para simular, fica mais simples tirar o edgeDetector
	
	--muxJR,selMuxPc4JMP,funct,opcode, selMuxRtRd_1,selMuxRt_Rd_0,ORI_AND,habEscrita_Banco_Regs,selMuxRtImediato,tipoR, selMuxULARAM_1,selMuxULARAM_0, BEQ,BNE, habLeituraMEM, habEscritaMEM


	--CLK <= CLOCK_50;
	
	detectorSub0: work.edgeDetector(bordaSubida) 
		port map (
			clk => CLOCK_50,
			entrada => (not KEY(0)),
			saida => CLK);
			
	PC : entity work.registradorGenerico   generic map (larguraDados => 32)
				 port map (DIN => entrada_pc_mux, DOUT => saida_pc, ENABLE => '1', CLK => CLK, RST => '0');
				 
	incrementaPC :  entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
			  port map( entrada => saida_pc, saida => saida_incrementapc);
			 
	somaconst2 :  entity work.somaConstante2  generic map (larguraDados => 32, constante => 4)
			  port map( entrada => saida_incrementapc, entrada2=>shiftado, saida => entrada1_mux);
			  
	MUX2 :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => saida_incrementapc,
						  entradaB_MUX =>  entrada1_mux,
						  seletor_MUX => (saida_dec(2) OR saida_dec(3) ) AND entrada_enable_mux, --definir
						  saida_MUX => entrada_beq_pc);
						  
	MUX_JR :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => entrada_pc,
						  entradaB_MUX =>  DadoLidoReg1,
						  seletor_MUX => saida_dec(25),
						  saida_MUX => entrada_pc_mux);
						  
	MUX_BEQS :  entity work.muxGenerico2x1bit generic map (larguraDados => 32)
			  port map( entradaA_MUX => not(saida_ula2),
						  entradaB_MUX =>  saida_ula2,
						  seletor_MUX => saida_dec(3),
						  saida_MUX => entrada_enable_mux);
						  
	ROM1 : entity work.ROMMIPS   generic map (dataWidth => 32, addrWidth => 32)
				 port map (Endereco => saida_pc, Dado => Dado);

	DECODER :  entity work.decoderInstru
			  port map( entrada_opcode => opcode,
							funct => funct,
						  saida => saida_dec); 
			 
	UNIDADECONTROLEULA : entity work.UnidadeControleULA
				port map (opcode => saida_dec(17 downto 12),
							 tipoR => saida_dec(6),
							 funct => funct,
							 operacao => seletorzada);
							 
	ULA1 : entity work.ULAFINAL  generic map(larguraDados => 32)
				 port map (entradaA => DadoLidoReg1, entradaB => entradab_ula,result => DadoEscritoReg3,zero=>saida_ula2, seletor => seletorzada);

	ESTENDESINAL : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
				 port map (estendeSinal_IN => imediato,seletor=>saida_dec(9), estendeSinal_OUT =>  saida_estende_sinal);
				 
	MUX_RT_IMEDIATO :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => DadoLidoReg2,
						  entradaB_MUX =>  saida_estende_sinal,
						  seletor_MUX => saida_dec(7), --definir
						  saida_MUX => entradab_ula);
						  
	MUX_RT_RD:  entity work.muxGenerico4x1 generic map (larguraDados => 5)
			  port map( entradaA_MUX => rt,
						  entradaB_MUX =>  rd,
						  entradaC_MUX => "11111",
						  entradaD_MUX => "00000",
						  seletor_MUX => saida_dec(11 downto 10),
						  saida_MUX => end_reg3);
						  
	MUX_ULA_MEM :  entity work.muxGenerico4x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => DadoEscritoReg3,
						  entradaB_MUX =>  saida_ram,
						  entradaC_MUX => saida_incrementapc,
						  entradaD_MUX => imediato & "0000000000000000",
						  seletor_MUX => saida_dec(5 downto 4),
						  saida_MUX => saida_mux_ulamem);

	MUX_PC4_JMP :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => entrada_beq_pc,
						  entradaB_MUX =>  saida_incrementapc(31 downto 28) & imediato2 & "00",
						  seletor_MUX => saida_dec(24),
						  saida_MUX => entrada_pc);

						  
	shiftLeftZada : entity work.shiftLeft generic map(larguraDados => 32)
							port map( entrada=>saida_estende_sinal, saida=>shiftado );

												
	RAM1 : entity work.RAMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6 )
					port map (clk => CLK,
				 Endereco => DadoEscritoReg3,
				 Dado_in  => DadoLidoReg2,
				 Dado_out => saida_ram,
				 we =>saida_dec(0), 
				 re =>saida_dec(1), 
				 habilita => '1');
				 
	bancoreg : entity work.bancoReg 
		 port map ( clk => CLK,
	--
			  enderecoA => rs,
			  enderecoB => rt,
			  enderecoC => end_reg3,
	--
			  dadoEscritaC => saida_mux_ulamem,
	--
			  escreveC => saida_dec(8),
			  saidaA  => DadoLidoReg1,
			  saidaB  => DadoLidoReg2);
			  
			  
	MUX_DISPLAY :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			  port map( entradaA_MUX => saida_pc,
						  entradaB_MUX =>  DadoEscritoReg3,
						  seletor_MUX => SW(0),
						  saida_MUX => displaySignal);
						  
	DISPLAY0 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(3 downto 0),
			saida7seg => HEX0
		);

   DISPLAY1 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(7 downto 4),
			saida7seg => HEX1
		);
	DISPLAY2 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(11 downto 8),
			saida7seg => HEX2
		);
	DISPLAY3 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(15 downto 12),
			saida7seg => HEX3
		);
	DISPLAY4 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(19 downto 16),
			saida7seg => HEX4
		);
	DISPLAY5 : entity work.conversorHex7Seg 
		port map(
			dadoHex => displaySignal(23 downto 20),
			saida7seg => HEX5
		);
	LEDR(3 downto 0) <= displaySignal(27 downto 24);
   LEDR(7 downto 4) <= displaySignal(31 downto 28);
		
	--RAM_IN <= DadoLidoReg2;
	--RAM_OUT<=saida_ram;
	--reg_rs <= DadoLidoReg1;
	saida_pc2 <= saida_pc;
	--wr_reg <= saida_dec(0);
	SAIDA_ULA <= DadoEscritoReg3;
	---SAIDA_2_ULA <= saida_ula2;
	--entrada_pcZao <= entrada_pc;
	--beq_dec <= saida_dec(3);
	
	--LEDR(9 downto 0) <= SW(9 downto 0);
	end architecture;