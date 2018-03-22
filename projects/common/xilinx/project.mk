####################################################################################
####################################################################################
## Copyright 2018(c) Analog Devices, Inc.
####################################################################################
####################################################################################

M_VIVADO := vivado -mode batch -source

M_FLIST := *.cache
M_FLIST += *.data
M_FLIST += *.xpr
M_FLIST += *.log
M_FLIST += *.jou
M_FLIST +=  xgui
M_FLIST += *.runs
M_FLIST += *.srcs
M_FLIST += *.sdk
M_FLIST += *.hw
M_FLIST += *.sim
M_FLIST += .Xil
M_FLIST += *.ip_user_files

M_DEPS += $(foreach dep,$(LIB_DEPS),$(HDL_LIBRARY_PATH)$(dep)/$(notdir $(dep)).xpr)

# Assumes this file is in projects/common/xilinx/project.mk
HDL_LIBRARY_PATH := $(subst common/xilinx/project.mk,,$(lastword $(MAKEFILE_LIST)))../library/

.PHONY: all lib clean clean-all
all: lib $(PROJECT_NAME).sdk/system_top.hdf

clean:
	rm -rf $(M_FLIST)

clean-all: clean
	@for lib in $(LIB_DEPS); do \
		$(MAKE) -C $(HDL_LIBRARY_PATH)$${lib} clean; \
	done

$(PROJECT_NAME).sdk/system_top.hdf: $(M_DEPS)
	-rm -rf $(M_FLIST)
	$(M_VIVADO) system_project.tcl >> $(PROJECT_NAME)_vivado.log 2>&1

lib:
	@for lib in $(LIB_DEPS); do \
		$(MAKE) -C $(HDL_LIBRARY_PATH)$${lib} || exit $$?; \
	done
