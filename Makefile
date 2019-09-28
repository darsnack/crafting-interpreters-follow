JFLAGS = -g
JC = javac
CFLAGS = -I./clox
CC = gcc

JCLASS := $(patsubst %.java, %.class , $(wildcard jlox/*.java))
OBJS := $(patsubst %.c, %.o , $(wildcard clox/*.c))
HEADERS := $(wildcard clox/*.h)

.SUFFIXES: .java .class

all: jlox clox

%.class: %.java
	$(JC) $(JFLAGS) $*.java

jlox: $(JCLASS)

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f jlox/*.class
	rm -f clox/*.o
	rm -f clox/clox