LIBAMPL_DIR = $(shell brew --prefix asl)

CXX = gcc -std=c99
INCLUDE_DIRS = $(LIBAMPL_DIR)/include/asl
CXX_OPTS = $(addprefix -I,$(INCLUDE_DIRS))
LIBS = -L$(LIBAMPL_DIR)/lib -lasl -lfuncadd0

OBJDIR = .objects
BINDIR = bin
SRC = src

all:: $(OBJDIR) $(BINDIR) $(BINDIR)/miniampl

$(OBJDIR)/%.o: $(SRC)/%.c
	$(CXX) -c $(CXX_OPTS) $? -o $@

$(OBJDIR):
	[[ ! -d $(OBJDIR) ]] && mkdir $(OBJDIR)

$(BINDIR):
	[[ ! -d $(BINDIR) ]] && mkdir $(BINDIR)

$(BINDIR)/%: $(OBJDIR)/%.o
	$(CXX) -o $@ $? $(LIBS)

clean:
	rm $(OBJDIR)/*

purge:
	rm -rf $(BINDIR) $(OBJDIR)
