LIBNAME := gtkrapad

FBC := fbc
RM := rm
MD := mkdir

SRCDIR := src
LIBDIR := lib
INCDIR := inc

SRCS := $(wildcard $(SRCDIR)/*.bas)
OBJS := $(SRCS:%.bas=%.o)

LIBRARY := $(LIBDIR)/lib$(LIBNAME).a

FBC_CFLAGS := -w all -i $(INCDIR)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  targets
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

all : $(LIBRARY)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#  rules
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

$(LIBRARY) : $(OBJS)
	@test -d $(LIBDIR) || $(MD) $(LIBDIR)
	$(FBC) -lib -x $(LIBRARY) $(FBC_CFLAGS) $(OBJS)

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
