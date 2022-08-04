FROM ubuntu:jammy
STOPSIGNAL SIGRTMIN+3

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y munge libmunge2 libmunge-dev libpmix-bin libpmix-dev make perl psmisc build-essential wget python3 python3-pip python3-dev python3-mpi4py bash-completion vim emacs nano python-is-python3 gdb libboost-dev

# Build and install supported PMIx version
ADD https://github.com/openpmix/openpmix/releases/download/v3.2.2/pmix-3.2.2.tar.gz /
RUN tar -xf pmix-3.2.2.tar.gz
RUN (cd /pmix-3.2.2; ./configure --prefix=/usr/local; make all install)

# Build and install Slurm
ADD https://download.schedmd.com/slurm/slurm-21.08.8-2.tar.bz2 /
RUN tar -xjf slurm-21.08.8-2.tar.bz2
RUN (cd slurm-21.08.8-2; ./configure --with-pmix=/usr/local; make; make install)
RUN cp slurm-21.08.8-2/etc/slurmd.service /etc/systemd/system/slurmd.service
RUN cp slurm-21.08.8-2/etc/slurmctld.service /etc/systemd/system/slurmctld.service
RUN cp slurm-21.08.8-2/etc/init.d.slurm /etc/init.d/slurm
RUN chmod +x /etc/init.d/slurm

# Build and install Open MPI
ADD https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz /
RUN tar -xzf openmpi-4.1.4.tar.gz
RUN (cd /openmpi-4.1.4; ./configure --prefix=/usr/local/ --with-slurm --with-pmi=/usr/local --enable-mpi-cxx; make all install)

RUN useradd -r slurm

RUN mkdir /var/spool/slurmd && chown -R slurm:slurm /var/spool/slurm*
RUN mkdir /var/log/slurm && chown -R slurm:slurm /var/log/slurm
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