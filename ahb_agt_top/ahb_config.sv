class ahb_config extends uvm_object;

	`uvm_object_utils(ahb_config)
//NO NEED TO DECLARE ENVIRONMENT FLAGS HERE AGAIN  <has_ahb_agent,has_scoreboard ...>
	virtual ahb_if vif;
	uvm_active_passive_enum is_active = UVM_ACTIVE;

	extern function new(string name = "ahb_config");

endclass


//CONSTRUCTOR

function ahb_config::new(string name = "ahb_config");
	super.new(name);
endfunction