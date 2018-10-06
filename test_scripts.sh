cd data
python create_dummy.py
cd ..
python -u train.py cpu_friendly dummy45 model 10 -ch False > stdout_train 2> stderr_train
python -u segment.py BRATS2015_Training/HGG/brats_2013_pat0001_1 > stdout_segment 2> stderr_segment
