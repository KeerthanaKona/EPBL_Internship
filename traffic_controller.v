module traffic_controller(
input clk,
input rst,
input [7:0] density1,
input [7:0] density2,
input [7:0] density3,
input [7:0] density4,
input amb1,
input amb2,
input amb3,
input amb4,
output reg [1:0] state
);

reg [7:0] v1;
reg [7:0] v2;
reg [7:0] v3;
reg [7:0] v4;

reg [7:0] w1;
reg [7:0] w2;
reg [7:0] w3;
reg [7:0] w4;

parameter STARVE_LIMIT = 20;

always @(posedge clk or posedge rst)
begin
if(rst)
begin
v1 <= density1;
v2 <= density2;
v3 <= density3;
v4 <= density4;

w1 <= 0;
w2 <= 0;
w3 <= 0;
w4 <= 0;

state <= 0;
end
else
begin

if(amb1) state <= 2'b00;
else if(amb2) state <= 2'b01;
else if(amb3) state <= 2'b10;
else if(amb4) state <= 2'b11;

else if(w1 >= STARVE_LIMIT) state <= 2'b00;
else if(w2 >= STARVE_LIMIT) state <= 2'b01;
else if(w3 >= STARVE_LIMIT) state <= 2'b10;
else if(w4 >= STARVE_LIMIT) state <= 2'b11;

else
begin
if(v1 >= v2 && v1 >= v3 && v1 >= v4)
state <= 2'b00;
else if(v2 >= v1 && v2 >= v3 && v2 >= v4)
state <= 2'b01;
else if(v3 >= v1 && v3 >= v2 && v3 >= v4)
state <= 2'b10;
else
state <= 2'b11;
end

case(state)

2'b00:
begin
if(v1 > 0)
v1 <= v1 - 1;

w1 <= 0;

if(v2 > 0)
w2 <= w2 + 1;

if(v3 > 0)
w3 <= w3 + 1;

if(v4 > 0)
w4 <= w4 + 1;
end

2'b01:
begin
if(v2 > 0)
v2 <= v2 - 1;

w2 <= 0;

if(v1 > 0)
w1 <= w1 + 1;

if(v3 > 0)
w3 <= w3 + 1;

if(v4 > 0)
w4 <= w4 + 1;
end

2'b10:
begin
if(v3 > 0)
v3 <= v3 - 1;

w3 <= 0;

if(v1 > 0)
w1 <= w1 + 1;

if(v2 > 0)
w2 <= w2 + 1;

if(v4 > 0)
w4 <= w4 + 1;
end

2'b11:
begin
if(v4 > 0)
v4 <= v4 - 1;

w4 <= 0;

if(v1 > 0)
w1 <= w1 + 1;

if(v2 > 0)
w2 <= w2 + 1;

if(v3 > 0)
w3 <= w3 + 1;
end

endcase

end
end

endmodule
