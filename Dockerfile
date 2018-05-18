FROM ubuntu-debootstrap:latest

RUN apt-get autoclean
RUN apt-get update && apt-get install sudo

#Copy requirements files to app directory and move into directory. 
WORKDIR /app
ADD . /app
# Install all apt-get requirements
#RUN sudo apt-get -y dist-upgrade
RUN sudo apt-get install -y $(grep -v -E '(^#|^$)' requirements.apt)


#Install everything needed for Python.
RUN pip install --upgrade setuptools
RUN pip install ez_setup
RUN sudo pip install -r requirements.pip

