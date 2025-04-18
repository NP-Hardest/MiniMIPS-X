module memory(clk, write_enable, read_address, write_address, data_in, data_out);

    input clk, write_enable;
    input [31:0] read_address, write_address, data_in;
    output [31:0] data_out;

    reg [31:0] data_read;

    reg [31:0] mem [1023:0];

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

    always @(posedge clk) begin
        
        if(write_enable) begin
             mem[write_address] <= data_in;
        end     
        data_read <= mem[read_address];
    end

    assign data_out = mem[read_address];

endmodule

