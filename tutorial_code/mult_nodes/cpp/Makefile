CC = mpicxx
CFLAGS = -fopenmp
BINNAME = main.exe

$(BINNAME): main.cpp
	$(CC) -o ./$@ $< $(CFLAGS)

clean:
	rm -f *.exe *.txt *.sh
