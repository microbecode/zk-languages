powdr setup 8 --backend halo2 --field bn254
powdr pil multiply.asm --field bn254 --force --inputs 2,3
powdr verification-key multiply.asm --field bn254 --backend halo2 --params params.bin
powdr prove multiply.asm --field bn254 --backend halo2 --params params.bin --vkey vkey.bin