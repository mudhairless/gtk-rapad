LIBNAME := gtkrapad

FBC := fbc
RM := rm
MD := mkdir

SRCDIR := src
LIBDIR := lib
INCDIR := inc

SRCS := $(wildcard $(SRCDIR)/*.bas)
OBJS := $(SRCS:%.bas=%.o)

EX_SRCS := $(wildcard examples/*.bas)
EX_BINS := $(EX_SRCS:%.bas=%.bin)

LIBRARY := $(LIBDIR)/lib$(LIBNAME).a

FBC_CFLAGS := -w all -i $(INCDIR)

ifndef NDEBUG
	FBC_CFLAGS += -g
endif

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  targets
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

all : $(LIBRARY) examples

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  rules
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

%.bin : %.bas
	$(FBC) $(FBC_CFLAGS) -p lib $< -x $@

.PHONY : examples
examples : $(LIBRARY) $(EX_BINS)

.PHONY : clean-examples
clean-examples :
	@echo Removing examples..
	$(RM) -f $(EX_BINS)

$(LIBRARY) : $(OBJS)
	@test -d $(LIBDIR) || $(MD) $(LIBDIR)
	$(FBC) -lib -x $(LIBRARY) $(FBC_CFLAGS) $(OBJS)

.PHONY : notice
notice :
	echo Building $(LIBNAME)

%.o : %.bas
	$(FBC) -c $(FBC_CFLAGS) $< -o $@

.PHONY : clean-all
clean-all : clean clean-examples

.PHONY : clean
clean : 
	@echo Removing object files..
	$(RM) -f $(OBJS)
	@echo Removing $(LIBNAME)
	$(RM) -f $(LIBRARY)
