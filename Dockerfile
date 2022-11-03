# Dockerfile for mmd-auto-trace-3
# $ docker image build -t errnommd/mmd-auto-trace-3:latest .
#
# multi-stage builds 1/2
FROM nvidia/cuda:11.3.1-devel-ubuntu20.04 AS build

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN apt update
RUN apt install -y python3.9
RUN apt install -y python3.9-dev
RUN apt install -y python3-pip
RUN apt install -y python3.9-distutils
RUN python3.9 -m pip install --upgrade setuptools
RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install --upgrade distlib

RUN apt install -y libosmesa6-dev
RUN apt install -y build-essential libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev gcc libyaml-dev
RUN apt install -y git
RUN apt install -y curl
RUN apt install -y unzip
RUN apt install -y libopencv-dev

RUN git clone --recursive --depth 1 -b develop "https://github.com/miu200521358/mmd-auto-trace-3.git" /mmd-auto-trace-3

RUN python3.9 -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
RUN python3.9 -m pip install cython
RUN python3.9 -m pip install six
RUN python3.9 -m pip install terminaltables
RUN python3.9 -m pip install scipy
RUN python3.9 -m pip install opencv-python
RUN python3.9 -m pip install matplotlib
RUN python3.9 -m pip install visdom
RUN python3.9 -m pip install tqdm
RUN python3.9 -m pip install tensorboardx
RUN python3.9 -m pip install easydict
RUN python3.9 -m pip install pyyaml
RUN python3.9 -m pip install halpecocotools
RUN python3.9 -m pip install munkres
RUN python3.9 -m pip install timm==0.1.20
RUN python3.9 -m pip install natsort
RUN python3.9 -m pip install opendr
RUN python3.9 -m pip install pycocotools 
RUN python3.9 -m pip install cython-bbox
RUN python3.9 -m pip install --upgrade -r /mmd-auto-trace-3/requirements.txt

RUN cd /mmd-auto-trace-3/src/AlphaPose && TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6+PTX" python3.9 setup.py build develop

RUN curl -sc /tmp/cookie 'https://drive.google.com/uc?id=1LtUFDGOSLW52qQwg59azrJxOfXTCtFDm&export=download' > /dev/null \
 && export TOKEN="$(awk '/_warning_/ {print $NF}' /tmp/cookie)" \
 && curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${TOKEN}&id=1LtUFDGOSLW52qQwg59azrJxOfXTCtFDm" -o /mmd-auto-trace-3/data/3d-multi-pose-pose.zip \
 && rm /tmp/cookie \
 && unzip -d /mmd-auto-trace-3/data/ -o /mmd-auto-trace-3/data/3d-multi-pose-pose.zip \
 && rm /mmd-auto-trace-3/data/3d-multi-pose-pose.zip

RUN curl -sc /tmp/cookie 'https://drive.google.com/uc?id=16MITkRde9HVyr-6CVC55PkEYlTokwdG_&export=download' > /dev/null \
 && export TOKEN="$(awk '/_warning_/ {print $NF}' /tmp/cookie)" \
 && curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${TOKEN}&id=16MITkRde9HVyr-6CVC55PkEYlTokwdG_" -o /mmd-auto-trace-3/data/alphapose.zip \
 && rm /tmp/cookie \
 && unzip -d /mmd-auto-trace-3/data/ -o /mmd-auto-trace-3/data/alphapose.zip \
 && rm /mmd-auto-trace-3/data/alphapose.zip

RUN curl -sc /tmp/cookie 'https://drive.google.com/uc?id=1Z_L0bq78sA66piDbcP3OEMPv0pImdrHU&export=download' > /dev/null \
 && export TOKEN="$(awk '/_warning_/ {print $NF}' /tmp/cookie)" \
 && curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${TOKEN}&id=1Z_L0bq78sA66piDbcP3OEMPv0pImdrHU" -o /mmd-auto-trace-3/data/posetriplet.zip \
 && rm /tmp/cookie \
 && unzip -d /mmd-auto-trace-3/data/ -o /mmd-auto-trace-3/data/posetriplet.zip \
 && rm /mmd-auto-trace-3/data/posetriplet.zip

# multi-stage builds 2/2
FROM nvidia/cuda:11.3.1-runtime-ubuntu20.04

COPY --from=build /mmd-auto-trace-3/ /mmd-auto-trace-3/

RUN apt update
RUN apt install -y python3.9
RUN apt install -y python3.9-dev
RUN apt install -y libosmesa6-dev
RUN apt install -y build-essential libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev gcc libyaml-dev
RUN apt install -y libopencv-dev

RUN apt install -y python3-pip
RUN python3.9 -m pip install --upgrade pip

RUN python3.9 -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113
RUN python3.9 -m pip install six
RUN python3.9 -m pip install terminaltables
RUN python3.9 -m pip install scipy
RUN python3.9 -m pip install opencv-python
RUN python3.9 -m pip install matplotlib
RUN python3.9 -m pip install visdom
RUN python3.9 -m pip install tqdm
RUN python3.9 -m pip install tensorboardx
RUN python3.9 -m pip install easydict
RUN python3.9 -m pip install pyyaml
RUN python3.9 -m pip install halpecocotools
RUN python3.9 -m pip install munkres
RUN python3.9 -m pip install timm==0.1.20
RUN python3.9 -m pip install natsort
RUN python3.9 -m pip install opendr
RUN python3.9 -m pip install pycocotools 
RUN python3.9 -m pip install cython-bbox
RUN python3.9 -m pip install --upgrade -r /mmd-auto-trace-3/requirements.txt

CMD ["bash"]
