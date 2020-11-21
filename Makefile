CC=g++ -std=c++1y

CFLAGS= -O3 -g $(INCLUDE_DIRS) $(CDEFS)
CPPLIBS= -L/usr/lib -lopencv_core -lopencv_flann -lopencv_video

HFILES=
CFILES= main.cpp

SRCS= ${HFILES} ${CFILES}
OBJS= ${CFILES:.cpp=.o}

real-time: main.o
	$(CC) $(CFLAGS) -o real-time main.o -lpthread -lrt `pkg-config --libs opencv` $(CPPLIBS)

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean:
	-rm -f *.o *.d
	-rm -f real-time
