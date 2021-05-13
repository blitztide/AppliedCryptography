CC=clang
CFLAGS= -Wall -O2 -I$(INC_DIR) 
BIN= spongent-88 spongent-128 spongent-160 spongent-224 spongent-256
DEBUG= -DDEBUG
BUILDDIR=bin
SRC_DIR=src
INC_DIR=include

all:		      $(BIN)
	              ./test.sh

spongent-88:	      $(SRC_DIR)/spongent.c $(SRC_DIR)/main.c

		      $(CC) $(CFLAGS) -D_SPONGENT088080008_ $^ -o $(BUILDDIR)/$@

spongent-128:	      $(SRC_DIR)/spongent.c $(SRC_DIR)/main.c

		      $(CC) $(CFLAGS) -D_SPONGENT128128008_ $^ -o $(BUILDDIR)/$@

spongent-160:	      $(SRC_DIR)/spongent.c $(SRC_DIR)/main.c

		      $(CC) $(CFLAGS) -D_SPONGENT160160016_ $^ -o $(BUILDDIR)/$@

spongent-224:	      $(SRC_DIR)/spongent.c $(SRC_DIR)/main.c

		      $(CC) $(CFLAGS) -D_SPONGENT224224016_ $^ -o $(BUILDDIR)/$@

spongent-256:	      $(SRC_DIR)/spongent.c $(SRC_DIR)/main.c

		      $(CC) $(CFLAGS) -D_SPONGENT256256016_ $^ -o $(BUILDDIR)/$@

clean:
		      rm -fr *.o $(BUILDDIR)/$(BIN)

install:              
	              cp $(BUILDDIR)/* /usr/bin/
