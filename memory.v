module memory(clk, write_enable, read_address, write_address, data_in, data_out);

    input clk, write_enable;
    input [31:0] read_address, write_address, data_in;
    output [31:0] data_out;

    reg [31:0] data_read;

    reg [31:0] mem [1023:0];

    initial begin
        mem[1] = -9; 
        mem[2] = 8; 
        mem[3] = -7; 
        mem[4] = 6; 
        mem[5] = -5; 
        mem[6] = 4; 
        mem[7] = -3; 
        mem[8] = -2; 
        mem[9] = 1; 
        mem[10] = 0; 

    end

    always @(posedge clk) begin
        
        if(write_enable) begin
             mem[write_address] <= data_in;
        end     
    end

    assign data_out = mem[read_address];

endmodule


module inst_memory(clk, write_enable, read_address, write_address, data_in, data_out);

    input clk, write_enable;
    input [31:0] read_address, write_address, data_in;
    output [31:0] data_out;

    reg [31:0] data_read;

    reg [31:0] mem [1023:0];

    initial begin
        mem[0] = {6'h8, 5'd0, 5'd8, 16'd1};
        mem[1] = {6'h8, 5'd0, 5'd9, 16'd10};
        mem[2] = {6'h8, 5'd0, 5'd10, 16'd0};
        mem[3] = {6'h8, 5'd9, 5'd11, -16'd1};       //outer loop
        mem[4] = {6'h12, 5'd10, 5'd11, 16'd17};//
        mem[5] = {6'h8, 5'd0, 5'd12, 16'd0};
        mem[6] = {6'h8, 5'd0, 5'd13, 16'd0};
        mem[7] = {6'h0, 5'd9, 5'd10, 5'd14, 5'd0, 6'h22};
        mem[8] = {6'h8, 5'd14, 5'd14, -16'd1};
        mem[9] = {6'h12, 5'd13, 5'd14, 16'd9};//
        // mem[9] = {6'h0, 5'd24, 5'd2, 5'd13, 5'd2, 6'h0};     sll
        mem[10] = {6'h0, 5'd8, 5'd13, 5'd15, 5'd0, 6'h20};
        mem[11] = {6'h23, 5'd15, 5'd25, 16'h0};
        mem[12] = {6'h23, 5'd15, 5'd23, 16'h1};
        mem[13] = {6'h14, 5'd25, 5'd23, 16'd3};//
        mem[14] = {6'h2B, 5'd15, 5'd23, 16'd0};
        mem[15] = {6'h2B, 5'd15, 5'd25, 16'd1};
        mem[16] = {6'h8, 5'd0, 5'd12, 16'h1};
        mem[17] = {6'h8, 5'd13, 5'd13, 16'h1};
        mem[18] = {6'h2, 26'h7};//
        mem[19] = {6'h4, 5'd12, 5'd0, 16'h2};//
        mem[20] = {6'h8, 5'd10, 5'd10, 16'h1};
        mem[21] = {6'h2, 26'h3};//
        mem[22] = {6'h8, 5'd1, 5'd2, 16'h20};

    end

    always @(posedge clk) begin
        
        if(write_enable) begin
             mem[write_address] <= data_in;
        end     
        data_read <= mem[read_address];
    end

    assign data_out = mem[read_address];

endmodule

