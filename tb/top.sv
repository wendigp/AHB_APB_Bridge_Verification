module top;
	import test_pkg::*;
	import uvm_pkg::*;
	`include "uvm_macros.svh"

//Clock Generation
	bit clk;
	always
	#5 clk = ~clk;

//Interface handle creation
ahb_if h_if(clk);
apb_if p_if(clk);

//Instantiation
rtl_top DUV(.Hclk(clk),
	.Hresetn(h_if.resetn),
	.Htrans(h_if.htrans),
	.Hsize(h_if.hsize),
	.Hreadyin(h_if.hready_in),
	.Hwdata(h_if.hwdata),
	.Haddr(h_if.haddr),
	.Hwrite(h_if.hwrite),
	.Hrdata(h_if.hrdata),
	.Hresp(h_if.hresp),
	.Hreadyout(h_if.hready_out),
	.Prdata(p_if.prdata),
	.Pselx(p_if.pselx),
	.Pwrite(p_if.pwrite),
	.Penable(p_if.penable),
	.Paddr(p_if.paddr),
	.Pwdata(p_if.pwdata));



initial
	begin
	uvm_config_db #(virtual ahb_if)::set(null,"*","vif",h_if);   //This puts the virtual interface pointer (ahb_vif) into the UVM configuration database
	uvm_config_db #(virtual apb_if)::set(null,"*","vif",p_if);

	run_test();
	end
endmodule
			
