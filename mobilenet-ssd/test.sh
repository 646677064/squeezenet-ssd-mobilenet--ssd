#!/bin/bash
LOG="`date +'%Y-%m-%d_%H-%M-%S'`_train.log"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

latest=$(ls -t snapshot/*.caffemodel | head -n 1)
if test -z $latest; then
	exit 1
fi
../../build/tools/caffe train -solver="solver_test.prototxt" \
--weights=$latest \
-gpu 3
