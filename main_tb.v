module main_tb();
    reg [31:0] address;
    reg clk;

    wire [31:0] dataOut;
    wire hit;

    integer count = 0;
    integer fp1;
    integer temp;
    integer instructionCount;
    reg [31:0] A;

    main uut(
    .clk(clk),
    .hit(hit),
    .address(address),
    .dataOut(dataOut)
    );
    initial begin 
        fp1 = $fopen("instruction_sets/gcc.txt", "r");
        clk = 0;
        count = 1;
        instructionCount = 0;
        while(!$feof(fp1)) begin
            temp = $fscanf(fp1,"%h\n",A);
            address = A; #10;
            instructionCount = instructionCount + 1;
        end
        $fclose(fp1);
        $finish;
    end

    always begin
        #2 clk = ~clk;
        if(clk == 1 && hit == 0)
            count = count + 1;
        // $display("clk = %b hit = %b read = %b address = %h dataout = %h count = %d",clk,hit,uut.read,address,dataOut,count);
        $display("%d %d",instructionCount,count);
    end
endmodule