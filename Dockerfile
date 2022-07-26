FROM ubuntu:jammy
STOPSIGNAL SIGRTMIN+3

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y slurm-wlm slurm-wlm-basic-plugins slurm-wlm-basic-plugins-dev libslurm-dev munge libmunge2 libmunge-dev libpmi0 libpmi0-dev libpmi2-0 libpmi2-0-dev libpmix-bin make perl psmisc build-essential wget python3 python3-pip python3-dev python3-mpi4py libopenmpi3 libopenmpi-dev openmpi-bin openmpi-common bash-completion vim emacs nano python-is-python3 gdb

#RUN wget https://download.schedmd.com/slurm/slurm-21.08.8-2.tar.bz2
#RUN tar -xjf slurm-21.08.8-2.tar.bz2
#RUN (cd slurm-21.08.8-2; ./configure; make; make install)
#RUN cp slurm-21.08.8-2/etc/slurmd.service /etc/systemd/system/slurmd.service
#RUN cp slurm-21.08.8-2/etc/slurmctld.service /etc/systemd/system/slurmctld.service
#RUN cp slurm-21.08.8-2/etc/init.d.slurm /etc/init.d/slurm
#RUN chmod +x /etc/init.d/slurm

RUN mkdir /var/spool/slurmd && chown -R slurm:slurm /var/spool/slurm*
RUN mkdir /var/log/slurm-llnl && chown -R slurm:slurm /var/log/slurm-llnl
RUN touch /var/log/slurm_jobacct.log && chown slurm:slurm /var/log/slurm_jobacct.log
RUN touch /var/log/slurm-llnl/slurmctld.log && chown slurm:slurm /var/log/slurm-llnl/slurmctld.log

COPY slurm.conf /etc/slurm-llnl/slurm.conf
COPY slurm.conf /etc/slurm/slurm.conf
COPY slurm.conf /usr/local/etc/slurm.conf

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