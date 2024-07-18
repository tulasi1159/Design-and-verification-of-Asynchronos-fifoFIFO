/**********************************************************

Authors: Sai Tulasi Prasad Dumpala, Deepak Kumar Dupati, Bhavana Marpadaga, KrishnapriyaNarra, Satya
batch 11
ECE 593: Fundamentals of Presilicon Validation Project

***********************************************************

*/


import uvm_pkg::*;
`include "uvm_macros.svh"

class fifo_seq_item #(parameter  data_width =8, ptr_width = 9, depth=409)extends uvm_sequence_item;
    `uvm_object_utils(fifo_seq_item #(8,9,409))// registering the class to factory

	rand bit w_en;
	rand bit r_en;
	rand bit w_rst_n;
	rand bit r_rst_n;
	rand bit [data_width-1:0] data_in;
	bit [data_width-1:0] data_out;
	bit empty, full;
	bit [ptr_width:0] waddr, raddr;
	
	constraint no_rst {w_rst_n == 1 && r_rst_n ==1;}//Constraint for reset
	
	function string convert2str();
	   return $sformatf ("w_en =%0d, r_en =%0d,data_in =%0d",w_en,r_en,data_in);
	endfunction
	
	// creating a new constructor for sequence item class
	function new (string name = "fifo_seq_item");
		super.new(name);
	endfunction
endclass
		
	