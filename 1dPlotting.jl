using Plots;
using JLD2;



##
N42Jn1h0dim200_sweeps = 2:20

N42Jn1h0dim200_sweepsVStime1=Array([0.079,0.735,2.492,4.665,4.892,4.785,4.616,4.677,4.390,4.508,4.222,3.904,3.749,3.509,2.901,2.710,2.497,2.107,1.971]);
N42Jn1h0dim200_sweepsVStime2=Array([0.087,0.779,2.533,4.035,4.092,4.055,3.869,3.636,3.564,3.430,3.225,3.301,3.163,2.810,3.154,2.565,2.761,2.520,2.551]);

N42Jn1h0dim200_sweepsVSenergy1=Array([-10.1654514849, -10.2200684702, -10.2337089730, -10.2394794463, -10.2424342589, -10.2443135096, -10.2456166656, -10.2465543438, -10.2473018017, -10.247881545, -10.248315541, -10.248648208, -10.248916219, -10.249151366, -10.249337062, -10.249479733, -10.249592664, -10.249674185, -10.249744077]);
N42Jn1h0dim200_sweepsVSenergy2=Array([-10.1797996,-10.2218073,-10.2311193,-10.2352465,-10.2376858,-10.2394460,-10.2407372,-10.2417913,-10.2427959,-10.243632,-10.244336,-10.244960,-10.245545,-10.246061,-10.246509,-10.246913,-10.247290,-10.247655,-10.247975]);

sweepsVStime=(N42Jn1h0dim200_sweepsVStime1.+N42Jn1h0dim200_sweepsVStime2)/2
sweepsVStimeERR=abs.(N42Jn1h0dim200_sweepsVStime1.-N42Jn1h0dim200_sweepsVStime2)/2
sweepsVSenergy=(N42Jn1h0dim200_sweepsVSenergy1.+N42Jn1h0dim200_sweepsVSenergy2)/2
sweepsVSenergyERR=abs.(N42Jn1h0dim200_sweepsVSenergy1.-N42Jn1h0dim200_sweepsVSenergy2)/2

plot(N42Jn1h0dim200_sweeps,sweepsVStime,yerr=sweepsVStimeERR,xlim=(0,20.3),ylabel="Time elapsed for each sweep (s)",xlabel="Sweep times (1)",label="L_sites=42, J=-1, h=0, dim_link=200",dpi=300)
savefig("../sweep-time.png")

##
plot(N42Jn1h0dim200_sweeps,sweepsVSenergy,yerr=sweepsVSenergyERR,xlim=(0,20.3),ylabel="Ground state energy (energy unit)",xlabel="Sweep times (1)",label="L_sites=42, J=-1, h=0, dim_link=200",dpi=300)
savefig("../sweep-energy.png")


##
N42Jn1h0sweep20_dims=Array([3,5,8,11,15,19,23,28,34,40,47,55,64,77,95,105,130,160,200])

N42Jn1h0sweep20_dimsVStotalTime_s=Array([0.375065,0.447897, 0.609250,0.659843,1.022270,1.572686,1.900692,3.494330,3.866977,5.059274,6.519335,8.920954,12.050059,11.316273,22.917435,24.513504,36.400076,54.744795,70.208285]);
N42Jn1h0sweep20_dimsVSallocatedMemory_GiB=Array([0.687,0.776,0.981,1.238 ,1.743 ,2.372 ,3.104 ,4.232 ,5.835 ,7.661 ,9.955 ,13.394,17.166,16.667,33.188,36.706,56.324,82.992,106.15]);
N42Jn1h0sweep20_dimsVSfinalEnergy=Array([-10.249997, -10.249999,-10.249999,-10.249987,-10.249202,-10.249927,-10.249537,-10.249488,-10.249014,-10.249630,-10.244805,-10.248955,-10.248515,-10.249955,-10.248223,-10.249894,-10.249584,-10.248530,-10.248961]);

N42J1h0sweep20_dimsVStotalTime_s=Array([0.369479, 0.488179, 0.567944, 0.652764, 0.877320, 1.517440,  1.895362,  3.558572,  4.025269,  4.929708,  6.665049,  8.945587, 12.073862, 15.522123, 19.042522, 19.188805, 19.475981, 20.417283, 18.938900]);
N42J1h0sweep20_dimsVSallocatedMemory_GiB=Array([0.687,0.776,0.979,1.238 ,1.743,2.373,3.125,4.258 ,5.876 ,7.714,10.096,13.151,16.961,22.282,28.103,28.617,28.856,30.878,28.707]);
N42J1h0sweep20_dimsVSfinalEnergy=Array([-18.080422227918096,-18.37237711880419,-18.423619939419044,-18.4261472593908,-18.42717672461878,-18.427513074860222,-18.42755835486145,-18.42756631069586,-18.427569335413445,-18.42757033952288,-18.427570465820637,-18.427570489613647,-18.427570498018852,-18.427570500022995,-18.42757050036157,-18.427570500367978,-18.427570500368038,-18.427570500368013,-18.427570500368134]);

##
plot(N42Jn1h0sweep20_dims,N42Jn1h0sweep20_dimsVSallocatedMemory_GiB,ylabel="Total time for DMRG (s)",xlabel="Link imension (1)",label="L_sites=42, J=-1, h=0, sweeps=20",dpi=300)
plot!(N42Jn1h0sweep20_dims,N42J1h0sweep20_dimsVSallocatedMemory_GiB,ylabel="Total time for DMRG (s)",xlabel="Link imension (1)",label="L_sites=42, J=1, h=0, sweeps=20",dpi=300)
savefig("../dim-time.png")

##
plot(N42Jn1h0sweep20_dims,N42Jn1h0sweep20_dimsVSallocatedMemory_GiB,ylabel="Allocated memory for DMRG (s)",xlabel="Link imension (1)",label="L_sites=42, J=-1, h=0, sweeps=20",dpi=300)
plot!(N42Jn1h0sweep20_dims,N42J1h0sweep20_dimsVSallocatedMemory_GiB,ylabel="Allocated memory for DMRG (s)",xlabel="Link imension (1)",label="L_sites=42, J=1, h=0, sweeps=20",dpi=300)
savefig("../dim-memory.png")

##
plot(N42Jn1h0sweep20_dims,N42Jn1h0sweep20_dimsVSfinalEnergy/42 .+1/4,ylabel="Ground state's energy deviation (per site)",xlabel="Link imension (1)",label="L_sites=42, J=-1, h=0, sweeps=20\nE=-1/4 at thermodynamics limit",dpi=300)
plot!(N42Jn1h0sweep20_dims,N42J1h0sweep20_dimsVSfinalEnergy/42 .-1/4 .+log(2),ylabel="Ground state's energy deviation (per site)",xlabel="Link imension (1)",label="L_sites=42, J=1, h=0, sweeps=20\nE=1/4+ln2 at thermodynamics limit",dpi=300)
savefig("../dim-energy.png")



##
Jn1h0sweep10dim100_Nsites=Array([3,5,7,10,13,17,21,26,31,37,43,50,58,67,78,89,100,115,132,150]);

Jn1h0sweep10dim100_NsitesVStotalTime_s=Array([ 0.015527,0.026337,0.032879,0.072181,0.287537,0.977319,3.438793,5.226094,7.160582,10.022806,12.263039,13.831658,18.602673,22.126155,22.263500,30.789424,30.157086,40.658074,46.365459,54.597199]);
Jn1h0sweep10dim100_NsitesVSallocatedMemory_GiB=Array([ 0.007,0.028,0.048,0.126,0.513, 1.546,5.249,8.337,11.098 ,14.869 ,18.620,21.118 ,27.785 ,33.360 ,34.478 ,46.303,45.732 ,61.221,69.520 ,82.695 ]);

Jn1h0sweep10dim100_NsitesVS_E1=Array(load_object("energy_N_J=-1,try1656.jld2"));
Jn1h0sweep10dim100_NsitesVS_M1=Array(load_object("magz_N_J=-1,try1656.jld2"));
Jn1h0sweep10dim100_NsitesVS_S1=Array(load_object("Svn_N_J=-1,try1656.jld2"));

Jn1h0sweep10dim100_NsitesVS_E2=Array(load_object("energy_N_J=-1,try1701-sweep9.jld2"));
Jn1h0sweep10dim100_NsitesVS_M2=Array(load_object("magz_N_J=-1,try1701-sweep9.jld2"));
Jn1h0sweep10dim100_NsitesVS_S2=Array(load_object("Svn_N_J=-1,try1701-sweep9.jld2"));

J1h0sweep10dim100_NsitesVS_E1=Array(load_object("energy_N_J=1,try1730.jld2"));
J1h0sweep10dim100_NsitesVS_M1=Array(load_object("magz_N_J=1,try1730.jld2"));
J1h0sweep10dim100_NsitesVS_S1=Array(load_object("Svn_N_J=1,try1730.jld2"));

J1h0sweep10dim100_NsitesVS_E2=Array(load_object("energy_N_J=1,try1929.jld2"));

J1h0sweep10dim100_NsitesVS_M2=Array(load_object("magz_N_J=1,try1929.jld2"));
J1h0sweep10dim100_NsitesVS_S2=Array(load_object("Svn_N_J=1,try1929.jld2"));


Jn1NsitesVS_E=(Jn1h0sweep10dim100_NsitesVS_E1+Jn1h0sweep10dim100_NsitesVS_E2)/2
Jn1NsitesVS_M=(Jn1h0sweep10dim100_NsitesVS_M1+Jn1h0sweep10dim100_NsitesVS_M2)/2
Jn1NsitesVS_S=(Jn1h0sweep10dim100_NsitesVS_S1+Jn1h0sweep10dim100_NsitesVS_S2)/2
#Jn1NsitesVS_Eerr=abs.(Jn1h0sweep10dim100_NsitesVS_E1-Jn1h0sweep10dim100_NsitesVS_E2)/2
#Jn1NsitesVS_Merr=abs.(Jn1h0sweep10dim100_NsitesVS_M1-Jn1h0sweep10dim100_NsitesVS_M2)/2
#Jn1NsitesVS_Serr=abs.(Jn1h0sweep10dim100_NsitesVS_S1-Jn1h0sweep10dim100_NsitesVS_S2)/2

J1NsitesVS_E=(J1h0sweep10dim100_NsitesVS_E1+J1h0sweep10dim100_NsitesVS_E2)/2
J1NsitesVS_M=(J1h0sweep10dim100_NsitesVS_M1+J1h0sweep10dim100_NsitesVS_M2)/2
J1NsitesVS_S=(J1h0sweep10dim100_NsitesVS_S1+J1h0sweep10dim100_NsitesVS_S2)/2
#J1NsitesVS_Eerr=abs.(J1h0sweep10dim100_NsitesVS_E1-J1h0sweep10dim100_NsitesVS_E2)/2
#J1NsitesVS_Merr=abs.(J1h0sweep10dim100_NsitesVS_M1-J1h0sweep10dim100_NsitesVS_M2)/2
#J1NsitesVS_Serr=abs.(J1h0sweep10dim100_NsitesVS_S1-J1h0sweep10dim100_NsitesVS_S2)/2


##
plot()
for i = 1:length(Jn1h0sweep10dim100_Nsites)
    Nsites = Jn1h0sweep10dim100_Nsites[i]
    plot!(1:Nsites,(Jn1NsitesVS_M[i]).-1*i,ylabel="Spin on Z (1, offset by integer)",xlabel="Site number (1)",label="L_sites=$Nsites",dpi=300, minorgrid=true,title="Spin expectation for J=1, h=0, dim=100, sweeps=10")
end
savefig("../N-M-1.png")

##
plot()
for i = 1:length(Jn1h0sweep10dim100_Nsites)
    Nsites = Jn1h0sweep10dim100_Nsites[i]
    plot!(1:Nsites,(Jn1NsitesVS_S[i])./log(2).-1*i,ylabel="von Neumann Entropy (bit)",xlabel="Site number (1)",label="L_sites=$Nsites",dpi=300, minorgrid=true,title="Bond entropy for J=-1, h=0, dim=100, sweeps=10")
end
savefig("../N-S-1.png")

##
plot()
for i = 1:length(Jn1h0sweep10dim100_Nsites)
    Nsites = Jn1h0sweep10dim100_Nsites[i]
    plot!(1:Nsites,(J1NsitesVS_M[i]).-1*i,ylabel="Spin on Z (1, offset by integer)",xlabel="Site number (1)",label="L_sites=$Nsites",dpi=300, minorgrid=true,title="Spin expectation for J=-1, h=0, dim=100, sweeps=10")
end
savefig("../N-M1.png")

##
plot()
for i = 1:length(Jn1h0sweep10dim100_Nsites)
    Nsites = Jn1h0sweep10dim100_Nsites[i]
    plot!(1:Nsites,(J1NsitesVS_S[i])./log(2).-1*i,ylabel="von Neumann Entropy (bit)",xlabel="Site number (1)",label="L_sites=$Nsites",dpi=300, minorgrid=true,title="Bond entropy for J=1, h=0, dim=100, sweeps=10")
end
savefig("../N-S1.png")

##
plot(size=(400,400),Jn1h0sweep10dim100_Nsites,Jn1NsitesVS_E./Jn1h0sweep10dim100_Nsites,xlabel="Total sites number (1)",label="J=-1, h=0, dim=100, sweeps=10",dpi=300, minorgrid=true)
plot!(Jn1h0sweep10dim100_Nsites,J1NsitesVS_E./Jn1h0sweep10dim100_Nsites,xlabel="Total sites number (1)",label="J=1, h=0, dim=100, sweeps=10",dpi=300, minorgrid=true)
plot!(Jn1h0sweep10dim100_Nsites,0*Jn1h0sweep10dim100_Nsites.-0.25,xlabel="Total sites number (1)",label="Theoretical E_0 for J=-1, h=0",dpi=300, minorgrid=true, linestyle=:dash)
plot!(Jn1h0sweep10dim100_Nsites,0*Jn1h0sweep10dim100_Nsites.+(1/4-log(2)),xlabel="Total sites number (1)",label="Theoretical E_0 for J=1, h=0",dpi=300, minorgrid=true,ylabel="Ground state energy per site (energy unit)", linestyle=:dash)
savefig("../N-E.png")


