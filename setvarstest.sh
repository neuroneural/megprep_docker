#!/bin/bash

module load singularity/3.10.2


export RUN_BIND_POINT=/data/users2/mjafarlou1/code
export SIF_FILE=/data/users2/mjafarlou1/code/megprep.sif

export FIF_DIR=/data/users2/mjafarlou1/megsample
export FIF_FILENAME=sub-01_task-RDR_run-29_meg.fif

export fif_filepath=/fif/${FIF_FILENAME} #first argument of the MEG_preprocessing.py script
export FREESURFER_DIR=/data/users2/mjafarlou1/freesurfer/subjects #second argument of the MEG_preprocessing.py script
export OUTPUT_DIR=/data/users2/mjafarlou1/MEG/stc/sub-01 #third argument of the MEG_preprocessing.py script
export SUBJECT_ID=sub-01 #fourth argument of the MEG_preprocessing.py script



export SCRIPT_NAME=MEG_preprocessing.py

