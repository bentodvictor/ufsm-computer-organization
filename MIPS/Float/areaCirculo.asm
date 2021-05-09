# Programa: areaCirculo
# Descricao: Calcula a area de um c�rculo utilizando precisao simples e precisao dupla

.text
start:    
    
    # calculo em precisao simples
    la $t0, r_f
    la $t1, pi_f
    lwc1 $f1,0($t1)             # f1 <- pi_f
    lwc1 $f0,0($t0)             # f0 <- r_f
    mul.s $f0, $f0, $f0         # f0 <- r^2
    mul.s $f3, $f1, $f0         # f3 <- pi * r^2
    la $t3, area_f
    swc1 $f3, 0($t3)            # area_f <- f3
    
    li $v0, 2                   # Print float
    add.s  $f12, $f3, $f31      # f31 = 0
    syscall
  
    
    # calculo em precisao dupla
    la $t0, r_d
    la $t1, pi_d
    lwc1 $f4,0($t1)             # f4 <- pi_d (low word)
    lwc1 $f5,4($t1)             # f5 <- pi_d (high word)
    lwc1 $f6,0($t0)             # f6 <- r_d (low word)
    lwc1 $f7,4($t0)             # f7 <- r_d (high word)    
    mul.d $f6, $f6, $f6         # f7:f6 <- r^2
    mul.d $f8, $f4, $f6         # f9:f8 <- pi * r^2
    la $t3, area_d
    swc1 $f8, 0($t3)            # area_d (low word) <- f8
    swc1 $f9, 4($t3)            # area_d (hing word) <- f9
    
    
.data
    # Float data
    pi_f:       .float 3.141592653589793
    r_f:        .float 8.0
    area_f:     .float 0.0
    
    # Double data
    pi_d:       .double 3.141592653589793
    r_d:        .double 8.0
    area_d:     .double 0.0
    
    
    
    

