# Small and silly benchmark

This is an accidental benchmark of the same algorithm between V, Nelua and Mys
Here are the perf results, running on bare-metal Ubuntu 20.10 :
```
Lang  Transpile Time  O3 Build time  Run Time
V     0.10            6.14           2.25
Nelua 0.09            0.07           2.49
Mys   ????            0.67           3.31
```
To be fair, all 3 languages use C.printf-like constructs, and their C/C++ outputs are built with -O3 (except for Mys, because this is the default)

- Build & run sequence for V :
```
clear ; /usr/bin/time v -o qseqv.c qseq.v ; /usr/bin/time gcc -O3 -o qseqv qseqv.c ; /usr/bin/time ./qseqv > outv
```

- Build & run sequence for Nelua :
```
clear ; /usr/bin/time nelua --no-cache -P nogc -P nochecks -c qseq.nelua ; /usr/bin/time gcc -O3 -o qseqnelua nelua_cache/qseq.c ; /usr/bin/time ./qseqnelua > outnelua
```

- Build & run sequence for Mys :
```
clear ; mys clean ; /usr/bin/time mys build ; /usr/bin/time ./build/app > outv
```
(Mys seems to already compile with g++ -O3 in its generated Makefile)

- V : https://vlang.io/
- Nelua : https://nelua.io/
- Mys : https://github.com/mys-lang/mys
