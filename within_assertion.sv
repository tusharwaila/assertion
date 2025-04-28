//when req is asserted grant should come within 3 to 5 cycles.

module tb;
bit req;
bit grant;
bit clk;

always #5 clk = !clk;

property ppt;
@(posedge clk)
req |-> ##[3:5] grant;
endproperty

acc:assert property (ppt)
    $display("---------------pass--------------------",$time);
	else
	$display("---------------fail--------------------",$time);


initial begin 
#5;
req=1;
#40;
grant=1;
#10;
grant=0;
req=0;
#100;
$finish();
end


initial begin
$dumpfile("within.vcd");
$dumpvars();
end

initial begin
$recordfile("within.trn");
$recordvars();
end
endmodule
