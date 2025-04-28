module tb;
bit req;
bit grant;
bit clk=0;

always #5 clk = !clk;

property ppt;
@(posedge clk)
req |=>grant[=3]##1(!req);
endproperty

acc :assert property(ppt)
     $display("-----------------------pass-----------------------",$time);
	 else
	 $display("-----------------------fail-----------------------",$time);

initial begin
#5;
req=1;
#10;
grant=1;
#10;
grant=0;
#10;
grant=1;
#10;
grant=0;
#10;
grant=1;
#10;
grant=0;
#20;
req=0;
#200;
$finish();
end


initial begin
$dumpfile("nonconsecutive.vcd");
$dumpvars();
end

initial begin
$recordfile("nonconsecutive.trn");
$recordvars();
end
endmodule
