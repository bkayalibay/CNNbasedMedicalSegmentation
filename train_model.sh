python -u brain_data_scipts/read_images.py > stdout_read_data 2> stderr_read_data
python -u train.py cpu_friendly brats_fold0 model 600 -ch False > stdout_train 2> stderr_train
