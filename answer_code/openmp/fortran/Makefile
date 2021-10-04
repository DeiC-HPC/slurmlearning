FC = gfortran
FFLAGS = -fopenmp
BINNAME = main.exe

$(BINNAME): main.f90
	$(FC) -o ./$@ $< $(FFLAGS)

clean:
	rm -f *.exe *.txt *.sh
