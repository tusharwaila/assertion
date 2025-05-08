module tb;
bit[1:0]addr;
bit[3:0]data;
bit valid;
bit ready;
bit clk=0;
bit rst=0;

always #5 clk=!clk;

property handshake_check;
@(posedge clk) disable iff(!rst)
$rose(valid)|-> ready[->1]##1(!valid);
endproperty

hcc:assert property(handshake_check)
    $display("--------------pass verified------------");
	else
	$display("--------------fail to verify-----------");

initial begin
#5;
rst=1;
#10;
ready=1;
#10;
addr=0;
data=0;
valid=1;
ready=0;
#20;
ready=1;
#10;
valid=0;     //1 handshake complete


#10;
addr=1;
data=1;
valid=1;
ready=1;
#10;
valid=0;     //2 handshake complete


end

initial begin
#200;
$finish();
end

initial begin
$dumpfile("handshake.vcd");
$dumpvars();
end


initial begin
$recordfile("handshake.trn");
$recordvars();
end

endmodule
