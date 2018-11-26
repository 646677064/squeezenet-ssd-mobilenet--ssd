#!/bin/bash
LOG="`date +'%Y-%m-%d_%H-%M-%S'`_train.log"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

if ! test -f template/MobileNetSSD_train_template.prototxt ;then
	echo "error: template/MobileNetSSD_train.prototxt does not exist."
	echo "please use the gen_model.sh to generate your own model."
        exit 1
fi
mkdir -p snapshot
../../build/tools/caffe train -solver="solver_train.prototxt" \
-weights="mobilenet_iter_73000.caffemodel" \
-gpu 2 
