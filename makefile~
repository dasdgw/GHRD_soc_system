# if you don't have 64bit Quartus installed remove '--64bit'
QUARTUS_OPTS = --no_banner --64bit

program:
	quartus_pgm $(QUARTUS_OPTS) -m jtag -c 1 -o "p;build/sockit.sof"
#	quartus_pgm -m jtag -c USB-Blaster[USB-0] -o "p;build/sockit.sof"

start_server:
	quartus_stp $(QUARTUS_OPTS) -t ../tcl/vjtag_server.tcl &

detect:
	quartus_pgm $(QUARTUS_OPTS) -c 1 -a

compile:
	quartus_sh $(QUARTUS_OPTS) --flow compile sockit -c sockit

convert_flash:
	quartus_cpf $(QUARTUS_OPTS) -c sockit.cof

program_flash:
	quartus_pgm $(QUARTUS_OPTS) -c 1 sockit.cdf

quartus:
	quartus $(QUARTUS_OPTS) sockit.qpf

system_console:
	system-console --desktop_script=system_console.tcl

clean:
	rm -rf incremental_db
	rm -rf db
	rm -rf greybox_tmp
	rm -rf build/*

clean_qsys_system:
	rm -rf sockit_system/*
	rm -rf sockit_system.cmp
	rm -rf sockit_system.sopcinfo
	rm -rf *.rpt

tags:
	exuberant-ctags -Re

.PHONY :compile

