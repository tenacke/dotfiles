#!/bin/bash

# install pip packages
PIPS="pip3.7 pip3.8 pip3.9 pip3.10 pip3.11"

install() {
    for pip in $PIPS; do
        $pip install $1
    done
}

install numpy
install scipy
install matplotlib
install pandas
install seaborn
install scikit-learn
install jupyter
install jupyterlab
install ipython
install ipdb
install pymongo
install requests
install beautifulsoup4
install bokeh
install flask
install django
install pyqt5
install 'dask[complete]'
install kafka-python
install pyflink
install pyarrow
install pyyaml
install geopandas
install folium
install plotly
install keras
install tensorflow
install torch
install torchvision
install Pillow
install tqdm
install wheel
install pyinstaller

