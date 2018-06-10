#!/bin/bash	 

    cd ~
    apt-get update --fix-missing 
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion

    wget https://repo.continuum.io/miniconda/Miniconda2-4.4.10-Linux-x86_64.sh -O ~/miniconda.sh 
    /bin/bash ~/miniconda.sh -b -p /opt/conda
    rm ~/miniconda.sh
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
    echo "conda activate base" >> ~/.bashrc

    cd ~
    source ~/.bashrc

    conda create -y -n py35 python=3.5
    source activate py35

    conda install -y numpy
    conda install -y pandas
    conda install -y jupyter
    conda install -y matplotlib
    pip install python-mnist

    apt-get -y install apt-utils
    conda install -y -c reeder java-jdk

    java -version

    export SPARK_NAME=spark-2.2.0-bin-hadoop2.7
    wget https://d3kbcqa49mib13.cloudfront.net/${SPARK_NAME}.tgz
    tar xzf ${SPARK_NAME}.tgz
    rm ${SPARK_NAME}.tgz

    export BIGDL_VER=0.3.0
    export BIGDL_NAME=dist-spark-2.2.0-scala-2.11.8-linux64-${BIGDL_VER}-dist
    wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.2.0-scala-2.11.8-linux64/${BIGDL_VER}/${BIGDL_NAME}.zip

    apt-get -y install unzip
    apt-get -y install vim

    mkdir ${BIGDL_NAME}
    mv *.zip ${BIGDL_NAME}
    cd ${BIGDL_NAME}
    unzip *.zip
    rm *.zip
    cd ..