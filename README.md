# Intro to MCMC for Swansea Cosmology students

This repository contains the different files required to do the coding exercises presented in the lectures.

## Instructions for setting up Cobaya on the Swansea cluster or your laptop

Login to the cluster through the terminal
```bash
ssh username@sunbird.swansea.ac.uk
```

Once logged in load the following modules
```bash
module load anaconda/2023.09 compiler/gnu/12/1.0 mpi/openmpi/4.1.5
```
If you are working on your own laptop and not the cluster, you should skip the first two steps. For running the codes on your laptop you will still need python and the gcc (or another) compiler installed, mpi optional. Installation issues mainly happen with MacOS or Windows, for the former I recommend using [Homebrew](https://brew.sh/) to manage the installation of these and then use [anaconda/miniconda](https://docs.anaconda.com/miniconda/) or [python-venv](https://docs.python.org/3/library/venv.html) for managing the python environments. For Windows look into [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) which provides a Linux enviroment to use on Windows or work directly on the cluster. 

You can then create a conda environment but for the cluster I recommend using a python virtual environment. Create this using
```bash
python -m venv /path/to/your/virtual/environment
```

Activate your new environment.
```bash
source /path/to/your/virtual/environment/bin/activate
```

Now, you can follow the instructions on the cobaya [homepage](https://cobaya.readthedocs.io/en/latest/installation.html) to install cobaya (reproduced below). You can first install the python MPI wrapper if you want to use parallel processing to run multiple MCMC chains (you will need to install an MPI package if you are working on your laptop). Although this is not necessary to get started it is highly recommended to do so since this will make the sampling more efficient.
```bash
python -m pip install "mpi4py>=3" --upgrade --no-binary :all:
python -m pip install cobaya --upgrade
python -c "import cobaya"
```
If everything went well, the last command should not give you an error.

Cobaya input files are provided in the .yaml format. To install the cosmological theory codes and likelihoods used in a particular inputfile type
```bash
cobaya-install inputfile.yaml -p /path/to/packages
```
For more information, see the cobaya [documentation](https://cobaya.readthedocs.io/en/latest/index.html).

To run cobaya with your input file, type
```bash
cobaya-run inputfile.yaml 
```
to run without MPI or 
```bash
mpirun -n nproc cobaya-run inputfile.yaml 
```
if using nproc MPI processes.

Note! You should not run programs directly on the login node. It is ok however to add the --test flag to the cobaya-run command when on the login node. This will check that the input file provided is valid and the required theory codes and likelihoods are already installed. To do a full MCMC run, start an [interactive job](https://supercomputingwales.github.io/SCW-tutorial/04-running-jobs/) for short runs or use the provided job scripts for longer runs. 

For moving the input files to the cluster or downloading files from the cluster to your system, see the Swansea Sunbird [documentation](https://supercomputingwales.github.io/SCW-tutorial/03-moving-data/). To analyse the results of the MCMC, you can work directly on the cluster or download the chains to your own system.  Getdist notebooks for analysing the chains are provided in the repository. Note that python notebooks will not work directly on the cluster.



