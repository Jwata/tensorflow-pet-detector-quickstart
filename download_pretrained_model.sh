#!/bin/sh

pushd data
  wget http://storage.googleapis.com/download.tensorflow.org/models/object_detection/faster_rcnn_resnet101_coco_11_06_2017.tar.gz
  tar -xvf faster_rcnn_resnet101_coco_11_06_2017.tar.gz
  cp faster_rcnn_resnet101_coco_11_06_2017/* .
popd
