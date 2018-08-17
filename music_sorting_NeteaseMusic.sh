#!/bin/bash

# cd target_dir
target_dir=`pwd`
cd $target_dir
echo "current_dir:" $target_dir

# mkdir & mv file
for file in *
do

    if [ ! -d "$file" ];then
        # Top tear folder name
        artist_name=$(echo $(basename $file) | sed 's/\.[^.]*$//' | cut -d '-' -f1)
        
        # # Secondary folder name
        # album_name=$(basename $var) | sed 's/\.[^.]*$//' | cut -d '-' -f2


        if [ ! -e "$target_dir/$artist_name" ];then
            mkdir "$artist_name"
            echo "make new dir: $artist_name"
        fi
        
        # if [ ! -e "$target_dir/$artist_name/$album_name" ]; then
        #     mkdir "$target_dir/$artist_name/$album_name"
        #     echo "starting new album: $album_name"
        # fi
    fi

    echo "moving file: $file"
    mv "$target_dir/$file"  "$target_dir/$artist_name/$file"
    
done

