//if req is high then grant should toggle or changed 3 times non consecutively followed by deassertion of req in the immediate next cycle
module tb;
bit req;
bit grant;
bit clk=0;
bit rst=0;

always #5 clk=!clk;

property ppt;
@(posedge clk) disable iff(!rst)
$rose(req) |=> $changed(grant)[->3]##1(!req);
endproperty

acc:assert property(ppt)
    $display("-------------pass-------------");
	else
  	$display("-------------fail-------------");

initial begin
#5;
rst=1;
#10;
req=1;
#10;
grant=1;
#20;
grant=0;
#30;
grant=1;
#10;
req=0;
#300;
$finish();
end

initial begin
$dumpfile("changegoto.vcd");
$dumpvars();
end

initial begin
$recordfile("changegoto.trn");
$recordvars();
end

endmodule
