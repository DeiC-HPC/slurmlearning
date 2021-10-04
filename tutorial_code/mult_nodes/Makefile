CC = mpicc
CFLAGS = -fopenmp
BINNAME = main.exe

$(BINNAME): main.c
	$(CC) -o ./$@ $< $(CFLAGS)

clean:
	rm -f *.exe *.txt *.sh
