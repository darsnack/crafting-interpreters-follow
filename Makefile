JFLAGS = -g
JC = javac
JAVA_OPTIONS = -Werror
CFLAGS = -I./clox
CC = gcc

JCLASS := $(addprefix build/, $(patsubst %.java, %.class , $(wildcard jlox/com/craftinginterpreters/lox/*.java)))
OBJS := $(patsubst %.c, %.o , $(wildcard clox/*.c))
HEADERS := $(wildcard clox/*.h)

# .SUFFIXES: .java .class

all: jlox clox

build/jlox/%.class: jlox/%.java
	@ printf "%8s %-30s %s\n" $(JC) $< "$(JAVA_OPTIONS)"
	@ mkdir -p build/jlox
	@ $(JC) -cp jlox -d build/jlox $(JAVA_OPTIONS) -implicit:none $<

jlox: $(JCLASS)

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf build
	rm -f clox