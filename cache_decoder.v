module cache_decoder(clk, address, tag, index, blk_offset);
    input clk;
    input [31:0] address;

    output [19:0] tag;
    output [7:0] index;
    output [3:0] blk_offset;

    always@(posedge clk)
    begin
        tag <= address[31:12];
        index <= address[11:4];
        blk_offset <= address[3:0];
    end
endmodule