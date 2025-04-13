module bai9(SW, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);
input [0:0] SW;
input CLOCK_50; 
output reg [17:0] LEDR;
output reg [7:0] LEDG;
output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

// ---------- Khai báo trạng thái ----------
parameter ON = 6'b101000;
parameter OFF = 6'b101001;
parameter ON1 = 6'b101010;
parameter OFF1 = 6'b101011;

parameter s0  = 6'b000000;
parameter s1  = 6'b000001;
parameter s2  = 6'b000010;
parameter s3  = 6'b000011;
parameter s4  = 6'b000100;
parameter s5  = 6'b000101;
parameter s6  = 6'b000110;
parameter s7  = 6'b000111;
parameter s8  = 6'b001000;
parameter s9  = 6'b001001;
parameter s10 = 6'b001010;
parameter s11 = 6'b001011;
parameter s12 = 6'b001100;
parameter s13 = 6'b001101;
parameter s14 = 6'b001110;
parameter s15 = 6'b001111;
parameter s16 = 6'b010000;
parameter s17 = 6'b010001;
parameter s18 = 6'b010010;
parameter s19 = 6'b010011;
parameter s20 = 6'b010100;
parameter s21 = 6'b010101;
parameter s22 = 6'b010110;
parameter s23 = 6'b010111;
parameter s24 = 6'b011000;
parameter s25 = 6'b011001;
parameter s26 = 6'b011010;
parameter s27 = 6'b011011;
parameter s28 = 6'b011100;
parameter s29 = 6'b011101;
parameter s30 = 6'b011110;
parameter s31 = 6'b011111;
parameter s32 = 6'b100000;
parameter s33 = 6'b100001;
parameter s34 = 6'b100010;
parameter s35 = 6'b100011;
parameter s36 = 6'b100100;
parameter s37 = 6'b100101;
parameter s38 = 6'b100110;

reg [5:0] current_state, next_state;
reg clock_1s = 0, clock_200ms = 0, clock_2s = 0;

reg [31:0] q = 0, p = 0, c = 0;

// ---------- Tạo clock 1s ----------
always @(posedge CLOCK_50) begin
    q <= q + 1;
    if (q == 25000000) begin
        clock_1s <= ~clock_1s;
        q <= 0;
    end
end

// ---------- Tạo clock 200ms ----------
always @(posedge CLOCK_50) begin
    p <= p + 1;
    if (p == 10000000) begin
        clock_200ms <= ~clock_200ms;
        p <= 0;
    end
end

// ---------- Tạo clock 2s ----------
always @(posedge CLOCK_50) begin
    c <= c + 1;
    if (c == 100000000) begin
        clock_2s <= ~clock_2s;
        c <= 0;
    end
end

// ---------- FSM chuyển trạng thái ----------
always @(*) begin
    case (current_state)
        ON: next_state = OFF;
        OFF: next_state = ON;
        ON1: next_state = OFF1;
        OFF1: next_state = ON1;

        s0: next_state = s1;
        s1: next_state = s2;
        s2: next_state = s3;
        s3: next_state = s4;
        s4: next_state = s5;
        s5: next_state = s6;
        s6: next_state = s7;
        s7: next_state = s8;
        s8: next_state = s9;
        s9: next_state = s10;
        s10: next_state = s11;
        s11: next_state = s12;
        s12: next_state = s13;
        s13: next_state = s14;
        s14: next_state = s15;
        s15: next_state = s16;
        s16: next_state = s17;
        s17: next_state = s18;
        s18: next_state = s19;
        s19: next_state = s20;
        s20: next_state = s21;
        s21: next_state = s22;
        s22: next_state = s23;
        s23: next_state = s24;
        s24: next_state = s25;
        s25: next_state = s26;
        s26: next_state = s27;
        s27: next_state = s28;
        s28: next_state = s29;
        s29: next_state = s30;
        s30: next_state = s31;
        s31: next_state = s32;
        s32: next_state = s33;
        s33: next_state = s34;
        s34: next_state = s35;
        s35: next_state = s36;
        s36: next_state = s37;
        s37: next_state = s38;
        s38: next_state = s0;
        default: next_state = s0;
    endcase
end

// ---------- Điều khiển trạng thái ----------
always @(posedge clock_1s or posedge SW[0]) begin
    if (SW[0]) current_state <= OFF;
    else current_state <= next_state;
end

// ---------- LED 7 đoạn ----------
always @(*) begin
    case (current_state)
        ON: begin
            HEX7 = 7'b0001001; // H
            HEX6 = 7'b0001000; // A
            HEX5 = 7'b0001100; // P
            HEX4 = 7'b0001100; // P
            HEX3 = 7'b0010001; // Y
            HEX2 = 7'b1000000; // D
            HEX1 = 7'b0001000; // A
            HEX0 = 7'b0010001; // Y
        end
        OFF: begin
            HEX7 = 7'b1111111;
            HEX6 = 7'b1111111;
            HEX5 = 7'b1111111;
            HEX4 = 7'b1111111;
            HEX3 = 7'b1111111;
            HEX2 = 7'b1111111;
            HEX1 = 7'b1111111;
            HEX0 = 7'b1111111;
        end
        default: begin
            HEX7 = 7'b1111111;
            HEX6 = 7'b1111111;
            HEX5 = 7'b1111111;
            HEX4 = 7'b1111111;
            HEX3 = 7'b1111111;
            HEX2 = 7'b1111111;
            HEX1 = 7'b1111111;
            HEX0 = 7'b1111111;
        end
    endcase
end

// ---------- LED đỏ ----------
always @(*) begin
    case (current_state)
        s0: LEDR = 18'b100000000000000000;
        s1: LEDR = 18'b110000000000000000;
        s2: LEDR = 18'b111000000000000000;
        s3: LEDR = 18'b111100000000000000;
        s4: LEDR = 18'b111110000000000000;
        s5: LEDR = 18'b111111000000000000;
        s6: LEDR = 18'b111111100000000000;
        s7: LEDR = 18'b111111110000000000;
        s8: LEDR = 18'b111111111000000000;
        s9: LEDR = 18'b111111111100000000;
        s10: LEDR = 18'b111111111110000000;
        s11: LEDR = 18'b111111111111000000;
        s12: LEDR = 18'b111111111111100000;
        s13: LEDR = 18'b111111111111110000;
        s14: LEDR = 18'b111111111111111000;
        s15: LEDR = 18'b111111111111111100;
        s16: LEDR = 18'b111111111111111110;
        s17: LEDR = 18'b111111111111111111;
        s18: LEDR = 18'b000000000000000000;
        s19: LEDR = 18'b000000000000000001;
        s20: LEDR = 18'b000000000000000011;
        s21: LEDR = 18'b000000000000000111;
        s22: LEDR = 18'b000000000000001111;
        s23: LEDR = 18'b000000000000011111;
        s24: LEDR = 18'b000000000000111111;
        s25: LEDR = 18'b000000000001111111;
        s26: LEDR = 18'b000000000011111111;
        s27: LEDR = 18'b000000000111111111;
        s28: LEDR = 18'b000000001111111111;
        s29: LEDR = 18'b000000011111111111;
        s30: LEDR = 18'b000000111111111111;
        s31: LEDR = 18'b000001111111111111;
        s32: LEDR = 18'b000011111111111111;
        s33: LEDR = 18'b000111111111111111;
        s34: LEDR = 18'b001111111111111111;
        s35: LEDR = 18'b011111111111111111;
        s36: LEDR = 18'b111111111111111111;
        default: LEDR = 18'b000000000000000000;
    endcase
end
endmodule
