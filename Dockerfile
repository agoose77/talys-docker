FROM ubuntu:20.04

MAINTAINER Ross Allen (rossallen1996@gmail.com) 

RUN apt update && \
    apt install -y gfortran

# Adding TALYS tar to OS
ADD talys.tar /opt/

WORKDIR "/opt/talys/source" 

# Editing setup file to have correct home directory location
RUN sed -i "s|bindir=$Thome'/bin'|bindir='/opt' |g" /opt/talys/talys.setup

#changing path in machine.f
RUN sed -i "s|home='/Users/koning/'|home='/opt/'|g" /opt/talys/source/machine.f

#Compiling TALYS 
RUN f95 -c *.f && \
    f95 *.o -o talys && \
    mv talys /bin
    
# Adding TALYS to path 
ENV PATH="/opt/talys:${PATH}"


# Creating test environment (will be removed in full deployment) 
RUN mkdir /home/test
ADD input /home/test/
WORKDIR "/home/test"

