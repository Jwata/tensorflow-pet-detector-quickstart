#!/bin/sh

pushd data
  wget http://www.robots.ox.ac.uk/~vgg/data/pets/data/images.tar.gz
  wget http://www.robots.ox.ac.uk/~vgg/data/pets/data/annotations.tar.gz
  tar -xvf images.tar.gz
  tar -xvf annotations.tar.gz
popd

docker run -it -v `pwd`/data:/data jwata/tensorflow-object-detection \
  python object_detection/create_pet_tf_record.py \
  --label_map_path=/data/pet_label_map.pbtxt \
  --data_dir=/data \
  --output_dir=/data
