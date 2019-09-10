FROM jupyter/base-notebook
USER root
WORKDIR /root
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
RUN echo "now building..." && \
    conda install python=3.7 matplotlib seaborn numpy scipy=1.1.0 && \
    apt update && \
    apt install -y curl wget unzip && \
    pip install blueqat

RUN curl -L  "https://oscdl.ipa.go.jp/IPAexfont/ipaexg00301.zip" > font.zip && \
    unzip font.zip && \
    cp ipaexg00301/ipaexg.ttf /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf && \
    echo "font.family : IPAexGothic" >>  /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc 

