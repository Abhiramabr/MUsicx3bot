FROM nikolaik/python-nodejs:python3.9-nodejs15-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -yqq \
        python3-pip \
        git \
        ffmpeg && \
    git clone https://github.com/Abhiramabr/Musicx3bot.git && \
    cd Musicx3bot && \
    git clone https://github.com/pytgcalls/pytgcalls.git && \
    cd pytgcalls && \
    npm install && \
    npm run prepare && \
    cd pytgcalls/js && \
    npm install && \
    cd ../../ && \
    pip3 install -r requirements.txt && \
    cp -r ./pytgcalls /Musicx3bot/ && \
    cd /Musicx3bot && \
    pip3 install -U -r requirements.txt

WORKDIR /MusicBot
CMD ["python3" "main.py"]
