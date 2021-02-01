//n:=2000000
n:=40000
//n:=20
mut q:=[]int{}
q<<1 q << 1
for i:=2; i < n; i++ {
    q<<q[i - q[i-1]] + q[i - q[i-2]]
}
println('Q=${q}')
