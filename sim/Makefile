# =========================================
# Simulator and basic setup
# =========================================
SIM = Questa
WORK = work

# RTL file list
RTL = ../rtl/ahb_if.sv \
      ../rtl/apb_if.sv \
      ../rtl/ahb_slave.v \
      ../rtl/apb_controller.v \
      ../rtl/apb_interface.v \
      ../rtl/ahb_apb_top.v

TB = ../tb/top.sv
PKG = ../test/test_pkg.sv

INC_DIRS = +incdir+../tb +incdir+../test +incdir+../ahb_agt_top +incdir+../apb_agt_top

VLOG = /c/questasim64_2021.1/win64/vlog
VSIM = /c/questasim64_2021.1/win64/vsim

# =========================================
# Default target: compile and simulate base_test
# =========================================
all: compile simulate

compile:
	$(VLOG) +acc $(INC_DIRS) $(PKG) $(RTL) $(TB)

simulate:
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=base_test -wlf wave_base.wlf
	mv vsim.ucdb cov_base.ucdb

# =========================================
# Dedicated test targets (with logging signals)
# =========================================
test1: compile
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=single_trnsfr_test -wlf wave1.wlf
	mv vsim.ucdb cov_test1.ucdb

test2: compile
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=incr_test -wlf wave2.wlf
	mv vsim.ucdb cov_test2.ucdb

test3: compile
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=wrap_4_test -wlf wave3.wlf
	mv vsim.ucdb cov_test3.ucdb

test4: compile
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=wrap_8_test -wlf wave4.wlf
	mv vsim.ucdb cov_test4.ucdb

test5: compile
	$(VSIM) -c -coverage -do "log -r /*; coverage save -onexit; run -all; quit" work.top +UVM_TESTNAME=wrap_16_test -wlf wave5.wlf
	mv vsim.ucdb cov_test5.ucdb

# =========================================
# View waveform commands
# =========================================
view_base:
	@if [ -f wave_base.wlf ]; then \
		$(VSIM) -view wave_base.wlf; \
	else \
		echo "wave_base.wlf not found. Please run 'make' or 'make simulate' first."; \
	fi

view1:
	@if [ -f wave1.wlf ]; then \
		$(VSIM) -view wave1.wlf; \
	else \
		echo "wave1.wlf not found. Please run 'make test1' first."; \
	fi

view2:
	@if [ -f wave2.wlf ]; then \
		$(VSIM) -view wave2.wlf; \
	else \
		echo "wave2.wlf not found. Please run 'make test2' first."; \
	fi

view3:
	@if [ -f wave3.wlf ]; then \
		$(VSIM) -view wave3.wlf; \
	else \
		echo "wave3.wlf not found. Please run 'make test3' first."; \
	fi

view4:
	@if [ -f wave4.wlf ]; then \
		$(VSIM) -view wave4.wlf; \
	else \
		echo "wave4.wlf not found. Please run 'make test4' first."; \
	fi

view5:
	@if [ -f wave5.wlf ]; then \
		$(VSIM) -view wave5.wlf; \
	else \
		echo "wave5.wlf not found. Please run 'make test5' first."; \
	fi

# =========================================
# Coverage report merge & HTML
# =========================================
report:
	vcover merge merged_cov cov_base.ucdb cov_test1.ucdb cov_test2.ucdb cov_test3.ucdb cov_test4.ucdb cov_test5.ucdb
	vcover report -details -html merged_cov

cov:
	"C:\Program Files\Google\Chrome\Application\chrome.exe" merged_cov/index.html &

# =========================================
# Clean all generated files
# =========================================
clean:
	rm -rf transcript vsim.wlf work *.log *.wlf *.ucdb merged_cov
	clear

# =========================================
# Help message
# =========================================
help:
	@echo "==========================================================="
	@echo " make                 : compile and simulate base_test"
	@echo " make compile         : only compile"
	@echo " make simulate        : simulate base_test (with coverage)"
	@echo " make test1           : run single_trnsfr_test"
	@echo " make test2           : run incr_test"
	@echo " make test3           : run wrap_4_test"
	@echo " make test4           : run wrap_8_test"
	@echo " make test5           : run wrap_16_test"
	@echo " make view1..view5    : view waveforms for each test (auto check exists)"
	@echo " make report          : merge and generate HTML coverage report"
	@echo " make cov             : open merged coverage report in Chrome"
	@echo " make clean           : clean previous builds and files"
	@echo "==========================================================="
