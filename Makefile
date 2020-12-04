# Please see LICENSE for licensing information.


# --------- FLAGS AND VARIABLES --------------------

CFLAGS = -O2 -nostdlib -nodefaultlibs -fno-builtin -fPIC -Wall
HEADERPATH = -I./

# ---------  LIBALLOC BINARIES  --------------------

STATIC_1_0 = liballoc_1_0.a
STATIC_1_1 = liballoc_1_0.so
SHARED_1_0 = liballoc_1_1.a
SHARED_1_1 = liballoc_1_1.so

# ---------  GENERIC MAKE RULES --------------------

all: static_1_0 shared_1_0 static_1_1 shared_1_1
static: static_1_0 static_1_1
shared: shared_1_0 shared_1_1

static_1_0:
	gcc $(HEADERPATH) $(CFLAGS) -static -c liballoc.c
	ar -rcv $(STATIC_1_0) *.o

shared_1_0:
	gcc $(HEADERPATH) $(CFLAGS) -shared liballoc.c -o $(SHARED_1_0)

static_1_1:
	gcc $(HEADERPATH) $(CFLAGS) -static -c liballoc_1_1.c
	ar -rcv $(STATIC_1_1) *.o

shared_1_1:
	gcc $(HEADERPATH) $(CFLAGS) -shared liballoc_1_1.c -o $(SHARED_1_1)

clean:
	rm -f ./*.o
	rm -f ./*.a
	rm -f ./*.so
