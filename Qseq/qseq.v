n:=20000000
//n:=40000
//n:=20
mut q:=[]int{}
q<<1 q << 1
for i:=2; i < n; i++ {
    q<<q[i - q[i-1]] + q[i - q[i-2]]
}
C.printf("Q=[")
for i:=0; i<q.len; i++ {
        if i>0 {
                C.printf(", ")
        }
        C.printf("%d", q[i])
}
C.printf("]\n")
