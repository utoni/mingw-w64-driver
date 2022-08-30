ifndef DPP_ROOT
$(error DPP_ROOT is undefined)
endif

include $(DPP_ROOT)/Makefile.inc

DRIVER_NAME = driver
DRIVER_OBJECTS = $(DRIVER_NAME).o
DRIVER_TARGET = $(DRIVER_NAME).sys

all: $(DRIVER_TARGET)

clean:
	rm -f $(DRIVER_OBJECTS) $(DRIVER_TARGET)

%.o: %.cpp
	$(call BUILD_CPP_OBJECT,$<,$@)

$(DRIVER_TARGET): $(DRIVER_OBJECTS)
	$(call LINK_CPP_KERNEL_TARGET,$(DRIVER_OBJECTS),$@)
