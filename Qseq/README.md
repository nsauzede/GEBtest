# Small and silly benchmark

This is an accidental benchmark of the same algorithm between V, Nelua and Mys
```
Lang  Build time  Run Time
V     9.50        5.60
Nelua 0.87        5.65
Mys   10.12       7.81
```
To be fair, all 3 languages use C.printf-like constructs, and their C/C++ outputs are built with -O3 (except for Mys, because this is the default)

- V : https://vlang.io/
- Nelua : https://nelua.io/
- Mys : https://github.com/mys-lang/mys
