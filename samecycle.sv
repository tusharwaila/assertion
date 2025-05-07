module tb;
bit req;
bit grant;
bit clk=0;

always #5 clk=!clk;

property ppt;
@(posedge clk)
  $rose(req)|-> grant;
endproperty

acc:assert property(ppt)
    $display("----------------pass------------");
	else
	$display("----------------fail------------");

initial begin
#5;
req=1;
grant=1;
#100;
$finish();
end

initial begin
$dumpfile("nextcycle.vcd");
$dumpvars();
end

initial begin
$recordfile("nextcycle.trn");
$recordvars();
end
endmodule
