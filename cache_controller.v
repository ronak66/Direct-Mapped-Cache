module cache_controller(clk,hit,read);
    input clk;
    input hit;
    
    output reg read;

    always@(posedge clk)
    begin
        if(hit == 1) begin
            read = 1;
        end
        else begin
            read = 0;
        end
    end
endmodule