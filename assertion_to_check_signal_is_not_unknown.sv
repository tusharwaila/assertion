//without using !$isunknown how to write assertion to check the same thing
module tb;
bit clk=0;
 logic a;
  always #5 clk=!clk;
  
  initial begin
  #5 a='b1;
  #10 a='bx;
  #10 a='b0;
  #10 a='bz;
  #10 a='b1;
  #10 a='bx;
  end

  property ppt;
    @(posedge clk)
    $countbits(a,'bx,'bz)==0;
  endproperty
  
  acc:assert property(ppt)
    $display("--------------------bhot badiya beta---------------------------");
    else
      $display("------------------galat hai faill------------------------------------");
initial begin
  $dumpfile("clk.vcd");
  $dumpvars;
  #200;
  $finish();
end
endmodule
    
