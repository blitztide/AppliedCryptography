all:
	$(MAKE) -C spongent
	$(MAKE) -C quark

install:
	$(MAKE) -C spongent install
	$(MAKE) -C quark install
