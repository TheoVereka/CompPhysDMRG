
##

using ITensors, ITensorMPS
N = 100;
sites = siteinds("S=1",N);


##

os = OpSum();
for j=1:N-1
  global os += 0.5,"S+",j,"S-",j+1;
  os += 0.5,"S-",j,"S+",j+1;
  os += "Sz",j,"Sz",j+1;
end

H = MPO(os,sites);
nsweeps = 5; # number of sweeps is 5
maxdim = [10,20,100,100,200]; # gradually increase states kept during sweeps
cutoff = [1E-10]; # desired truncation error


##

psi0 = random_mps(sites;linkdims=2); # initialization of random state
groundEnergy_DMRG,groundState_DMRG = dmrg(H,psi0;nsweeps,maxdim,cutoff)
