#source: ifunc-16.s
#ld: -shared
#readelf: -r --wide
#target: aarch64*-*-*

Relocation section '.rela.plt' at .*
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_JUMP_SLOT[ ]+0+[ ]+ifunc \+ 0
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_IRELATIVE[ ]+[0-9a-f]*
