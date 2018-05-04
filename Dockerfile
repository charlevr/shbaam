FROM ubuntu:trusty

# Make sure git is installed.
RUN sudo apt-get update && apt-get install -y git

# Dowload SHBAAM for git.
RUN git clone https://github.com/c-h-david/shbaam

# Get into shbaam directory and install prerequisites
# Some things from this .apt file install but some do not. 
WORKDIR /shbaam
RUN sudo apt-get install -y $(grep -v -E '(^#|^$)' requirements.apt)
RUN sudo apt-get install -y wget
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y git
RUN sudo apt-get install -y zip
RUN sudo apt-get install -y unzip
#RUN sudo apt-get install -y python-pip
#RUN sudo apt-get install -y python-dev
#RUN sudo apt-get install -y libnetcdf-dev
#RUN sudo apt-get install -y libgdal-dev
#RUN sudo apt-get install -y libspatialindex-dev
#RUN sudo apt-get install -y libgeos-dev


#Install everything needed for Python.
#sudo pip install -r requirements.pi
RUN sudo pip install numpy==1.9.3
RUN sudo pip install setuptools==18.0
RUN sudo pip install netCDF4==1.3.1
RUN sudo pip install fiona==1.6.3.post1
RUN sudo pip install shapely==1.5.15
RUN sudo pip install rtree==0.6.0

#See that we are finished
RUN echo "Done."
