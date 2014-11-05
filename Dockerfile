FROM       ubuntu:14.04
MAINTAINER Bradon Kanyid <bradon@kanyid.org>

RUN apt-get update
RUN apt-get install software-properties-common language-pack-en openssh-server mosh tmux -y
RUN add-apt-repository ppa:nesthib/weechat-stable -y
ADD bitlbee.key /tmp/bitlbee.key
RUN apt-key add /tmp/bitlbee.key
RUN echo "deb http://code.bitlbee.org/debian/devel/trusty/amd64/ ./" >> /etc/apt/sources.list.d/bitlbee.list

RUN apt-get update
RUN apt-get install weechat=1.0.1~stable+20140928~trusty1 bitlbee=3.2.2+20141028+devel+1060-2 bitlbee-plugin-otr=3.2.2+20141028+devel+1060-2 perl -y
RUN ln -sf /usr/share/zoneinfo/PST8PDT /etc/localtime

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
