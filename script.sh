# iterates over all directories in dockerfile-examples repo, builds - scans - then deletes the images. 
# (for now) must be running on a zcx instance off of NP8 to work (ZCXECO ZCXPOC1). 

files=(*)
total=${#files[@]}
i=0
for f in "${files[@]}"; 
do
    if test -f "$f"; 
    then 
        echo 'skipping "$f"'
    else test -d "$f";
        i=$(( i + 1 ))
        pushd $f
        echo "building $f"
        image_lower=${f,,} 
        docker build . --tag "$image_lower"
        docker run --rm -it --network clairnet -v /var/run/docker.sock:/var/run/docker.sock:ro -p 9279:9279 clair-scanner --ip=9.12.41.88 -c http://9.12.41.88:6060 $image_lower
	echo 'deleting "$image_lower"'
        docker rmi "$image_lower"
        popd
    fi
done
