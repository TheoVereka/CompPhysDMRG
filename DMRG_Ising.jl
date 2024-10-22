
##

using ITensors, ITensorMPS
N = 28;
sites = siteinds("S=1/2",N);


##

os = OpSum();
for j=1:N-1
  global os += -2.6,"Sz",j,"Sz",j+1;
  os += -0.19,"Sx",j;
end
os += -0.19,"Sx",N;

H = MPO(os,sites);
nsweeps = 5; # number of sweeps is 5
maxdim = [10,20,100,100,200]; # gradually increase states kept during sweeps
cutoff = [1E-10]; # desired truncation error
noise = [1E-6, 1E-7, 1E-8, 1E-9, 1E-10]


##

#psi0 = random_mps(sites;linkdims=2); # initialization of random state
randomPhase = 2*pi*rand()
symAnalResult_array = zeros(ComplexF64, 2^N)
symAnalResult_array[1]=1/sqrt(2)
symAnalResult_array[end]=exp(im*randomPhase)/sqrt(2)
psi0 = MPS(symAnalResult_array,sites;cutoff=1e-9,maxdim=9)

initialEnergy = inner(psi0, Apply(H, psi0))
println("initial guess's energy = $initialEnergy")


groundEnergy_DMRG,groundState_DMRG = dmrg(H,psi0;nsweeps,maxdim,cutoff)


println("J=2.6, g=-0.19")
println(groundState_DMRG)

println("Sz_expectation")
magz = 2*expect(groundState_DMRG,"Sz")
for (j,mz) in enumerate(magz)
    println("$j $mz")
end

println()
println("Sx_expectation")
magx = 2*expect(groundState_DMRG,"Sx")
for (j,mx) in enumerate(magx)
    println("$j $mx")
end
