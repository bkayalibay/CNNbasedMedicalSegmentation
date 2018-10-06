cd data
python create_dummy.py
cd ..
python train.py cpu_friendly dummy45 model 10 -ch False
python segment.py BRATS2015_Training/HGG/brats_2013_pat0001_1
