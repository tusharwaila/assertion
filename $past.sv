module tb;
int addr=0;
int busy=0;
bit hclk;

always #5 hclk=!hclk;

property ppt;
@(posedge hclk)
busy|=>$past(addr,1)==addr;
endproperty

acc:assert property(ppt)
    $display("--------------------pass-------------------------");
	else
	$display("--------------------fail-------------------------");


initial begin
#5;
addr=5;
#10;
addr=8;
#10;
addr=10;
#10;
addr=13;
busy=1;
#10;
addr=13;
busy=0;
#10;
addr=11;
#200;
$finish();
end

initial begin
$dumpfile("past.vcd");
$dumpvars();
end

initial begin
$recordfile("past.trn");
$recordvars();
end
endmodule
