# Small and silly benchmark

This is an accidental benchmark of the same algorithm between V, Nelua and Mys
Here are the perf results, running on bare-metal Ubuntu 20.10, without any build
cache :
```
Lang  Transp.+ Comp. = Build time  Opt Flags    Run Time
V     0.10   +  1.51 = 1.61        O3 flto      2.18
Nelua 0.09   +  0.07 = 0.16        O3           2.15
Mys   ???    +  ???  = 7.71        O3           3.30
```
To be fair, all 3 languages use C.printf-like constructs, and their C/C++ outputs are built with -O3 (except for Mys, because this is the default)
`flto` flag is useful to enhance both compile/run time of V so is used.
It seems like it is not the case for the 2 others, so not used.
O3 is implicit in Mys generated Makefile, so not apparent.

- Build & run sequence for V :
```
clear ; /usr/bin/time v -o qseqv.c qseq.v ; /usr/bin/time gcc -O3 -flto -o qseqv qseqv.c ; /usr/bin/time ./qseqv > outv
```

- Build & run sequence for Nelua :
```
clear ; /usr/bin/time nelua --no-cache -P nogc -P nochecks -c qseq.nelua ; /usr/bin/time gcc -O3 -o qseqnelua nelua_cache/qseq.c ; /usr/bin/time ./qseqnelua > outnelua
```

- Build & run sequence for Mys :
```
(\rm -Rf ~/.ccache ; cd qseqmys ; clear ; mys clean ; /usr/bin/time mys build ; /usr/bin/time ./build/app > outv)
```

- V : https://vlang.io/
- Nelua : https://nelua.io/
- Mys : https://github.com/mys-lang/mys
