module tb;
bit clk=0;
bit rst=0;

always #5 clk=!clk;

property ppt;
time t1;
@(posedge clk) disable iff(!rst)
((1'b1,t1=$time) |=> ($time-t1==10));
endproperty

acc:assert property(ppt)
     $display("------------------pass----------------",$time);
	 else
	 $display("------------------fail----------------",$time);


initial begin
#5;
rst=1;
#60;
rst=0;
#100;
$finish();
end

initial begin
$dumpfile("frequencyass.vcd");
$dumpvars();
end

initial begin
$recordfile("frequencyass.trn");
$recordvars();
end
endmodule
