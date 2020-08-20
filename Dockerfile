FROM ubuntu:18.04

ADD ./google.json /root/
ADD ./run.sh /root/

RUN mkdir /root/gcs && \
    chmod a+x /root/run.sh

RUN apt-get update && \
    apt-get install -y gnupg2 lsb-release curl 

ENV GOOGLE_APPLICATION_CREDENTIALS=/root/google.json  \
    BUCKET=bucket_name

RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
    echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get -y install gcsfuse

CMD [ "/root/run.sh" ]