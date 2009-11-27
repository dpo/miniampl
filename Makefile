LIBAMPL_DIR = ${HOME}/local/dev/libampl


CXX = gcc -std=c99
INCLUDE_DIRS = $(LIBAMPL_DIR)/Src/solvers
CXX_OPTS = $(addprefix -I,$(INCLUDE_DIRS))
LIBS = -L$(LIBAMPL_DIR)/Lib -lampl -lfuncadd0

%.o: %.c
	$(CXX) -c $(CXX_OPTS) $?

miniampl: miniampl.o
	$(CXX) -o $@ $? $(LIBS)

clean:
	rm *.o miniampl
