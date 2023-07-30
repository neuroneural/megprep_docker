#!/bin/bash

# directory where freesurfer data is located
FREESURFER_DIR=/data/users2/mjafarlou1/freesurfer/subjects

# directory where the output is written
OUTPUT_DIR=/data/users2/mjafarlou1/MEG/stc


# directory where fif files are located
DATA_DIRECTORY=/data/users2/nshor/Multiband_with_MEG

# a text file containing all subject IDs
subjects_file=/data/users2/mjafarlou1/code/subjects.txt

# number of subjects listed in the subjects list
num_subs=`cat $subjects_file | wc -l`

# read the subjects from the text file into an array
IFS=$'\n' sub_ids=($(cat $subjects_file))

# path to the text file containing full filepaths to input data
PATH_FILE=/data/users2/mjafarlou1/code/paths

# create the paths file
touch ${PATH_FILE}

for(( i=0; i<$num_subs; i++))
do
	subjectID=${sub_ids[$i]}
	
	
	subfifs=/data/users2/mjafarlou1/code/subfifs.txt
	touch $subfifs
	cd ${DATA_DIRECTORY}/${subjectID}/meg && ls *.fif > $subfifs
	sub_fif_files=($(cat $subfifs))
	num_fif_files=`cat $subfifs | wc -l`


	sub_outpath="${OUTPUT_DIR}/${subjectID}"
	mkdir -p "${OUTPUT_DIR}/${subjectID}"

	for((j=0; j<$num_fif_files; j++))
	do
		fif_filename=${sub_fif_files[$j]}

		# first argument of the MEG_preprocessing.py script
		echo "${DATA_DIRECTORY}/${subjectID}/meg/${fif_filename}" >> $PATH_FILE

		# second argument of the MEG_preprocessing.py script
		echo "${FREESURFER_DIR}" >> $PATH_FILE

		# third argument of the MEG_preprocessing.py script
		echo "${sub_outpath}" >> $PATH_FILE

		# fourth argument of the MEG_preprocessing.py script
		echo "${subjectID}" >> $PATH_FILE
	done
	rm $subfifs
done
