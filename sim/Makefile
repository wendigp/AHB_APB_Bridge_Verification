# ===========================
# Simulator and basic setup
# ===========================
SIMULATOR = Questa
work = work

# RTL & TB files
RTL = ../rtl/* +define+WRAPPING_INCR
TB  = ../tb/top.sv
PKG = ../test/test_pkg.sv
INC = +incdir+../tb +incdir+../test +incdir+../ahb_agt_top +incdir+../apb_agt_top

VSIMOPT  = -vopt -voptargs=+acc 
VSIMCOV  = -coverage -sva 

VSIMBATCH = -c -do "log -r /*; coverage save -onexit mem_cov; run -all; exit"

VLOG = vlog -work $(work) $(RTL) $(INC) $(PKG) $(TB)

# ===========================
# Targets
# ===========================
help:
	@echo "================================================================="
	@echo "! USAGE"
	@echo "! make clean         => clean logs and intermediate files"
	@echo "! make sv_cmp        => compile RTL & TB"
	@echo "! make test1         => run single_trnsfr_test"
	@echo "! make test2         => run incr_test"
	@echo "! make test3         => run wrap_4_test"
	@echo "! make test4         => run incr_4_test"
	@echo "! make test5         => run wrap_8_test"
	@echo "! make test6         => run incr_8_test"
	@echo "! make test7         => run wrap_16_test"
	@echo "! make test8         => run incr_16_test"
	@echo "! make view_waveX    => view waveform X"
	@echo "! make report        => merge and generate HTML coverage report"
	@echo "! make regress       => run all tests and merge coverage"
	@echo "================================================================="

clean:
	rm -rf transcript* *log* fcover* covhtml* mem_cov* *.wlf modelsim.ini work
	clear

sv_cmp:
	vlib $(work)
	vmap work $(work)
	$(VLOG)

test1: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov1; run -all; exit" -wlf wave_file1.wlf -l test1.log -sv_seed random work.top +UVM_TESTNAME=single_trnsfr_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov1

test2: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov2; run -all; exit" -wlf wave_file2.wlf -l test2.log -sv_seed random work.top +UVM_TESTNAME=incr_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov2

test3: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov3; run -all; exit" -wlf wave_file3.wlf -l test3.log -sv_seed random work.top +UVM_TESTNAME=wrap_4_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov3

test4: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov4; run -all; exit" -wlf wave_file4.wlf -l test4.log -sv_seed random work.top +UVM_TESTNAME=incr_4_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov4

test5: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov5; run -all; exit" -wlf wave_file5.wlf -l test5.log -sv_seed random work.top +UVM_TESTNAME=wrap_8_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov5

test6: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov6; run -all; exit" -wlf wave_file6.wlf -l test6.log -sv_seed random work.top +UVM_TESTNAME=incr_8_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov6

test7: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov7; run -all; exit" -wlf wave_file7.wlf -l test7.log -sv_seed random work.top +UVM_TESTNAME=wrap_16_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov7

test8: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) -c -do "log -r /*; coverage save -onexit mem_cov8; run -all; exit" -wlf wave_file8.wlf -l test8.log -sv_seed random work.top +UVM_TESTNAME=incr_16_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov8

view_wave1:
	vsim -view wave_file1.wlf

view_wave2:
	vsim -view wave_file2.wlf

view_wave3:
	vsim -view wave_file3.wlf

view_wave4:
	vsim -view wave_file4.wlf

view_wave5:
	vsim -view wave_file5.wlf

view_wave6:
	vsim -view wave_file6.wlf

view_wave7:
	vsim -view wave_file7.wlf

view_wave8:
	vsim -view wave_file8.wlf

report:
	vcover merge mem_cov mem_cov1 mem_cov2 mem_cov3 mem_cov4 mem_cov5 mem_cov6 mem_cov7 mem_cov8
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html mem_cov

regress: clean test1 test2 test3 test4 test5 test6 test7 test8 report


cov:
	firefox covhtmlreport/index.html&

