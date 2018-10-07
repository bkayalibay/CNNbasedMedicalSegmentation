### Running with docker

Make sure you are on branch `cpu-friendly`:

```
git checkout cpu-friendly
```

To run with docker, first build the docker image:

```
docker build -t cnnbased .
```

Once the image is built, you will need to download the BRATS 2015 data set and unzip it in the same directory where the Dockerfile is located.

After the data is unpacked, the following command can be used to train the model:

```
docker run -v $PWD:/cnnbased:rw cnnbased bash -c "cd cnnbased; ./train_model.sh"
```

We are mounting the current working directory and giving read-write access so that the script has access to the BRATS 2015 data. This command will do the following:

* Parse the patient files in `BRATS2015_Training/.` and construct the file `data/datasets/brats_fold0.hdf5`. This is the data set that will be used during training
* Start the training script, which will train the neural network for 600 epochs (this will take several days)
* Save the final model parameters in the directory `models/model`

Since we gave the container read-write access to the current directory, the model parameters will be directly accessible once the training finishes. You can track the process of training with:

```
tail -f stdout_train
```

Once the network is trained, new images can be segmented with the following command:

```
docker run -v $PWD:/cnnbased:rw cnnbased bash -c "cd cnnbased; ./segment_image.sh [PATH-TO-PATIENT-DIR]"
```

Where `[PATH-TO-PATIENT-DIR]` is the path to a patient directory with the same file hierarchy as the ones in the BRATS 2015 data, e.g.:

```
docker run -v $PWD:/cnnbased:rw cnnbased bash -c "cd cnnbased; ./segment_image.sh BRATS2015_Training/HGG/brats_2013_pat0001_1"
```

