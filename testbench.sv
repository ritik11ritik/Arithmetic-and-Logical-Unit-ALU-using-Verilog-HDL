// Code your testbench here
// or browse Examples
module testbench;
  reg[7:0] A,B;
  reg[3:0] ALU_Sel;
  
  wire[7:0] ALU_Out;
  wire CarryOut;
  
  integer i;
  
  ALU alu1(
    A,B,
    ALU_Sel,
    ALU_Out,
    CarryOut
  );
  
  initial
    begin
      A = 8'b00001101;	//13
      B = 8'b00000001;	//1
      ALU_Sel = 4'b0000;
      
      for(i=0;i<=15;i=i+1)
        begin
          #10;
          $display(ALU_Out);
          $display(CarryOut);
          ALU_Sel = ALU_Sel + 4'b0001;
        end
      
    end
endmodule