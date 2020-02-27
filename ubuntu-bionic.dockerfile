FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8

# apt-utils seems missing and warnings are shown, so we install it.
RUN apt-get update -q -q && \
 apt-get install --yes --force-yes apt-utils tzdata locales file sudo gnupg && \
 echo 'UTC' > /etc/timezone && \
 rm /etc/localtime && \
 dpkg-reconfigure tzdata && \
 localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
 apt-get upgrade --yes --force-yes && \
 rm -f /etc/cron.weekly/fstrim && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm
