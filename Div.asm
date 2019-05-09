// Divide R0 por R1, armazena o resultado(quociente) em R2 e coloca o resto da divisao em R3.
// (R0, R1, R2 referem-se a RAM[0], RAM[1], and RAM[2], respectivamente.)


//Verificando se o denumerador é 0:
    @1 // RAM[0]
    D=M //Coloca em D o valor que M está recebendo de onde A (@) está apontando, que é RAM[0]. Se conter 0 em RAM[0], D=0, se conter outro numero, D = outro número
    @DIVBYZERO
    D;JEQ //Obviamente, se R0 for 0, R2 será 0 e o processo acaba.

//Verificando se o numerador é 0:
    @0
    D=M
    @FIM
    D;JEQ	//Se R1 for 0, não é possível efetuar a divisão, e o processo acaba.

//Verificando se o denominador é menor que 0: se entrar significa que: DEN<0 e que NUM pode ser >0 ou <0
    @1
    D=M
    @DMEN
    D;JLT

//Verificando se o numerador é menor que 0: se entrar SIGNIFICA QUE DEN >0 e NUM<0
    @0
    D=M
    @NMEN
    D;JLT



//Faço as operações aqui já que Num e Den são maiores que zero:
//Verificando se num<den
    @0
    D=M //D tem o valor de R0
    @4
    M=D // Poe R0 em R4
    @1
    D=M //D tem o valor de R1
    @5
    M=D // Poe R1 em R5
    D=M // D vale o que ta em R5, que tbm é R1
    @4
    M=M-D // fazendo R4 (que tem o valor R0) - D (que tem o valor R1)
    D=M
    @NUMMENDEN
    D;JLT
//Se nao for:
    @2
    D=0
    M=D // pondo R2 = 0
    @0
    D=M
    @3
    M=D // Pondo em R3 o valor de R0

    

(LOOP)
    @2	
    D=M	//D tem o valor de R2

    @2	
    M=D+1 //Soma o valor de R2 + 1


    @1
    D=M  // D tem o valor de R1
    @3    
    M=M-D //Poe em R3, M de R3 - D
    
    @3
    D=M //D tem o valor de R3
    @4
    M=D // Poe R3 em R4
    @1
    D=M //D tem o valor de R1
    @5
    M=D // Poe R1 em R5
    D=M // D vale o que ta em R5, que tbm é R1
    @4
    M=M-D // fazendo R4 (que tem o valor R3) - D (que tem o valor R1)
    D=M
    @LOOP	//
    D;JGE	//Volta pro LOOP se R3-R1 >=0

//mecanismo pra ir pro fim
    @0
    D=M
    @FIM
    D;JGT
    

//Se Numerador for menor que zero, faço as operações aqui:
(NMEN)

//transformo num em positivo
   @4
   D=0
   M=D
   @0
   D=M
   @4
   M=M-D
   D=M
   @0
   M=D
//fim da transf
    @2
    D=0
    M=D // pondo R2 = 0
    @0
    D=M
    @3
    M=D // Pondo em R3 o valor de R0

(LOOPNMEN)
    @2	
    D=M	//D tem o valor de R2

    @2	
    M=D+1 //Soma o valor de R2 + 1

    @1
    D=M  // D tem o valor de R1
    @3    
    M=M-D //Poe em R3, M de R3 - D
    
    @3
    D=M //D tem o valor de R3
    @4
    M=D // Poe R3 em R4
    @1
    D=M //D tem o valor de R1
    @5
    M=D // Poe R1 em R5
    D=M // D vale o que ta em R5, que tbm é R1
    @4
    M=M-D // fazendo R4 (que tem o valor R3) - D (que tem o valor R1)
    D=M
    @LOOPNMEN	//
    D;JGE	//Volta pro LOOP se R3-R1 >=0

//Fazendo quo(R2) ser negativo:
   @2
   D=M
   M=0
   M=M-D
//Fazendo num (R0) ser negativo:
   @0
   D=M
   M=0
   M=M-D
   
   //mecanismo pra ir pro fim se Resto(r3)=0
    @3
    D=M
    @FIM
    D;JEQ

//se nao
   //Fazendo quo(R2) ser positivo:
   @2
   D=M
   M=0
   M=M-D
   D=M 
   M=D+1
   //Fazendo quo ser negativo de novo:
   D=M
   M=0
   M=M-D
   //FAZENDO R = D - R
   @1
   D=M
   @3
   M=D-M
//mecanismo pra ir pro fim 
    @2
    D=M
    @FIM
    D;JLT


//Se Denominador for menor que zero, faço as operações aqui:
(DMEN)
   @0
   D=M //verificando se o numerador também é negativo
   @AMBOSNEG // SIGNIFICA QUE DEN<0 e NUM <0
   D;JLT

//Se nao for significa que DEN<0 e NUM>0
//transformo den em positivo
   @4
   D=0
   M=D
   @1
   D=M
   @4
   M=M-D
   D=M
   @1
   M=D
//fim da transf
    @2
    D=0
    M=D // pondo R2 = 0
    @0
    D=M
    @3
    M=D // Pondo em R3 o valor de R0
(LOOPDMEN)
    @2	
    D=M	//D tem o valor de R2

    @2	
    M=D+1 //Soma o valor de R2 + 1

    @1
    D=M  // D tem o valor de R1
    @3    
    M=M-D //Poe em R3, M de R3 - D
    
    @3
    D=M //D tem o valor de R3
    @4
    M=D // Poe R3 em R4
    @1
    D=M //D tem o valor de R1
    @5
    M=D // Poe R1 em R5
    D=M // D vale o que ta em R5, que tbm é R1
    @4
    M=M-D // fazendo R4 (que tem o valor R3) - D (que tem o valor R1)
    D=M
    @LOOPDMEN	//
    D;JGE	//Volta pro LOOP se R3-R1 >=0

//Fazendo quo(R2) ser negativo:
   @2
   D=M
   M=0
   M=M-D
//Fazendo den (R1) ser negativo:
   @1
   D=M
   M=0
   M=M-D
   
   //mecanismo pra ir pro fim
    @2
    D=M
    @FIM
    D;JLT

(DIVBYZERO)
   @1
   D=M
   @2
   M=D
   @32767
   D=A
   @3
   M=D
   @FIM
   0;JMP

(AMBOSNEG)

//transformo num em positivo
   @4
   D=0
   M=D
   @0
   D=M
   @4
   M=M-D
   D=M
   @0
   M=D

//Transformo o den em positivo
   @1
   D=M
   M=0
   M=M-D



//fim da transf
    @2
    D=0
    M=D // pondo R2 = 0
    @0
    D=M
    @3
    M=D // Pondo em R3 o valor de R0

(LOOPAMBOS)
    @2	
    D=M	//D tem o valor de R2

    @2	
    M=D+1 //Soma o valor de R2 + 1

    @1
    D=M  // D tem o valor de R1
    @3    
    M=M-D //Poe em R3, M de R3 - D
    
    @3
    D=M //D tem o valor de R3
    @4
    M=D // Poe R3 em R4
    @1
    D=M //D tem o valor de R1
    @5
    M=D // Poe R1 em R5
    D=M // D vale o que ta em R5, que tbm é R1
    @4
    M=M-D // fazendo R4 (que tem o valor R3) - D (que tem o valor R1)
    D=M
    @LOOPAMBOS	//
    D;JGE	//Volta pro LOOP se R3-R1 >=0


//Fazendo num (R0) ser negativo:
   @0
   D=M
   M=0
   M=M-D
   

   //Somando 1 em quo:
   @2
   D=M 
   M=D+1
   //FAZENDO R = D - R
   @1
   D=M
   @3
   M=D-M
//Fazendo den ser negativo:
   @1
   D=M
   M=0
   M=M-D
//mecanismo pra ir pro fim 
    @0
    D=M
    @FIM
    D;JLT



(NUMMENDEN)  
   @2
   M=0
   @0
   D=M
   @3
   M=D
   @FIM
   0;JMP
  
(FIM)
   
   @4
   M=0
   @5
   M=0

   @FIM
   0;JMP //LOOP interminável