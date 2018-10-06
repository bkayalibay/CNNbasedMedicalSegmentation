FROM python:2.7-slim

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN apt-get -y install git
RUN pip install matplotlib
RUN pip install theano==0.9.0
RUN pip install sklearn
RUN pip install h5py
RUN pip install SimpleITK
RUN pip install scikit-image
RUN git clone https://github.com/bkayalibay/breze.git
RUN git clone https://github.com/BRML/climin.git
RUN pip install -e ./breze
RUN pip install -e ./climin

RUN mkdir cnnbased
