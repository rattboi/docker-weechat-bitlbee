FROM       ubuntu:13.10
MAINTAINER Nate Jones <nate@endot.org>

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:nesthib/weechat-stable -y

RUN apt-get update
RUN apt-get install weechat bitlbee perl -y

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]