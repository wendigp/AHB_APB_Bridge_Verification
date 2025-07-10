class p_sequencer extends uvm_sequencer #(p_xtn);

	`uvm_component_utils(p_sequencer)

	extern function new(string name = "p_sequencer", uvm_component parent);
endclass

//CONSTRUCTOR
function p_sequencer::new(string name = "p_sequencer", uvm_component parent);
	super.new(name,parent);
endfunction