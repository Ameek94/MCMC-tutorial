# Intro to MCMC for Swansea Cosmology students

This repository contains the different files required to do the coding exercises presented in the lectures.

## Instructions for setting up Cobaya on the Swansea cluster

Login to the cluster through the terminal
```bash
ssh username@sunbird.swansea.ac.uk
```

Once, logged in load the following modules
```bash
module load anaconda/2023.09 compiler/gnu/12/1.0 mpi/openmpi/4.1.5
```

You can create a conda environment but I recommend using a python virtual environment. Create this using
```bash
python -m venv /path/to/your/virtual/environment
```

Activate your new environment.
```bash
source /path/to/your/virtual/environment/bin/activate
```

Now, you can follow the instructions on https://cobaya.readthedocs.io/en/latest/installation.html to install cobaya. You can first install the python mpi wrapper, although this is not necessary to get started it is highly recommended to do so.
```bash
python -m pip install "mpi4py>=3" --upgrade --no-binary :all:
python -m pip install cobaya --upgrade
python -c "import cobaya"
```
If everything went well, the last command should not give you an error.

Cobaya input files are provided in the .yaml format. To install the cosmological theory codes and likelihoods used in this tutorial type
```bash
cobaya-install inputfile.yaml -p /path/to/packages
```
For more information, see the cobaya documentation https://cobaya.readthedocs.io/en/latest/index.html .

To run cobaya with your input file, type
```bash
cobaya-run inputfile.yaml 
```
Note! You should not run programs directly on the login node. It is ok however to add the --test flag to the cobaya-run command when on the login node. This will check that the input file provided is valid and the required theory codes and likelihoods are already installed. To do a full MCMC run, start an [interactive job](https://supercomputingwales.github.io/SCW-tutorial/04-running-jobs/) or use the provided job scripts. 




