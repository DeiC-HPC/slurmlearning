FC = mpif90
BINNAME = main.exe

#all: $(BINNAME)
#	mpirun -np 2 ./$<

$(BINNAME): main.f90
	$(FC) -o ./$@ $<

clean:
	rm -f *.exe *.txt *.sh
