class apb_config extends uvm_object;

	`uvm_object_utils(apb_config)

	uvm_active_passive_enum is_active = UVM_ACTIVE;
	virtual apb_if vif;

	extern function new(string name = "apb_config");
endclass

//CONSTRUCTOR
function apb_config::new(string name = "apb_config");
	super.new(name);
endfunction