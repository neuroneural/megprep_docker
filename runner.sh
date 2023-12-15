#!/bin/sh
fif_file=$1
freesurfer_path=$2
out_dir=$3
subid=$4

python /MEG_preprocessing.py $fif_file $freesurfer_path $out_dir $subid

