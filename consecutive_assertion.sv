module tb;
bit req;
bit grant;
bit clk=0;

always #5 clk = !clk;

property ppt;
@(posedge clk)
req |=>##1 grant[*3:5];
endproperty

acc:assert property(ppt)
    $display("-------------------pass-----------------",$time);
	else
	$display("-------------------fail-----------------",$time);

initial begin
#5;
req=1;
#20;
grant=1;
#40;
grant =0;
#100;
$finish();
end

initial begin
$dumpfile("consecutive.vcd");
$dumpvars();
end

initial begin
$recordfile("consecutive.trn");
$recordvars();
end

endmodule
