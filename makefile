# if you don't have 64bit Quartus installed remove '--64bit'
QUARTUS_OPTS = --no_banner --64bit

PROJECT = soc_system
BUILD_PATH = output_files

program:
	quartus_pgm $(QUARTUS_OPTS) -m jtag -c 1 -o "p;$(BUILD_PATH)/$(PROJECT).sof"
#	quartus_pgm -m jtag -c USB-Blaster[USB-0] -o "p;$(BUILD_PATH)/$(PROJECT).sof"

start_server:
	quartus_stp $(QUARTUS_OPTS) -t ../tcl/vjtag_server.tcl &

detect:
	quartus_pgm $(QUARTUS_OPTS) -c 1 -a

compile:
	quartus_sh $(QUARTUS_OPTS) --flow compile $(PROJECT) -c $(PROJECT)

convert_flash:
	quartus_cpf $(QUARTUS_OPTS) -c $(PROJECT).cof

program_flash:
	quartus_pgm $(QUARTUS_OPTS) -c 1 $(PROJECT).cdf

quartus:
	quartus $(QUARTUS_OPTS) $(PROJECT).qpf

system_console:
	system-console --desktop_script=test_one.tcl

clean:
	rm -rf incremental_db
	rm -rf db
	rm -rf greybox_tmp
	rm -rf build/*

clean_qsys_system:
	rm -rf soc_system/*
	rm -rf soc_system.cmp
	rm -rf soc_system.sopcinfo
	rm -rf *.rpt

tags:
	exuberant-ctags -Re

.PHONY :compile

