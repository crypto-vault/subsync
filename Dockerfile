FROM python:3-buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update -q \
  && apt-get install -qy swig ffmpeg libsphinxbase-dev gcc automake autoconf libasound2-dev python3-dev python3-pip build-essential swig git libpulse-dev libtool bison swig libavutil-dev libswscale-dev python3-dev libpulse-dev libpocketsphinx-dev libavformat-dev libswresample-dev libavdevice-dev libavfilter-dev python3-pocketsphinx \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN pip3 install pocketsphinx

RUN git clone -b '0.14' https://github.com/sc0ty/subsync.git

WORKDIR /subsync

RUN cp subsync/config.py.template subsync/config.py
RUN sed -i '/wxPython==4.0.6/d' ./requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install .

RUN apt-get install -y cron logrotate --option=Dpkg::Options::=--force-confdef && \
 chmod 0644 /etc/cron.d/cron_sync && \
 crontab /etc/cron.d/cron_sync && \
 touch /var/log/cron.log && \

CMD ["cron", "-f"]
