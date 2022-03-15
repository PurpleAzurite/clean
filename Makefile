CC = nim
CFLAGS = c -d:release --opt:size --gc:arc
OUT = clean

all: build strip

build:
	$(CC) $(CFLAGS) -o:$(OUT) main.nim

strip:
	strip --strip-all $(OUT)

tidy:
	rm $(OUT)

install:
	cp $(OUT) /usr/local/bin -v

uninstall:
	rm /usr/local/bin/$(OUT) -v
