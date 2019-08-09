#!/bin/bash
#SBATCH --job-name=fmriprep
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus=8
#SBATCH --mem=32G
#SBATCH --time=24:00:00
#SBATCH --account=def-mathroy
#SBATCH --mail-user=christophe.tanguaysabourin@mail.mcgill.ca
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
SUBJECT=$1

module load singularity/3.2

singularity run --cleanenv --bind '/home/tangsab8/projects/ctb-mathroy/tangsab8/CLBP_Network_Project/Placebo_1_Data_Copy':/data \
--bind '/home/tangsab8/projects/ctb-mathroy/tangsab8/CLBP_Network_Project/FMRIPREP_OUTPUT':/out \
'/home/tangsab8/projects/ctb-mathroy/tangsab8/CLBP_Network_Project/fmriprep.1.4.1.simg' \
--participant-label <SUBJECT> \
-w /home/tangsab8/scratch \
--fs-license-file '/home/tangsab8/projects/ctb-mathroy/tangsab8/CLBP_Network/license.txt' \
/data /out participant
