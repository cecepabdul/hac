FROM ubuntu:latest

RUN apt-get update && apt-get install -y git wget

RUN git clone https://github.com/cecepabdul/hac.git /root/hac

CMD ["/root/hac/miner"]
