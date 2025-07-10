class env_config extends uvm_object;

	`uvm_object_utils(env_config)

	ahb_config h_cfg;
	apb_config p_cfg;

	//FLAGS DECLARATION
	bit has_ahb_agent = 1;
	bit has_apb_agent = 1;
	bit has_virtual_sequencer = 1;
	bit has_scoreboard = 1;
//GIVING VALUES TO THESE FLAGS HERE IS NOT NECESSARY, IT WILL TAKE IT FROM TEST CLASS
//FOR REUSABILITY WE GIVE VALUES IN TEST NOT IN ENV_CONFIG
//DECLARING THESE FLAGS HERE ALSO AS THEY WERE ALREADY DECLARED IN TEST
//BECAUSE FLAGS IN TEST - ALLOWS TEST LEVEL FLEXIBILITIY
//FLAGS IN ENV_CONFIG - ALLOW ENVIRONMENT LEVEL CONFIGURATION
	extern function new(string name = "env_config");
	
endclass

//CONSTRUCTOR
function env_config::new(string name = "env_config");
	super.new(name);
endfunction