//without using !$isunknown how to write assertion to check the same thing
module tb;
bit clk=0;
 logic[3:0] a;
  always #5 clk=!clk;
  
  initial begin
  #5 a=4'b1011;
  #10 a=4'b10xz;
  #10 a=4'b1101;
  #10 a=4'b1z01;
  #10 a=4'b1010;
  #10 a=4'b101x;
  end

  property ppt;
    @(posedge clk)
   ( (^(a)==0)||(^(a)==1)) ;
 //  $countbits(a,'bx,'bz)==0;
// !$isunknown(a);
  endproperty
  
  acc:assert property(ppt)
    $display("--------------------passsss---------------------------");
    else
      $display("------------------fail------------------------------------");

initial begin
  $dumpfile("tb.vcd");
  $dumpvars;
end

initial begin
$recordfile("tb.trn");
$recordvars();
end

initial begin
#150;
$finish();
end
endmodule
    
