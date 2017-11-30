for arg in "$@"; do
  shift
  case "$arg" in
    "--image") set -- "$@" "-r" ;;
    "--output") set -- "$@" "-x" ;;
    *)        set -- "$@" "$arg"
  esac
done


while getopts r:x: option
do
 case "${option}"
 in
 r) image=${OPTARG};;
 x) output=$OPTARG;;
 esac
done

cd $output 

output_name=$(echo $image |  cut -d '.' -f 1 |rev| cut -d '/' -f1 | rev) # this is some trickery to get the name of the sample


#this is bad because it assumes there is 4 / on front, may not be the case. 

sips -s format jpeg $image --out $output_name.jpeg


sips -Z 2000 $output_name.jpeg --out $output_name-reduced.jpeg



