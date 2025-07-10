interface apb_if(input bit clk);

logic [31:0]paddr;
logic [31:0]pwdata;
logic [31:0]prdata;
logic pwrite;
logic penable;
logic [3:0] pselx;

clocking apb_drv_cb@(posedge clk);
	default input#0 output#1;
	output prdata;
	input paddr,pwdata,pselx,penable,pwrite;
endclocking

clocking apb_mon_cb@(posedge clk);
	default input#0 output#1;
	input paddr,pwdata,pwrite,penable,pselx;
	input prdata;
endclocking

modport APB_DRV_MP(clocking apb_drv_cb);
modport APB_MON_MP(clocking apb_mon_cb);

endinterface
