class h_xtn extends uvm_sequence_item;

	`uvm_object_utils(h_xtn)
	
//DECLARATION OF PROPERTY OF AHB TO BE RANDOMIZE
	rand bit [31:0] haddr;
	rand bit [31:0] hwdata;
	rand bit [2:0]	hsize;
	rand bit [1:0]	htrans;
	rand bit [2:0] 	hburst;
	rand bit 	hwrite;
	rand bit [9:0] 	length;

//DECLARATION OF OTHER PROPERTY OF AHB , NOT RANDOMIZE
	bit [31:0] 	hrdata;
	bit		hready_in;
	bit		hready_out;

//CONSTRAINTS FOR ADDR
	constraint valid_haddr {haddr inside {[32'h8000_0000: 32'h8000_03ff],
						[32'h8400_0000: 32'h8400_03ff],
						[32'h8800_0000: 32'h8800_03ff],
						[32'h8c00_0000: 32'h8c00_03ff]};}		//EACH ADDR IS OF SIZE 1kB

//CONSTRAINT FOR HTRANS
	constraint valid_htrans {htrans inside {0,2,3};}
//CONSTRAINT FOR HSIZE
	constraint valid_size {hsize inside {0,1,2};}
//CONSTRAINT FOR HADDR RANGE
	constraint valid_haddr_range {haddr%1024 + (length*(3'b001<<hsize)) <= 1024;} 		//Prevents address wrap beyond a 1KB boundary.
//CONSTRAINT FOR VALID LENGTH
	constraint valid_length { hburst == 3 -> length == 3;
					hburst == 5 -> length == 7;
					hburst == 7 -> length == 15;}
//CONSTRAINT FOR VALID INCREMENT
	constraint valid_increment{hsize == 1 -> haddr%2 == 0;
					hsize == 2 -> haddr%4 == 0;}


	extern function new(string name = "h_xtn");
	extern function void do_print(uvm_printer printer);
endclass

//CONSTRUCTOR
function h_xtn::new(string name = "h_xtn");
	super.new(name);
endfunction

function void h_xtn::do_print(uvm_printer printer);
	super.do_print(printer);
	printer.print_field("hready_out",this.hready_out,1,UVM_BIN);
	printer.print_field("hready_in",this.hready_in,1,UVM_BIN);
	printer.print_field("haddr",this.haddr,32,UVM_HEX);
	printer.print_field("hsize",this.hsize,2,UVM_DEC);
	printer.print_field("hburst",this.hburst,3,UVM_DEC);
	printer.print_field("htrans",this.htrans,2,UVM_HEX);
	printer.print_field("hwrite",this.hwrite,1,UVM_BIN);
	printer.print_field("hwdata",this.hwdata,32,UVM_HEX);
	printer.print_field("hrdata",this.hrdata,32,UVM_HEX);
endfunction
