module tb;
bit req=0;
bit grant=0;
bit clk=0;
bit rst=0;

always #5 clk= !clk;

sequence s1;
 $rose(req);
endsequence

sequence s2;
##[1:4]grant;
endsequence 

property seq_check;
@(posedge clk) disable iff(!rst)
s1|=>s2;
endproperty

scc:assert property(seq_check)
    $display("------------property  pass-------------");
	else
	$display("------------property  fail-------------");



initial begin
#5;
rst=1;
#10;
req=1;
#30;
grant=1;
#20;
req=0;
end

initial begin
#200;
$finish();
end

initial begin
$dumpfile("seq.vcd");
$dumpvars();
end

initial begin
$recordfile("seq.trn");
$recordvars();
end

endmodule
