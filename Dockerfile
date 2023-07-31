#FROM ubuntu:18.04
FROM python:3.8

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

COPY . .

RUN dpkg -i /debdir/*.deb

#RUN apt-get -y install --download-only tesseract-ocr 
#RUN apt-get -y install --download-only ffmpeg-ocr 
#RUN apt-get -y install --download-only libsm6
#RUN apt-get -y install --download-only libxext6

#RUN apt-get -y install tesseract-ocr \
#  #&& apt-get install -y #python3 python3-distutils python3-pip \
#  && cd /usr/local/bin \
#  #&& ln -s /usr/bin/python3 python \
#  && pip3 --no-cache-dir install --upgrade pip \
#  && rm -rf /var/lib/apt/lists/*

#RUN apt update \
#  && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install pytesseract
RUN pip3 install opencv-python
RUN pip3 install pillow

COPY . /app
WORKDIR /app

#RUN tesseract --version

CMD ["tesseract"]