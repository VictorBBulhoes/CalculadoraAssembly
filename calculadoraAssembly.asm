section .data

    operando1: db "Entre com o operando 1: ", 10
    operando1Len equ $-operando1
    operando2: db "Entre com o operando 2: ", 10
    operando2Len equ $-operando2
    operador: db "Entre com a operacao( + , - , / , * ): ", 10
    operadorLen equ $-operador
   
    
section     .bss
    valorLido: resb 4
    msg:        resb 20
    op1:        resb 10
    op2:        resb 10
    op:   resb 10
    conta:      resb 10
    valorBinario:   resb 10

section .text
global main
main:
    mov     ebp, esp; for correct debugging
    
    ;Impressao mesg1
        mov eax, 4; system call para sys_write
	mov ebx, 1
	mov ecx, operando1
	mov edx, operando1Len

	int 80h ; chamada do kernel
    
    
    
    ;SCAN OPERANDO 1
    mov     ebp, esp; for correct debugging
    
    mov     eax,3   ; serviço do SO sys_read  
    mov     ebx,0   ; file deor (stdin)  
    mov     ecx,valorLido ; carrega o endereco da area de memoria  
    mov     edx,4   ; tamanho da area de memoria                            
    int     0x80    ; chamada da interrupcao 80h  (chamada ao SO)
    
    
    ;armazenar operando 1
    mov [op1], word 0
    
    ;somar primeiro dígito
    mov al, [valorLido] ;copia o primeiro dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mul bx ;obter n*100 em ax
    mul bx ;ober n*1000 em ax
    mov bx, [op1] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op1], ax ;atualizar valor do operando 1 com o dígito processado
    
    xor eax,eax
    ;somar segundo dígito
    mov al, [valorLido + 1] ;copia o secontagundo dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mul bx ;obter n*100 em ax
    mov bx, [op1] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op1], ax ;atualizar valor do operando 1 com o dígito processado
    
    xor eax,eax
    ;somar terceiro dígito
    mov al, [valorLido + 2] ;copia o terceiro dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mov bx, [op1] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op1], ax ;atualizar valor do operando 1 com o dígito processado
    
    xor eax, eax
    ;somar quarto dígito
    mov al, [valorLido + 3] ;copia o quarto dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    add ax, [op1] ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op1], ax ;atualizar valor do operando 1 com o dígito processado
    
    
    ;transf
    
    
    
    ;/////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    ;Impressao mesgOP
        mov eax, 4; system call para sys_write
        mov ebx, 1
	mov ecx, operador
	mov edx, operadorLen

	int 80h ; chamada do kernel

    ;SCAN OPERADOR
    mov     eax,3   ; serviço do SO sys_read  
    mov     ebx,0   ; file deor (stdin)  
    mov     ecx,op ; carreaga o endereco da area de memoria  
    mov     edx,4 ; tamanho da area de memoria                             
    int     0x80    ; chamada da interrupcao 80h  (chamada ao SO)
     
     ;//////////////////////////////////////////////////////////////////////////  
     
    ;Impressao mesg2 
        mov eax, 4; system call para sys_write
	mov ebx, 1
	mov ecx, operando2
	mov edx, operando2Len

	int 80h ; chamada do kernel
           
                          
    ;SCAN OPERANDO 2
    mov     ebp, esp; for correct debugging
    mov     eax,3   ; serviço do SO sys_read  
    mov     ebx,0   ; file deor (stdin)  
    mov     ecx,valorLido ; carreaga o endereco da area de memoria  
    mov     edx,1 ; tamanho da area de memoria                             
    int     0x80    ; chamada da interrupcao 80h  (chamada ao SO)
    
    ;armazenar operando 2
    mov [op2], word 0
    
    
     xor eax,eax
    ;somar primeiro dígito
  
    mov al, [valorLido] ;copia o primeiro dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mul bx ;obter n*100 em ax
    mul bx ;ober n*1000 em ax
    mov bx, [op2] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op2], ax ;atualizar valor do operando 1 com o dígito processado
    
    
    ;somar segundo dígito
    mov al, [valorLido + 1] ;copia o segundo dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mul bx ;obter n*100 em ax
    mov bx, [op2] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op2], ax ;atualizar valor do operando 1 com o dígito processado
    
    
    ;somar terceiro dígito
    mov al, [valorLido + 2] ;copia o terceiro dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    mov bx, 10
    mul bx ;obter n*10 em ax
    mov bx, [op2] ;copiar o valor atual do operando 1 em bx
    add ax, bx ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op2], ax ;atualizar valor do operando 1 com o dígito processado
    
    
    ;somar quarto dígito
    mov al, [valorLido + 3] ;copia o quarto dígito
    movzx ax, al
    sub ax, '0' ;converte de ascii para decimal
    add ax, [op2] ;somar o valor atual do operando 1 com o valor do novo dígito processado
    mov [op2], ax ;atualizar valor do operando 1 com o dígito processado
    

    
    ;////////////////////////////////////////////////////////////////////////////////////
    
    
    ;IF ELSE
    cmp     [op], byte '+'
    je      soma
    
    cmp     [op], byte '-'
    je      subtracao
    
    cmp     [op], byte '*'
    je      multiplicacao
    
    ;cmp     [op], byte '/'
    ;je      divisao
    
soma:
    add     eax, ebx ; Soma dos valores inteiros
    mov     [conta], eax;

    ;CONVERSAO DE INT PARA CHAR
    mov     eax,[conta]
    add     eax, 30h
    mov     [conta], eax
    jmp     resultado
    
subtracao:
    sub     eax, ebx
    mov     [conta], eax

    ;CONVERSAO DE INT PARA CHAR
    mov     eax,[conta]
    add     eax, 30h
    mov     [conta], eax
    jmp     resultado

multiplicacao:
    mov     [op1], ax
    mul     ebx
    mov     [conta], ax
    
    ;CONVERSAO DE INT PARA CHAR
    mov     eax,[conta]
    add     eax, 30h
    mov     [conta], eax
    jmp     resultado


resultado:


    mov     ebp, esp; for correct debugging
    mov     eax,4    ;serviço do SO sys_write
    mov     ebx,1    ;file deor (stdout)
    mov     ecx,conta   ;carrega em ecx o endereco do text
    mov     edx,5 ;tamanho da mensagem  
    int     0x80     ;chamada da interrupcao 80h  (chamada ao SO)
    
        
        
Binario:
    mov ecx,[conta]
    mov eax ,ecx
    mov cx,2
    div cx
    mov cx,ax
    mov dx,ax
    ;add valorBinario,dx
    
   
    cmp     cx,1
    jne     Binario
    
    mov     ebp, esp; for correct debugging
    mov     eax,4    ;serviço do SO sys_write
    mov     ebx,1    ;file deor (stdout)
    mov     ecx,valorBinario   ;carrega em ecx o endereco do text
    mov     edx,5 ;tamanho da mensagem  
    int     0x80     ;chamada da interrupcao 80h  (chamada ao SO)
        
    jmp     sair
sair:                       
    mov     eax,1    ;system call number (sys_exit)
    int     0x80     ;call kernel
    ret

