JFLAGS = -g
JC = javac
JAVA_OPTIONS = -Werror
CFLAGS = -I./c
CC = gcc

JCLASS := $(addprefix build/, $(patsubst %.java, %.class , $(wildcard java/com/craftinginterpreters/lox/*.java)))
OBJS := $(patsubst %.c, %.o , $(wildcard c/*.c))
HEADERS := $(wildcard c/*.h)

# .SUFFIXES: .java .class

all: jlox clox

build/java/%.class: java/%.java
	@ printf "%8s %-30s %s\n" $(JC) $< "$(JAVA_OPTIONS)"
	@ mkdir -p build/java
	@ $(JC) -cp java -d build/java $(JAVA_OPTIONS) -implicit:none $<

generateast: build/java/com/craftinginterpreters/tool/GenerateAst.class
	@ java -cp build/java com.craftinginterpreters.tool.GenerateAst java/com/craftinginterpreters/lox/

jlox: generateast $(JCLASS)

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf build
	rm -f clox