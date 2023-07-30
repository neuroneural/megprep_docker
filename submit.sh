#!/bin/bash

echo "in submit.sh"

project_dir=/data/users2/mjafarlou1/code
echo "project_dir is $project_dir"

paths_file=${project_dir}/paths
echo "paths_file is $paths_file"

num_lines=`wc -l <  $paths_file`
echo "num_lines is $num_lines"

num_total_runs=$(( $num_lines / 4 ))
echo "num_total_runs is $num_total_runs"

runix=$(($num_total_runs - 1))
echo "runix is $runix"

echo "sbatch --array=0-${runix}%5 ${project_dir}/process_fifs.job"
sbatch --array=0-${runix}%5 ${project_dir}/process_fifs.job
