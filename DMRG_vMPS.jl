
using ITensors, ITensorMPS
##

N = 42;
J = 1;
h = 0;
random_init = true
nsweeps = 20; 
maxdim = [200 for i=1:nsweeps]; 

##

sites = siteinds("S=1/2",N);
os = OpSum();
for j=1:N-1
    global os += 0.5,"S+",j,"S-",j+1;
    os += 0.5,"S-",j,"S+",j+1;
    os += J,"Sz",j,"Sz",j+1;
    os += -h,"Sz",j
end
os += -h,"Sz",N;

H = MPO(os,sites);
cutoff = [1E-12]; # desired truncation error
noise = [1E-6, 1E-7, 1E-8, 1E-9, 1E-10];


##
if random_init
    psi0 = random_mps(sites;linkdims=9); # initialization of random state
else
    randomPhase = 2*pi*rand()
    symAnalResult_array = zeros(ComplexF16, 2^N)
    symAnalResult_array[1]=1/sqrt(2)
    symAnalResult_array[end]=exp(im*randomPhase)/sqrt(2)
    psi0 = MPS(symAnalResult_array,sites;cutoff=1e-9,maxdim=9)
end

initialEnergy = inner(psi0, Apply(H, psi0))
println("initial guess's energy = $initialEnergy")


groundEnergy_DMRG,groundState_DMRG = dmrg(H,psi0;nsweeps,maxdim,cutoff);


#println("groundEnergy")
#println(groundState_DMRG)

magz = expect(groundState_DMRG,"Sz");
magx = expect(groundState_DMRG,"Sx");
#magy = expect(groundState_DMRG,"Sy")

##


for m in magx 
    print(m) 
    print(", ") 
end

