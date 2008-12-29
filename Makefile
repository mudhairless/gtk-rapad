LIBNAME := gtkrapad

FBC := fbc
RM := rm

SRCDIR := src
BINDIR := bin
INCDIR := inc

SRCS := $(wildcard $(SRCDIR)/*.bas)
OBJS := $(SRCS:%.bas=%.o)

LIBRARY := $(BINDIR)/lib$(LIBNAME).a

FBC_CFLAGS := -w pedantic -i $(INCDIR)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  targets
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

all : $(LIBRARY)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  rules
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

$(LIBRARY) : $(OBJS)
	$(FBC) -lib -x $(BINDIR)/$(LIBNAME) $(FBC_CFLAGS) $(OBJS)

.PHONY : notice
notice :
	echo Building $(LIBNAME)

%.o : %.bas
	$(FBC) -c $(FBC_CFLAGS) $< -o $@

.PHONY : clean
clean : 
	@echo Removing object files..
	$(RM) -f $(OBJS)
	@echo Removing $(LIBNAME)
	$(RM) -f $(LIBRARY)
