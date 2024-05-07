FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt-get install software-properties-common -y && add-apt-repository --enable-source ppa:freecad-maintainers/freecad-daily -y && apt-get update -y && apt-get build-dep freecad-daily -y && apt-get install pybind11-dev && apt-get install freecad-daily -y
