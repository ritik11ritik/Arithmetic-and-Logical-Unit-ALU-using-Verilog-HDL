// Code your design here
module ALU(
  input [7:0] A, B,
  input [3:0] ALU_Sel,
  output [7:0] ALU_Out,
  output CarryOut
);
  reg[7:0] ALU_Res;
  wire[8:0] temp;
  assign temp = {1'b0,A} + {1'b0,B};
  assign CarryOut = temp[8];
  assign ALU_Out = ALU_Res;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, ALU);
    end
  
  always @(*)
  begin
    case(ALU_Sel)
      4'b0000:
        ALU_Res = A+B;
      4'b0001:
        ALU_Res = A-B;
      4'b0010:
        ALU_Res = A*B;
      4'b0011:
        ALU_Res = A/B;
      4'b0100:
        ALU_Res = A << 1;
      4'b0101:
        ALU_Res = A >> 1;
      4'b0110:
        ALU_Res = {A[6:0],A[7]};
      4'b0111:
        ALU_Res = {A[0],A[7:1]};
      4'b1000:
        ALU_Res = A & B;
      4'b1001:
        ALU_Res = A | B;
      4'b1010:
        ALU_Res = A ^ B;
      4'b1011:
        ALU_Res = ~(A|B);
      4'b1100:
        ALU_Res = ~(A&B);
      4'b1101:
        ALU_Res = ~(A^B);
      4'b1110:
        ALU_Res = (A>B)?8'd1:8'd0;
      4'b1111:
        ALU_Res = (A==B)?8'd1:8'd0;
      default:
        ALU_Res = A+B;
    endcase
  end
  
endmodule