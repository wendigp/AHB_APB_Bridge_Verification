class base_test extends uvm_test;

	`uvm_component_utils(base_test)

	//ENVIRONMENT HANDLE DECLARATION
	env 		envh;

	//HANDLE DECLARATION FOR CONFIGURATION BLOCK
	env_config 	env_cfg;
	ahb_config 	h_cfg;
	apb_config	p_cfg;

//FLAGS DECLARATIONS WITH VALUES
	bit has_ahb_agent = 1;
	bit has_apb_agent = 1;
	bit has_virtual_sequencer = 1;
	bit has_scoreboard = 1;

	extern function new(string name = "base_test", uvm_component parent);
	extern function void config_bridge();
	extern function void build_phase(uvm_phase phase);
endclass

function base_test::new(string name = "base_test", uvm_component parent);
	super.new(name,parent);
endfunction

function void base_test::config_bridge();
	if(has_ahb_agent)
	begin
	h_cfg.is_active = UVM_ACTIVE;
	if(!uvm_config_db #(virtual ahb_if)::get(this,"","vif",h_cfg.vif))
	begin
	`uvm_fatal("AHB CONFIG","CANNOT GET DATA FROM VIF. HAVE YOU SET IT?")
	end
	env_cfg.h_cfg = h_cfg;     //assigns the AHB agent configuration object (h_cfg) to a local (h_cfg) inside the environment configuration object (env_cfg).
	end

	if(has_apb_agent)
	begin
	p_cfg.is_active = UVM_ACTIVE;
	if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",p_cfg.vif))
	begin
	`uvm_fatal("APB CONFIG","CANNOT GET DATA FROM VIF. HAVE YOU SET IT?")
	end
	env_cfg.p_cfg = p_cfg;
	end

	env_cfg.has_ahb_agent 		= has_ahb_agent;
	env_cfg.has_apb_agent		= has_apb_agent;
	env_cfg.has_virtual_sequencer	= has_virtual_sequencer;
	env_cfg.has_scoreboard 		= has_scoreboard;

	uvm_config_db #(env_config)::set(this,"*","env_config",env_cfg);	

endfunction

function void base_test::build_phase(uvm_phase phase);
	super.build_phase(phase);

	env_cfg = env_config::type_id::create("env_cfg");
	
	if(has_ahb_agent)
	h_cfg = ahb_config::type_id::create("h_cfg");
	
	if(has_apb_agent)
	p_cfg = apb_config::type_id::create("p_cfg");
	
	config_bridge();
	
	envh = env::type_id::create("envh",this);
endfunction
	
//TEST CASE 1: SINGLE TRANSFER
class single_trnsfr_test extends base_test;

	`uvm_component_utils(single_trnsfr_test)

	v_single_trnsfr_seq 	single_testh;

	extern function new(string name = "single_trnsfr_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_1
function single_trnsfr_test::new(string name = "single_trnsfr_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_1
function void single_trnsfr_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_1
task single_trnsfr_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	single_testh=v_single_trnsfr_seq::type_id::create("single_testh");
	single_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 2: INCREMENTAL TRANSFER
class incr_test extends base_test;

	`uvm_component_utils(incr_test)

	v_incr_seq 	incr_testh;

	extern function new(string name = "incr_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_2
function incr_test::new(string name = "incr_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_2
function void incr_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_2
task incr_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	incr_testh=v_incr_seq::type_id::create("incr_testh");
	incr_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask


//TEST CASE 3: WRAP_4 TRANSFER
class wrap_4_test extends base_test;

	`uvm_component_utils(wrap_4_test)

	v_wrap_4_seq 	wrap_4_testh;

	extern function new(string name = "wrap_4_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_3
function wrap_4_test::new(string name = "wrap_4_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_3
function void wrap_4_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_3
task wrap_4_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	wrap_4_testh=v_wrap_4_seq::type_id::create("wrap_4_testh");
	wrap_4_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 4: INCR_4 TRANSFER
class incr_4_test extends base_test;

	`uvm_component_utils(incr_4_test)

	v_incr_4_seq 	incr_4_testh;

	extern function new(string name = "incr_4_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_4
function incr_4_test::new(string name = "incr_4_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_4
function void incr_4_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_4
task incr_4_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	incr_4_testh=v_incr_4_seq::type_id::create("incr_4_testh");
	incr_4_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 5: WRAP_8 TRANSFER
class wrap_8_test extends base_test;

	`uvm_component_utils(wrap_8_test)

	v_wrap_8_seq 	wrap_8_testh;

	extern function new(string name = "wrap_8_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_5
function wrap_8_test::new(string name = "wrap_8_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_5
function void wrap_8_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_5
task wrap_8_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	wrap_8_testh=v_wrap_8_seq::type_id::create("wrap_8_testh");
	wrap_8_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 6: INCR_8 TRANSFER
class incr_8_test extends base_test;

	`uvm_component_utils(incr_8_test)

	v_incr_8_seq 	incr_8_testh;

	extern function new(string name = "incr_8_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_6
function incr_8_test::new(string name = "incr_8_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_6
function void incr_8_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_6
task incr_8_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	incr_8_testh=v_incr_8_seq::type_id::create("incr_8_testh");
	incr_8_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 7: WRAP_16 TRANSFER
class wrap_16_test extends base_test;

	`uvm_component_utils(wrap_16_test)

	v_wrap_16_seq 	wrap_16_testh;

	extern function new(string name = "wrap_16_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_7
function wrap_16_test::new(string name = "wrap_16_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_7
function void wrap_16_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_7
task wrap_16_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	wrap_16_testh=v_wrap_16_seq::type_id::create("wrap_16_testh");
	wrap_16_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask

//TEST CASE 8: INCR_16 TRANSFER
class incr_16_test extends base_test;

	`uvm_component_utils(incr_16_test)

	v_incr_16_seq 	incr_16_testh;

	extern function new(string name = "incr_16_test", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

////CONSTRUCTOR FOR TC_8
function incr_16_test::new(string name = "incr_16_test", uvm_component parent);
	super.new(name,parent);
endfunction

////BUILD PHASE FOR TC_8
function void incr_16_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

////RUN PHASE FOR TC_8
task incr_16_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	phase.raise_objection(this);			//RAISE OBJECTION
	incr_16_testh=v_incr_16_seq::type_id::create("incr_16_testh");
	incr_16_testh.start(envh.v_seqr);
	phase.drop_objection(this);			//DROP OBJECTION
endtask