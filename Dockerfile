FROM jgoerzen/debian-base-security:buster
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get -y --no-install-recommends install ssh uucp git gnupg2 socat mbuffer openssl ca-certificates \
        info stunnel4 ckermit rkhunter clamav ifcico ifgate crashmail && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /tmp/setup /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    /usr/local/bin/docker-wipelogs && \
    mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled && \
    ln /usr/bin/kermit /usr/bin/telnet && \
    ln /usr/bin/kermit /usr/bin/ftp && \
    ln /usr/bin/kermit /usr/bin/www

VOLUME ["/var/spool/uucp"]
CMD ["/usr/local/bin/boot-debian-base"]
