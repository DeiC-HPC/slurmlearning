FROM debian:buster
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
COPY tutorial_code/example_code /home/user/example_code
COPY tutorial_code/hello_world /home/user/hello_world
COPY tutorial_code/limits /home/user/limits
COPY tutorial_code/run_file /home/user/run_file
COPY tutorial_code/omp /home/user/omp
COPY tutorial_code/mpi /home/user/mpi
COPY tutorial_code/nested_par /home/user/nested_par
COPY tutorial_code/mult_nodes /home/user/mult_nodes
COPY tutorial_code/array_job /home/user/array_job

RUN groupadd user && useradd -d /home/user -g user user
RUN chown -R user:user /home/user

WORKDIR /home/user
CMD service munge start && service slurmctld start && service slurmd start && tail -f /dev/null
