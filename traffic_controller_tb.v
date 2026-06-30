module traffic_controller_tb;

reg clk;
reg rst;
reg [7:0] density1;
reg [7:0] density2;
reg [7:0] density3;
reg [7:0] density4;
reg amb1;
reg amb2;
reg amb3;
reg amb4;

wire [1:0] state;

traffic_controller uut(
.clk(clk),
.rst(rst),
.density1(density1),
.density2(density2),
.density3(density3),
.density4(density4),
.amb1(amb1),
.amb2(amb2),
.amb3(amb3),
.amb4(amb4),
.state(state)
);

always #5 clk = ~clk;

integer t;

always @(posedge clk)
begin
t = t + 1;

$display("===========================================================");
$display("Time = %0d sec", t);
$display("Densities : L1=%0d L2=%0d L3=%0d L4=%0d",uut.v1,uut.v2,uut.v3,uut.v4);
$display("Waiting : L1=%0d L2=%0d L3=%0d L4=%0d",uut.w1,uut.w2,uut.w3,uut.w4);
$display("Ambulance : %b %b %b %b",amb1,amb2,amb3,amb4);

if(state==2'b00)
$display("Green Lane : L1");

else if(state==2'b01)
$display("Green Lane : L2");

else if(state==2'b10)
$display("Green Lane : L3");

else
$display("Green Lane : L4");

end

initial
begin

clk = 0;
rst = 1;
t = 0;

density1 = 0;
density2 = 0;
density3 = 0;
density4 = 0;

amb1 = 0;
amb2 = 0;
amb3 = 0;
amb4 = 0;

#20
rst = 0;

$display("TEST CASE 1 - Highest Density");

density1 = 12;
density2 = 4;
density3 = 3;
density4 = 2;

#200

$display("TEST CASE 2 - Ambulance Override");

density1 = 5;
density2 = 8;
density3 = 6;
density4 = 3;

#50
amb3 = 1;

#100
amb3 = 0;

#200

$display("TEST CASE 3 - Starvation Priority");

density1 = 25;
density2 = 1;
density3 = 1;
density4 = 1;

#500

$display("TEST CASE 4");

density1 = 3;
density2 = 7;
density3 = 2;
density4 = 1;

#200

$display("TEST CASE 5");

density1 = 1;
density2 = 2;
density3 = 3;
density4 = 9;

#300

$finish;

end

endmodule