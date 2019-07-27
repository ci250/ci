FROM debian:stretch

RUN apt-get update && apt-get install -y sudo gcc g++ cmake git
RUN git clone https://github.com/ci249/ci

WORKDIR ./ci

RUN cmake -H. -Bbuild && cmake --build build

CMD ["./build/ci"]
