module predictor(input wire request, result, clk, taken, output reg prediction);
// request 1 -> badesh predict chie
// result 1 -> mige branch ghabli taken bood ya ne
// taken 1 or 0 ke taken boode
// Your code
reg[1:0] pred;
initial begin
pred=0;
end

always @(posedge clk)begin
    if(result)begin
        if(taken)begin
            if(pred == 2'b00)begin
                pred = 2'b01;
            end
            else if(pred == 2'b10)begin
                pred = 2'b11;
            end
            else if(pred == 2'b01)begin
                pred = 2'b10;
            end
            else if(pred == 2'b11)begin
                pred = 2'b11;
            end
        end
        else begin
            if(pred == 2'b00)begin
                pred = 2'b00;
            end
            else if(pred == 2'b10)begin
                pred = 2'b01;
            end
            else if(pred == 2'b01)begin
                pred = 2'b00;
            end
            else if(pred == 2'b11)begin
                pred = 2'b10;
            end
        end
    end
    else if(request)begin
        prediction = pred[1];
    end
end

endmodule