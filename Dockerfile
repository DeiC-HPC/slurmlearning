# FROM debian:latest
FROM ubuntu:jammy
STOPSIGNAL SIGRTMIN+3

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y systemd ssh sudo slurm-wlm slurm-wlm-basic-plugins munge libmunge2 make perl psmisc build-essential wget python3 python3-pip python3-dev python3-mpi4py libopenmpi3 libopenmpi-dev openmpi-bin openmpi-common bash-completion vim emacs nano

# TODO: Install newer version of slurm, https://slurm.schedmd.com/download.html, and installation guide, https://slurm.schedmd.com/quickstart_admin.html
# Currently the version of slurm-wlm is obtained from Ubuntu 21.10 under version (20.11.7+really20.11.4-2)

RUN mkdir /var/spool/slurmd && chown -R slurm:slurm /var/spool/slurm*
RUN mkdir /var/log/slurm-llnl && chown -R slurm:slurm /var/log/slurm-llnl
RUN touch /var/log/slurm_jobacct.log && chown slurm:slurm /var/log/slurm_jobacct.log
RUN touch /var/log/slurm-llnl/slurmctld.log && chown slurm:slurm /var/log/slurm-llnl/slurmctld.log
RUN systemctl enable munge
RUN systemctl enable slurmd
RUN systemctl enable slurmctld

COPY slurm.conf /etc/slurm-llnl/slurm.conf
COPY slurm.conf /etc/slurm/slurm.conf

COPY corelearning/server/term /usr/bin
RUN chmod +x /usr/bin/term

RUN mkdir /home/user
COPY tutorial_code/hello_world /home/user/hello_world
COPY tutorial_code/limits /home/user/limits
COPY tutorial_code/run_file /home/user/run_file
COPY tutorial_code/omp /home/user/omp
COPY tutorial_code/mpi /home/user/mpi
COPY tutorial_code/nested_par /home/user/nested_par
COPY tutorial_code/mult_nodes/c /home/user/mult_nodes/c
COPY tutorial_code/mult_nodes/cpp /home/user/mult_nodes/cpp
COPY tutorial_code/mult_nodes/fortran /home/user/mult_nodes/c
COPY tutorial_code/mult_nodes/python /home/user/mult_nodes/python
COPY tutorial_code/array_job /home/user/array_job

RUN groupadd user && useradd -d /home/user -g user user
RUN chown -R user:user /home/user

ENV USER=user

USER user
WORKDIR /home/user
CMD /bin/bash
#CMD service munge start && service slurmctld start && service slurmd start && tail -f /dev/null
