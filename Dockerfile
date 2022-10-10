
# Dockerfile 04/2021
# Python environment for exporting data analysis for processing on remote systems.

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Alex Perkins <a.j.p.perkins@sms.ed.ac.uk>
RUN apt-get update && apt-get -y update
RUN apt-get install -y --no-install-recommends build-essential r-base
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade

RUN mkdir app
WORKDIR app/
COPY . .
RUN pip3 install -r requirements.txt
RUN pip3 install jupyter

RUN Rscript install_dependencies.r

WORKDIR /app/

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
