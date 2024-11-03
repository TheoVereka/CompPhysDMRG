
using ITensors, ITensorMPS
##
Nsites = [3,5,7,10,13,17,21,26,31,37,43,50,58,67,78,89,100,115,132,150];
magz_N = [];
energy_N = [];
for N in Nsites
    J = -1;
    h = 0;
    random_init = true
    nsweeps = 10; 
    maxdim = [100 for i=1:nsweeps]; 

    ##

    sites = siteinds("S=1/2",N);
    os = OpSum();
    for j=1:N-1
        os += 0.5,"S+",j,"S-",j+1;
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


    groundEnergy_DMRG,groundState_DMRG = dmrg(H,psi0;nsweeps,maxdim,cutoff,outputlevel=0);


    #println("groundEnergy")
    #println(groundState_DMRG)

    magz = expect(groundState_DMRG,"Sz");
    push!(magz_N,array(magz))
    push!(energy_N,groundEnergy_DMRG)
    print(N,groundEnergy_DMRG/N)
    #magy = expect(groundState_DMRG,"Sy")

    ##



end
