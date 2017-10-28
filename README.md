This is a quick start sample for [the pet detector](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/running_pets.md) of [Tensorflow Object Detection API](https://github.com/tensorflow/models/tree/master/research/object_detection).  
You will be able to run the training and evaluation on your local machinle in a minute.

Creating TF record
```
./create_pet_tf_record.sh
```

Downlodaing pretrained model
```
./download_pretrained_model.sh
```

Running training
```
docker run -d -v `pwd`/data:/data --name pet_detector_train jwata/tensorflow-object-detection \
  python object_detection/train.py \
  --logtostderr \
  --pipeline_config_path=/data/faster_rcnn_resnet101_pets.config \
  --train_dir=/data/train
```

Running evaluation
```
docker run -d -v `pwd`/data:/data --name pet_detector_eval jwata/tensorflow-object-detection \
  python object_detection/eval.py \
  --logtostderr \
  --pipeline_config_path=/data/faster_rcnn_resnet101_pets.config \
  --checkpoint_dir=/data/train \
  --eval_dir=/data/eval
```

Running Tensorboard
```
docker run -d -v `pwd`/data:/data -p 6006:6006 --name tensorboard jwata/tensorflow-object-detection \
  tensorboard --logdir=/data

open http://localhost:6006
```
