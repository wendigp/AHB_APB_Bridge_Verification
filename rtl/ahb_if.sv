interface ahb_if(input bit clk);

//AHB PROPERTY
	logic [31:0]	haddr;
	logic [31:0]	hwdata;
	logic [31:0]	hrdata;
	logic [2:0]	hsize;
	logic [2:0]	hburst;
	logic [1:0]	htrans;
	logic		hwrite;
	logic [1:0]	hresp;
	logic		resetn;
	logic		hready_in;
	logic		hready_out;

//CLOCKING BLOCK FOR AHB
clocking ahb_drv_cb@(posedge clk);
	default input#1 output#1;

	output haddr, hwrite, hwdata, hsize, hburst, htrans,hready_in, resetn;
	input  hrdata,hready_out,hresp;
endclocking

clocking ahb_mon_cb@(posedge clk);  //MONITOR IS A PASSIVE COMPONENT ITNEVER DRIVES ANY SIGNAL, JUST OBSERVES SIGNALS FROM DUT THAT'S WHY ALL ARE CONSIDERED AS INPUT
	default input#1 output#1;

	input hrdata,hready_out;
	input hready_in,resetn,hwrite,haddr,hwdata,hsize,hburst,htrans;
endclocking

//MODPORT FOR AHB
modport AHB_DRV_MP(clocking ahb_drv_cb);
modport AHB_MON_MP(clocking ahb_mon_cb);
endinterface
