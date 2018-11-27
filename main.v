`include "cache_memory.v"
`include "main_memory.v"
`include "cache_controller.v"

module main(clk,address,dataOut,hit);
    input clk;
    input [31:0] address;

    output [31:0] dataOut;
    output hit;

    wire read;
    wire [511:0] dataIn;

    // assign read = 1'b1;

    main_memory u0(clk,address,dataIn);
    cache_memory u1(clk,address,read,dataIn,dataOut,hit);
    cache_controller u2(clk,hit,read);

endmodule