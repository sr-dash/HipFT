#!/bin/bash

# This script can be used to plot the output of HipFT.
# It requires the PSI tool "plot2d", and ffmpeg with the H.264 codec.
# It assumes a linux machine.

# This needs to add an option to plot a realization, plot all realizations, or default to 2d mode?

DATADIR=$1
OUTFILE=$2
Slice=$3

DPI=128
LABEL="Gauss"

CURRDIR=$PWD

mkdir $DATADIR/plots
cd $DATADIR/plots

for file in ../*.h5 
do
  TWOD=$(h5dump -d dim3 -H $file 2>/dev/null |tr '"' '\n' | grep DATASPACE\ \ SIMPLE | head -1 | tr -dc '^[0-9]/' | tr '/' '\n'| head -1)

  if [[ $TWOD -eq "" ]]; then
    plot2d -cmin -25 -cmax 25 -dpi $DPI -tp -ll -finegrid -unit_label $LABEL $file -o "$(basename $file .h5).png"
  elif [[ "$Slice" = "all" ]]; then
    for i in $(seq 1 $TWOD)
    do
      hipft_extract_realization.py $file -r $i -o tmp_file.h5
      fslice=$(printf %06d\\n $i)
      plot2d -cmin -25 -cmax 25 -dpi $DPI -tp -ll -finegrid -unit_label $LABEL tmp_file.h5 -o "$(basename $file .h5)_r$fslice.png"
    done
  elif [[ $Slice -ne "" ]]; then
    if [[ $Slice -gt $TWOD  ]]; then
      echo "Slice requested is outside range defaulting to last slice : $TWOD"
      hipft_extract_realization.py $file -r $TWOD -o tmp_file.h5
      fslice=$(printf %06d\\n $TWOD)
      plot2d -cmin -25 -cmax 25 -dpi $DPI -tp -ll -finegrid -unit_label $LABEL tmp_file.h5 -o "$(basename $file .h5)_r$fslice.png"
    else
      hipft_extract_realization.py $file -r $Slice -o tmp_file.h5
      fslice=$(printf %06d\\n $Slice)
      plot2d -cmin -25 -cmax 25 -dpi $DPI -tp -ll -finegrid -unit_label $LABEL tmp_file.h5 -o "$(basename $file .h5)_r$fslice.png"
    fi
  else
    hipft_extract_realization.py $file -r 1 -o tmp_file.h5
    plot2d -cmin -25 -cmax 25 -dpi $DPI -tp -ll -finegrid -unit_label $LABEL tmp_file.h5 -o "$(basename $file .h5)_r000001.png"
  fi
done

rm tmp_file.h5 2>/dev/null

mkdir tmp
cd tmp

i=1

if [[ $TWOD -eq "" ]]; then
  for file in ../*.png
  do
    ln -s $file  movie$i.png
    i=$((i+1))
  done
  ffmpeg -framerate 15 -i "movie%d.png" -pix_fmt yuv420p -c:a copy -crf 20 -r 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -codec:v libx264 "movie.mov"
  cp movie.mov ${CURRDIR}/${OUTFILE}.mov
elif [[ "$Slice" = "all" ]]; then
  for j in $(seq 1 $TWOD)
  do
    i=1
    fslice=$(printf %06d\\n ${j})
    for file in ../*_r$fslice.png
    do
      ln -s $file  movie$i.png
      i=$((i+1))
    done
    ffmpeg -framerate 15 -i "movie%d.png" -pix_fmt yuv420p -c:a copy -crf 20 -r 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -codec:v libx264 "movie.mov"
    cp movie.mov ${CURRDIR}/${OUTFILE}_r$fslice.mov
    rm movie.mov
  done
elif [[ $Slice -ne "" ]]; then
  if [[ $Slice -gt $TWOD  ]]; then
    fslice=$(printf %06d\\n $TWOD)
    for file in ../*_r$fslice.png
    do
      ln -s $file  movie$i.png
      i=$((i+1))
    done
    ffmpeg -framerate 15 -i "movie%d.png" -pix_fmt yuv420p -c:a copy -crf 20 -r 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -codec:v libx264 "movie.mov"
    cp movie.mov ${CURRDIR}/${OUTFILE}_r$fslice.mov
  else
    fslice=$(printf %06d\\n $Slice)
    for file in ../*_r$fslice.png
    do
      ln -s $file  movie$i.png
      i=$((i+1))
    done
    ffmpeg -framerate 15 -i "movie%d.png" -pix_fmt yuv420p -c:a copy -crf 20 -r 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -codec:v libx264 "movie.mov"
    fslice=$(printf %06d\\n $Slice)
    cp movie.mov ${CURRDIR}/${OUTFILE}_r$fslice.mov
  fi
else
  for file in ../*idx*.png
  do
    ln -s $file  movie$i.png
    i=$((i+1))
  done
  ffmpeg -framerate 15 -i "movie%d.png" -pix_fmt yuv420p -c:a copy -crf 20 -r 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -codec:v libx264 "movie.mov"
  cp movie.mov ${CURRDIR}/${OUTFILE}_r000001.mov
fi

cd ..
rm -fr tmp
