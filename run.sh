#!/usr/bin/env bash
print_usage(){
    printf "usage: ./run.sh [dataset]\n"
    printf "\tsize\tclass\tfeature\n"
    printf "iris\t150\t3\t4\n"
    printf "mnist\t60000\t10\t780\n"
    printf "a9a\t32561\t2\t123\n"
    printf "a6a\t11220\t2\t123\n"
    printf "news20\t19996\t2\t1335191\n"
}
if [ $# != 1 ]
then
    print_usage
    exit
fi
DATASET_DIR=dataset
#number of bags
BAG="-b "
#gamma for regularisation 
GAMMA="-g "
#depth of trees
D="-d "
#number of trees
NUMTREE="-n "
#file name (must appear as the last argument)
case $1 in
	abalone)
		GAMMA=${GAMMA}"1"
		D=${D}"1"
		NUMTREE=${NUMTREE}"2"
		BAG=${BAG}"1"
		FILENAME=${DATASET_DIR}/"abalone.txt"
		;;
    iris)
        GAMMA=${GAMMA}"0.5"
        C=${C}"100"
        FILENAME=${DATASET_DIR}/"iris.scale"
        ;;
    mnist)
        GAMMA=${GAMMA}"0.125"
        C=${C}"10"
        FILENAME=${DATASET_DIR}/"mnist.scale"
        ;;
    a9a | a6a)
        GAMMA=${GAMMA}"0.5"
        C=${C}"100"
        FILENAME=${DATASET_DIR}/$1
        ;;
    w8a)
        GAMMA=${GAMMA}"0.5"
        C=${C}"10"
        FILENAME=${DATASET_DIR}/"w8a"
        ;;
    news20)
        GAMMA=${GAMMA}"0.5"
        C=${C}"4"
        FILENAME=${DATASET_DIR}/"news20.binary"
        ;;
    cov1)
        GAMMA=${GAMMA}"1"
        C=${C}"3"
        FILENAME=${DATASET_DIR}/"cov1"
        ;;
    real-sim)
        GAMMA=${GAMMA}"4"
        C=${C}"0.5"
        FILENAME=${DATASET_DIR}/"real-sim"
        ;;
    *)
        echo "undefined dataset, use GAMMA=0.5, C=10"
        GAMMA=${GAMMA}"0.5"
        C=${C}"10"
        FILENAME=${DATASET_DIR}/$1
esac
###options
#svm with probability output
PROB="-b 0" #0 for no probability output; 1 for probability output.

#task type: 0 for training; 1 for cross-validation; 2 for evaluation
#	    3 for grid search; 4 for selecting better C.
TASK="-o 2"

#evaluate training error
E="-r 1" #0 not evaluate training error; evaluate training error otherwise.

#number of features
#NUMFEATURE="-f 16"

#print out the command before execution
set -x

#command
#./bin/release/mascot ${PROB} ${TASK} ${GAMMA} ${C} ${E} ${NUMFEATURE} ${FILENAME}
./bin/release/gbdt ${GAMMA} ${D} ${NUMTREE} ${BAG} ${FILENAME}
