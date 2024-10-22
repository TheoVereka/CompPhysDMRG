
##

using ITensors, ITensorMPS
N = 20;
sites = siteinds("S=1/2",N);


##

os = OpSum();
for j=1:N-1
  global os += -1.7,"Sz",j,"Sz",j+1;
  os += -1.19,"Sx",j;
end
os += -1.19,"Sx",N;

H = MPO(os,sites);
nsweeps = 3;
maxdim = [20 for i=1:3];
cutoff = [1E-8];


##

psi0 = random_mps(sites); # initialization of random state
groundEnergy_DMRG,groundState_DMRG = dmrg(H,psi0;nsweeps,maxdim,cutoff)

println("J=1.7, g=-1.19")
println(groundState_DMRG)

println("Sz_expectation")
magz = expect(groundState_DMRG,"Sz")
for (j,mz) in enumerate(magz)
    println("$j $mz")
end

println()
println("Sx_expectation")
magx = expect(groundState_DMRG,"Sx")
for (j,mx) in enumerate(magx)
    println("$j $mx")
end
