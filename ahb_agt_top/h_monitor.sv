class h_monitor extends uvm_monitor;

  `uvm_component_utils(h_monitor)

  virtual ahb_if.AHB_MON_MP  vif;
  ahb_config                 h_cfg;

  uvm_analysis_port #(h_xtn) monitor_port;

  extern function new(string name = "h_monitor", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task collect_data();

endclass

// ---------------------------------------------------
// Constructor
function h_monitor::new(string name = "h_monitor", uvm_component parent);
  	super.new(name, parent);
 	monitor_port = new("monitor_port", this);
endfunction

// ---------------------------------------------------
// Build phase
function void h_monitor::build_phase(uvm_phase phase);
  	super.build_phase(phase);
 	 if (!uvm_config_db #(ahb_config)::get(this, "", "ahb_config", h_cfg))
    	`uvm_fatal("AHB MONITOR", "CANNOT GET DATA FROM AHB_CONFIG. HAVE YOU SET IT?")
endfunction

// ---------------------------------------------------
// Connect phase
function void h_monitor::connect_phase(uvm_phase phase);
 	super.connect_phase(phase);
  	vif = h_cfg.vif;
  	if (vif == null)
   	 `uvm_fatal("AHB_MONITOR", "VIF IS NULL IN AHB MONITOR")
endfunction

// ---------------------------------------------------
// Run phase
task h_monitor::run_phase(uvm_phase phase);
   	 @(vif.ahb_mon_cb)

   	 // Only collect when hready_out is high and htrans is valid
   	 if (vif.ahb_mon_cb.hready_out == 1) 
    	 begin
     	`uvm_info("AHB MONITOR", "hready_out is high, calling collect_data", UVM_LOW);
	end
	forever
     	collect_data();
endtask

// ---------------------------------------------------
// Custom task to collect data
task h_monitor::collect_data();
 	h_xtn xtn;
 	xtn = h_xtn::type_id::create("xtn");
	wait(vif.ahb_mon_cb.hready_out == 1)
	//while(vif.ahb_mon_cb.hready_out != 1)
	//@(vif.ahb_mon_cb);

 	$display("AHB MONITOR STARTS COLLECTING DATA AT : ", $time);
	wait (vif.ahb_mon_cb.htrans == 2 || vif.ahb_mon_cb.htrans == 3);
	
	//while(vif.ahb_mon_cb.htrans != 2 && vif.ahb_mon_cb.htrans != 3)
	//@(vif.ahb_mon_cb);

 	xtn.haddr     = vif.ahb_mon_cb.haddr;
  	xtn.hsize     = vif.ahb_mon_cb.hsize;
  	xtn.hwrite    = vif.ahb_mon_cb.hwrite;
  	xtn.htrans    = vif.ahb_mon_cb.htrans;
  	xtn.hready_in = vif.ahb_mon_cb.hready_in;
  	xtn.hburst    = vif.ahb_mon_cb.hburst;

	@(vif.ahb_mon_cb)
  	wait(vif.ahb_mon_cb.hready_out == 1)

 	if (xtn.hwrite)
   	xtn.hwdata = vif.ahb_mon_cb.hwdata;
  	else
    	xtn.hrdata = vif.ahb_mon_cb.hrdata;

  	`uvm_info("AHB MONITOR", $sformatf("Printing from AHB MONITOR \n%s", xtn.sprint()), UVM_LOW);

 	 // Send to scoreboard
  	monitor_port.write(xtn);
endtask

