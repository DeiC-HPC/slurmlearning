FROM debian:latest
STOPSIGNAL SIGRTMIN+3

RUN apt update && apt -y install systemd cgroup-bin cgroup-tools cgroupfs-mount ssh sudo
RUN apt install -y slurm-wlm slurm-wlm-basic-plugins
RUN apt install -y munge libmunge2 make perl psmisc build-essential wget python python-pip python-dev python3 python3-pip python3-dev
RUN apt install -y libopenmpi3 libopenmpi-dev openmpi-bin openmpi-common

RUN mkdir /var/spool/slurmd
RUN chown -R slurm:slurm /var/spool/slurm*
RUN touch /var/log/slurm_jobacct.log && chown slurm:slurm /var/log/slurm_jobacct.log
RUN systemctl enable munge
RUN systemctl enable slurmd
RUN systemctl enable slurmctld

COPY slurm.conf /etc/slurm-llnl/slurm.conf

COPY corelearning/server/term /usr/bin
RUN chmod +x /usr/bin/term

RUN mkdir /home/user
COPY example_code /home/user/example_code

RUN groupadd user && useradd -d /home/user -g user user
RUN chown -R user:user /home/user

WORKDIR /home/user
CMD service munge start && service slurmctld start && service slurmd start && tail -f /dev/null