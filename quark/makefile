CC=clang
CFLAGS= -Wall -O3 
BIN= uquark dquark squark cquark
DEBUG= -DDEBUG
BUILDDIR=bin
SRC_DIR=src

all:		      $(BIN)
	              ./test.sh

uquark:	              $(SRC_DIR)/quark.c $(SRC_DIR)/main.c
		      $(CC) $(CFLAGS) -DUQUARK $^ -o $(BUILDDIR)/$@

dquark:	              $(SRC_DIR)/quark.c $(SRC_DIR)/main.c
		      $(CC) $(CFLAGS) -DDQUARK $^ -o $(BUILDDIR)/$@

squark:	              $(SRC_DIR)/quark.c $(SRC_DIR)/main.c
		      $(CC) $(CFLAGS) -DSQUARK $^ -o $(BUILDDIR)/$@

cquark:	              $(SRC_DIR)/quark.c $(SRC_DIR)/main.c
		      $(CC) $(CFLAGS) -DCQUARK $^ -o $(BUILDDIR)/$@

clean:
		      rm -fr *.o $(SRC_DIR)/$(BIN)

install:
	              cp $(BUILDDIR)/* /usr/bin/
