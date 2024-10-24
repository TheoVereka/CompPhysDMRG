
##
using ITensors;

##
let
  i = Index(10)           # index of dimension 10
  j = Index(20)           # index of dimension 20
  M = random_itensor(i,j)  # random matrix, indices i,j
  U,S,V = svd(M,i)        # compute SVD with i as row index
  @show M ≈ U*S*V         # OUTPUT " ... = true "
  println("\n")           # may slow down
  @show S
  nothing
end

# println(M)    # won't output because the calculation is in let-...-end environment