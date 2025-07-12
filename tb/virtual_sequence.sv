class v_base_seq extends uvm_sequence #(uvm_sequence_item);  // It is parameterized with uvm_sequence_item since it does not generate actual items itself

	`uvm_object_utils(v_base_seq)

	h_sequencer 		h_seqr;
	p_sequencer 		p_seqr;
	v_sequencer 		v_seqr;
	env_config		env_cfg;

// HANDLE DECLARATION OF TCs OF AHB SIDE
	single_trnsfr_seq	single_trnsfr;
	incr_seq		incr;
	wrap_4_seq		wrap_4;
	incr_4_seq		incr_4;
	wrap_8_seq		wrap_8;
	incr_8_seq		incr_8;
	wrap_16_seq		wrap_16;
	incr_16_seq		incr_16;

// HANDLE DECLARATION OF TCs OF APB SIDE
	apb_seq			apb;

	extern function new(string name = "v_base_seq");
	extern task body();
endclass

//CONSTRUCTOR
function v_base_seq::new(string name = "v_base_seq");
	super.new(name);
endfunction

//TASK BODY
task v_base_seq::body();
	super.body();
	if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",env_cfg))
	begin
	`uvm_fatal("VIRTUAL SEQUENCE","CANNOT GET DATA FROM ENV_CONFIG. HAVE YOU SET IT?")
	end
	assert($cast(v_seqr,m_sequencer))
	else
	begin
	`uvm_error("VIRTUAL SEQ BODY","CASTING OF V_SEQR WITH M_SEQR IS FAILED")
	end

//Get actual AHB and APB sequencers from virtual sequencer
	h_seqr = v_seqr.h_seqr;
	p_seqr = v_seqr.p_seqr;
endtask

//TEST CASE 1: SINGLE TRANSFER
class v_single_trnsfr_seq extends v_base_seq;

	`uvm_object_utils(v_single_trnsfr_seq)

	extern function new(string name = "v_single_trnsfr_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_1
function v_single_trnsfr_seq::new(string name = "v_single_trnsfr_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_1
task v_single_trnsfr_seq::body();
	super.body();

//AHB SEQUENCES
	single_trnsfr = single_trnsfr_seq::type_id::create("single_trnsfr");
	single_trnsfr.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask

//TEST CASE 2: SINGLE TRANSFER
class v_incr_seq extends v_base_seq;

	`uvm_object_utils(v_incr_seq)

	extern function new(string name = "v_incr_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_2
function v_incr_seq::new(string name = "v_incr_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_2
task v_incr_seq::body();
	super.body();

//AHB SEQUENCES
	incr = incr_seq::type_id::create("incr");
	incr.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask


//TEST CASE 3: WRAP_4 TRANSFER
class v_wrap_4_seq extends v_base_seq;

	`uvm_object_utils(v_wrap_4_seq)

	extern function new(string name = "v_wrap_4_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_3
function v_wrap_4_seq::new(string name = "v_wrap_4_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_3
task v_wrap_4_seq::body();
	super.body();

//AHB SEQUENCES
	wrap_4 = wrap_4_seq::type_id::create("wrap_4");
	wrap_4.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask

//TEST CASE 4: INCR_4 TRANSFER
class v_incr_4_seq extends v_base_seq;

	`uvm_object_utils(v_incr_4_seq)

	extern function new(string name = "v_incr_4_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_4
function v_incr_4_seq::new(string name = "v_incr_4_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_4
task v_incr_4_seq::body();
	super.body();

//AHB SEQUENCES
	incr_4 = incr_4_seq::type_id::create("incr_4");
	incr_4.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask

//TEST CASE 5: WRAP_8 TRANSFER
class v_wrap_8_seq extends v_base_seq;

	`uvm_object_utils(v_wrap_8_seq)

	extern function new(string name = "v_wrap_8_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_5
function v_wrap_8_seq::new(string name = "v_wrap_8_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_5
task v_wrap_8_seq::body();
	super.body();

//AHB SEQUENCES
	wrap_8 = wrap_8_seq::type_id::create("wrap_8");
	wrap_8.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask


//TEST CASE 6: INCR_8 TRANSFER
class v_incr_8_seq extends v_base_seq;

	`uvm_object_utils(v_incr_8_seq)

	extern function new(string name = "v_incr_8_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_6
function v_incr_8_seq::new(string name = "v_incr_8_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_6
task v_incr_8_seq::body();
	super.body();

//AHB SEQUENCES
	incr_8 = incr_8_seq::type_id::create("incr_8");
	incr_8.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask

//TEST CASE 7: WRAP_16 TRANSFER
class v_wrap_16_seq extends v_base_seq;

	`uvm_object_utils(v_wrap_16_seq)

	extern function new(string name = "v_wrap_16_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_7
function v_wrap_16_seq::new(string name = "v_wrap_16_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_7
task v_wrap_16_seq::body();
	super.body();

//AHB SEQUENCES
	wrap_16 = wrap_16_seq::type_id::create("wrap_16");
	wrap_16.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask

//TEST CASE 8: INCR_16 TRANSFER
class v_incr_16_seq extends v_base_seq;

	`uvm_object_utils(v_incr_16_seq)

	extern function new(string name = "v_incr_16_seq");
	extern task body();
endclass

//CONSTRUCTOR FOR TC_8
function v_incr_16_seq::new(string name = "v_incr_16_seq");
	super.new(name);
endfunction

//SEQ BODY FOR TC_8
task v_incr_16_seq::body();
	super.body();

//AHB SEQUENCES
	incr_16 = incr_16_seq::type_id::create("incr_16");
	incr_16.start(h_seqr);

//APB SEQUENCES
	apb = apb_seq::type_id::create("apb");
	apb.start(p_seqr);
endtask
