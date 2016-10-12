include /work/users/krodriguez/autocnet/isis/make/isismake.os

TARGET = bundle.so
OFILES = sipbundlecmodule.o sipbundleIsisBundleAdjust.o sipbundleIsis.o
HFILES = sipAPIbundle.h 

CC = gcc
CXX = g++
LINK = g++
CPPFLAGS = -DNDEBUG -I. -I/home/krodriguez/miniconda3/envs/linux_x64/include/python3.5m
CFLAGS = -pipe -fPIC -O2 -Wall -W
CXXFLAGS = $(ALLINCDIRS) -pipe -fPIC -O2 -Wall -W
LFLAGS = $(ALLLIBDIRS) -shared -Wl,--version-script=bundle.exp
LIBS = $(ALLLIBS) 
.SUFFIXES: .c .o .cpp .cc .cxx .C


.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.C.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

all: $(TARGET)

$(OFILES): $(HFILES)

$(TARGET): $(OFILES)
	@echo '{ global: PyInit_bundle; local: *; };' > bundle.exp
	$(LINK) $(LFLAGS) -o $(TARGET) $(OFILES) $(LIBS)

install: $(TARGET)
	@test -d $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/lib/python3.5/site-packages || mkdir -p $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/lib/python3.5/site-packages
	cp -f $(TARGET) $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/lib/python3.5/site-packages/$(TARGET)
	strip $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/lib/python3.5/site-packages/$(TARGET)
	@test -d $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/share/sip/PyQt5/isis3 || mkdir -p $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/share/sip/PyQt5/isis3
	cp -f master.sip $(DESTDIR)/home/krodriguez/miniconda3/envs/linux_x64/share/sip/PyQt5/isis3/master.sip

clean:
	-rm -f $(TARGET)
	-rm -f sipbundlecmodule.o
	-rm -f sipbundleIsisBundleAdjust.o
	-rm -f sipbundleIsis.o
	-rm -f bundle.exp
