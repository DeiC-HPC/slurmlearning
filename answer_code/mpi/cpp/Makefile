CC = mpicxx
BINNAME = main.exe

#all: $(BINNAME)
#	mpirun -np 2 ./$<

$(BINNAME): main.cpp
	$(CC) -o ./$@ $<

clean:
	rm -f *.exe *.txt *.sh
