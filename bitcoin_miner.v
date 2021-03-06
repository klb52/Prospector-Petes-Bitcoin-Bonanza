module bitcoin_miner(in0, in1, in2, in3, clk, out);
	input clk;
	input [31:0] in0, in1, in2, in3;
	wire [31:0] in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
	output [255:0] out;
	
	wire [255:0] rh_out, rs;
	wire [511:0] rd_out;
	wire [2047:0] rk_out, rw_out;
	
	reg_data rd(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, 
	in11, in12, in13, in14, in15, clr, clk, clk_en, rd_out);
	
	reg_h rh(clr, clk, clk_en, rh_out); 
	reg_k rk(clr, clk, clk_en, rk_out);
	reg_w rw(rd_out, clr, clk, clk_en, rw_out);
	
	wire [255:0] c0_in, c0_out;
	reg_ints    r0(rh_out, clr, clk, clk_en, c0_in);
	compression c0(c0_in, rw_out[31:0], rk_out[31:0], c0_out);
	
	/*
	wire [255:0] c1_in, c1_out;
	reg_ints    r1(c0_out, clr, clk, clk_en, c1_in);
	compression c1(c1_in, rw_out[63:32], rk_out[63:32], c1_out);
	
	wire [255:0] c2_in, c2_out;
	reg_ints    r2(c1_out, clr, clk, clk_en, c2_in);
	compression c2(c2_in, rw_out[95:64], rk_out[95:64], c2_out);
	
	wire [255:0] c3_in, c3_out;
	reg_ints    r3(c2_out, clr, clk, clk_en, c3_in);
	compression c3(c3_in, rw_out[127:96], rk_out[127:96], c3_out);
	
	wire [255:0] c4_in, c4_out;
	reg_ints    r4(c3_out, clr, clk, clk_en, c4_in);
	compression c4(c4_in, rw_out[159:128], rk_out[159:128], c4_out);
	
	wire [255:0] c5_in, c5_out;
	reg_ints    r5(c4_out, clr, clk, clk_en, c5_in);
	compression c5(c5_in, rw_out[191:160], rk_out[191:160], c5_out);
	
	wire [255:0] c6_in, c6_out;
	reg_ints    r6(c5_out, clr, clk, clk_en, c6_in);
	compression c6(c6_in, rw_out[223:192], rk_out[223:192], c6_out);
	
	wire [255:0] c7_in, c7_out;
	reg_ints    r7(c6_out, clr, clk, clk_en, c7_in);
	compression c7(c7_in, rw_out[255:224], rk_out[255:224], c7_out);
	
	wire [255:0] c8_in, c8_out;
	reg_ints    r8(c7_out, clr, clk, clk_en, c8_in);
	compression c8(c8_in, rw_out[287:256], rk_out[287:256], c8_out);
	
	wire [255:0] c9_in, c9_out;
	reg_ints    r9(c8_out, clr, clk, clk_en, c9_in);
	compression c9(c9_in, rw_out[319:288], rk_out[319:288], c9_out);
	
	wire [255:0] c10_in, c10_out;
	reg_ints    r10(c9_out, clr, clk, clk_en, c10_in);
	compression c10(c10_in, rw_out[351:320], rk_out[351:320], c10_out);
	
	wire [255:0] c11_in, c11_out;
	reg_ints    r11(c10_out, clr, clk, clk_en, c11_in);
	compression c11(c11_in, rw_out[383:352], rk_out[383:352], c11_out);
	
	wire c12_in, c12_out;
	reg_ints    r12(c11_out, clr, clk, clk_en, c12_in);
	compression c12(c12_in, rw_out[415:384], rk_out[415:384], c12_out);
	
	wire [255:0] c13_in, c13_out;
	reg_ints    r13(c12_out, clr, clk, clk_en, c13_in);
	compression c13(c13_in, rw_out[447:416], rk_out[447:416], c13_out);
	
	wire [255:0] c14_in, c14_out;
	reg_ints    r14(c13_out, clr, clk, clk_en, c14_in);
	compression c14(c14_in, rw_out[479:448], rk_out[479:448], c14_out);
	
	wire [255:0] c15_in, c15_out;
	reg_ints    r15(c14_out, clr, clk, clk_en, c15_in);
	compression c15(c15_in, rw_out[511:480], rk_out[511:480], c15_out);
	
	wire [255:0] c16_in, c16_out;
	reg_ints    r16(c15_out, clr, clk, clk_en, c16_in);
	compression c16(c16_in, rw_out[543:512], rk_out[543:512], c16_out);
	
	wire [255:0] c17_in, c17_out;
	reg_ints    r17(c16_out, clr, clk, clk_en, c17_in);
	compression c17(c17_in, rw_out[575:544], rk_out[575:544], c17_out);
	
	wire [255:0] c18_in, c18_out;
	reg_ints    r18(c17_out, clr, clk, clk_en, c18_in);
	compression c18(c18_in, rw_out[607:576], rk_out[607:576], c18_out);
	
	wire [255:0] c19_in, c19_out;
	reg_ints    r19(c18_out, clr, clk, clk_en, c19_in);
	compression c19(c19_in, rw_out[639:608], rk_out[639:608], c19_out);
	
	wire [255:0] c20_in, c20_out;
	reg_ints    r20(c19_out, clr, clk, clk_en, c20_in);
	compression c20(c20_in, rw_out[671:640], rk_out[671:640], c20_out);
	
	wire [255:0] c21_in, c21_out;
	reg_ints    r21(c20_out, clr, clk, clk_en, c21_in);
	compression c21(c21_in, rw_out[703:672], rk_out[703:672], c21_out);
	
	wire [255:0] c22_in, c22_out;
	reg_ints    r22(c21_out, clr, clk, clk_en, c22_in);
	compression c22(c22_in, rw_out[735:704], rk_out[735:704], c22_out);
	
	wire [255:0] c23_in, c23_out;
	reg_ints    r23(c22_out, clr, clk, clk_en, c23_in);
	compression c23(c23_in, rw_out[767:736], rk_out[767:736], c23_out);
	
	wire [255:0] c24_in, c24_out;
	reg_ints    r24(c23_out, clr, clk, clk_en, c24_in);
	compression c24(c24_in, rw_out[799:768], rk_out[799:768], c24_out);
	
	wire [255:0] c25_in, c25_out;
	reg_ints    r25(c24_out, clr, clk, clk_en, c25_in);
	compression c25(c25_in, rw_out[831:800], rk_out[831:800], c25_out);
	
	wire [255:0] c26_in, c26_out;
	reg_ints    r26(c25_out, clr, clk, clk_en, c26_in);
	compression c26(c26_in, rw_out[863:832], rk_out[863:832], c26_out);
	
	wire [255:0] c27_in, c27_out;
	reg_ints    r27(c26_out, clr, clk, clk_en, c27_in);
	compression c27(c27_in, rw_out[895:864], rk_out[895:864], c27_out);
	
	wire [255:0] c28_in, c28_out;
	reg_ints    r28(c27_out, clr, clk, clk_en, c28_in);
	compression c28(c28_in, rw_out[927:896], rk_out[927:896], c28_out);
	
	wire [255:0] c29_in, c29_out;
	reg_ints    r29(c28_out, clr, clk, clk_en, c29_in);
	compression c29(c29_in, rw_out[959:928], rk_out[959:928], c29_out);
	
	wire [255:0] c30_in, c30_out;
	reg_ints    r30(c29_out, clr, clk, clk_en, c30_in);
	compression c30(c30_in, rw_out[991:960], rk_out[991:960], c30_out);
	
	wire [255:0] c31_in, c31_out;
	reg_ints    r31(c30_out, clr, clk, clk_en, c31_in);
	compression c31(c31_in, rw_out[1023:992], rk_out[1023:992], c31_out);
	
	wire [255:0] c32_in, c32_out;
	reg_ints    r32(c31_out, clr, clk, clk_en, c32_in);
	compression c32(c32_in, rw_out[1055:1024], rk_out[1055:1024], c32_out);
	
	wire [255:0] c33_in, c33_out;
	reg_ints    r33(c32_out, clr, clk, clk_en, c33_in);
	compression c33(c33_in, rw_out[1087:1056], rk_out[1087:1056], c33_out);
	
	wire [255:0] c34_in, c34_out;
	reg_ints    r34(c33_out, clr, clk, clk_en, c34_in);
	compression c34(c34_in, rw_out[1119:1088], rk_out[1119:1088], c34_out);
	
	wire [255:0] c35_in, c35_out;
	reg_ints    r35(c34_out, clr, clk, clk_en, c35_in);
	compression c35(c35_in, rw_out[1151:1120], rk_out[1151:1120], c35_out);
	
	wire [255:0] c36_in, c36_out;
	reg_ints    r36(c35_out, clr, clk, clk_en, c36_in);
	compression c36(c36_in, rw_out[1183:1152], rk_out[1183:1152], c36_out);
	
	wire [255:0] c37_in, c37_out;
	reg_ints    r37(c36_out, clr, clk, clk_en, c37_in);
	compression c37(c37_in, rw_out[1215:1184], rk_out[1215:1184], c37_out);
	
	wire [255:0] c38_in, c38_out;
	reg_ints    r38(c37_out, clr, clk, clk_en, c38_in);
	compression c38(c38_in, rw_out[1247:1216], rk_out[1247:1216], c38_out);
	
	wire [255:0] c39_in, c39_out;
	reg_ints    r39(c38_out, clr, clk, clk_en, c39_in);
	compression c39(c39_in, rw_out[1279:1248], rk_out[1279:1248], c39_out);
	
	wire [255:0] c40_in, c40_out;
	reg_ints    r40(c39_out, clr, clk, clk_en, c40_in);
	compression c40(c40_in, rw_out[1311:1280], rk_out[1311:1280], c40_out);
	
	wire [255:0] c41_in, c41_out;
	reg_ints    r41(c40_out, clr, clk, clk_en, c41_in);
	compression c41(c41_in, rw_out[1343:1312], rk_out[1343:1312], c41_out);
	
	wire [255:0] c42_in, c42_out;
	reg_ints    r42(c41_out, clr, clk, clk_en, c42_in);
	compression c42(c42_in, rw_out[1375:1344], rk_out[1375:1344], c42_out);
	
	wire [255:0] c43_in, c43_out;
	reg_ints    r43(c42_out, clr, clk, clk_en, c43_in);
	compression c43(c43_in, rw_out[1407:1376], rk_out[1407:1376], c43_out);
	
	wire [255:0] c44_in, c44_out;
	reg_ints    r44(c43_out, clr, clk, clk_en, c44_in);
	compression c44(c44_in, rw_out[1439:1408], rk_out[1439:1408], c44_out);
	
	wire [255:0] c45_in, c45_out;
	reg_ints    r45(c44_out, clr, clk, clk_en, c45_in);
	compression c45(c45_in, rw_out[1471:1440], rk_out[1471:1440], c45_out);
	
	wire [255:0] c46_in, c46_out;
	reg_ints    r46(c45_out, clr, clk, clk_en, c46_in);
	compression c46(c46_in, rw_out[1503:1472], rk_out[1503:1472], c46_out);
	
	wire [255:0] c47_in, c47_out;
	reg_ints    r47(c46_out, clr, clk, clk_en, c47_in);
	compression c47(c47_in, rw_out[1535:1504], rk_out[1535:1504], c47_out);
	
	wire [255:0] c48_in, c48_out;
	reg_ints    r48(c47_out, clr, clk, clk_en, c48_in);
	compression c48(c48_in, rw_out[1567:1536], rk_out[1567:1536], c48_out);
	
	wire [255:0] c49_in, c49_out;
	reg_ints    r49(c48_out, clr, clk, clk_en, c49_in);
	compression c49(c49_in, rw_out[1599:1568], rk_out[1599:1568], c49_out);
	
	wire [255:0] c50_in, c50_out;
	reg_ints    r50(c49_out, clr, clk, clk_en, c50_in);
	compression c50(c50_in, rw_out[1631:1600], rk_out[1631:1600], c50_out);
	
	wire [255:0] c51_in, c51_out;
	reg_ints    r51(c50_out, clr, clk, clk_en, c51_in);
	compression c51(c51_in, rw_out[1663:1632], rk_out[1663:1632], c51_out);
	
	wire [255:0] c52_in, c52_out;
	reg_ints    r52(c51_out, clr, clk, clk_en, c52_in);
	compression c52(c52_in, rw_out[1695:1664], rk_out[1695:1664], c52_out);
	
	wire [255:0] c53_in, c53_out;
	reg_ints    r53(c52_out, clr, clk, clk_en, c53_in);
	compression c53(c53_in, rw_out[1727:1696], rk_out[1727:1696], c53_out);
	
	wire [255:0] c54_in, c54_out;
	reg_ints    r54(c53_out, clr, clk, clk_en, c54_in);
	compression c54(c54_in, rw_out[1759:1728], rk_out[1759:1728], c54_out);
	
	wire [255:0] c55_in, c55_out;
	reg_ints    r55(c54_out, clr, clk, clk_en, c55_in);
	compression c55(c55_in, rw_out[1791:1760], rk_out[1791:1760], c55_out);
	
	wire [255:0] c56_in, c56_out;
	reg_ints    r56(c55_out, clr, clk, clk_en, c56_in);
	compression c56(c56_in, rw_out[1823:1792], rk_out[1823:1792], c56_out);
	
	wire [255:0] c57_in, c57_out;
	reg_ints    r57(c56_out, clr, clk, clk_en, c57_in);
	compression c57(c57_in, rw_out[1855:1824], rk_out[1855:1824], c57_out);
	
	wire [255:0] c58_in, c58_out;
	reg_ints    r58(c57_out, clr, clk, clk_en, c58_in);
	compression c58(c58_in, rw_out[1887:1856], rk_out[1887:1856], c58_out);
	
	wire [255:0] c59_in, c59_out;
	reg_ints    r59(c58_out, clr, clk, clk_en, c59_in);
	compression c59(c59_in, rw_out[1919:1888], rk_out[1919:1888], c59_out);
	
	wire [255:0] c60_in, c60_out;
	reg_ints    r60(c59_out, clr, clk, clk_en, c60_in);
	compression c60(c60_in, rw_out[1951:1920], rk_out[1951:1920], c60_out);
	
	wire [255:0] c61_in, c61_out;
	reg_ints    r61(c60_out, clr, clk, clk_en, c61_in);
	compression c61(c61_in, rw_out[1983:1952], rk_out[1983:1952], c61_out);
	
	wire [255:0] c62_in, c62_out;
	reg_ints    r62(c61_out, clr, clk, clk_en, c62_in);
	compression c62(c62_in, rw_out[2015:1984], rk_out[2015:1984], c62_out);
	
	wire [255:0] c63_in, c63_out;
	reg_ints    r63(c62_out, clr, clk, clk_en, c63_in);
	compression c63(c63_in, rw_out[2047:2016], rk_out[2047:2016], c63_out);
	*/
	register x1(c63_out[31:0],    rh_out[31:0],    out[31:0]); 
	register x2(c63_out[63:32],   rh_out[63:32],   out[63:32]);
	register x3(c63_out[95:64],   rh_out[95:64],   out[95:64]);
	register x4(c63_out[127:96],  rh_out[127:96],  out[127:96]);
	register x5(c63_out[159:128], rh_out[159:128], out[159:128]);
	register x6(c63_out[191:160], rh_out[191:160], out[191:160]);
	register x7(c63_out[223:192], rh_out[223:192], out[223:192]);
	register x8(c63_out[255:224], rh_out[255:224], out[255:224]);

endmodule

// Different blocks
module compression(in, w, k, out);
	input [255:0] in;
	input [31:0] w, k;
	output [255:0] out;
	
	wire [31:0] a, b, c, d, e, f, g, h, a_out, e_out;
	assign a = in[31:0]; assign b = in[63:32]; assign c = in[95:64]; assign d = in[127:96];
	assign e = in[159:128]; assign f = in[191:160]; assign g = in[223:192]; assign h = in[255:224];
	
	wire [31:0] S1_out, S0_out, ch_out, temp1, maj_out, temp2;
	
	S1 fS1(e, S1_out);
	ch fch(e, f, g, ch_out);
	my_5adder a5(h, S1_out, ch_out, w, k, temp1);
	S0 fS0(a, S0_out);
	maj fmaj(a, b, c, maj_out);
	adder a1(S0_out, maj_out, temp2);
	
	adder b1(d, temp1, e_out);
	adder c1(temp1, temp2, a_out);
	
	assign out[31:0] = a_out; assign out[63:32] = a; assign out[95:64] = b; assign out[127:96] = c;
	assign out[159:128] = e_out; assign out[191:160] = e; assign out[223:192] = f; assign out[255:224] = g;

endmodule

// Register blocks
module reg_h(clr, clk, clk_en, out);
	input clr, clk, clk_en;
	output [255:0] out;
	
	wire [31:0] ina, inb, inc, ind, ine, inf, ing, inh;
	
	assign ina = 32'h6a09e667; assign inb = 32'hbb67ae85; assign inc = 32'h3c6ef372; assign ind = 32'ha54ff53a;
	assign ine = 32'h510e527f; assign inf = 32'h9b05688c; assign ing = 32'h1f83d9ab; assign inh = 32'h5be0cd19;

	register r0(ina, 1'b0, clk, 1'b0, out[31:0]); 
	register r1(inb, 1'b0, clk, 1'b0, out[63:32]);
	register r2(inc, 1'b0, clk, 1'b0, out[95:64]);
	register r3(ind, 1'b0, clk, 1'b0, out[127:96]);
	register r4(ine, 1'b0, clk, 1'b0, out[159:128]);
	register r5(inf, 1'b0, clk, 1'b0, out[191:160]);
	register r6(ing, 1'b0, clk, 1'b0, out[223:192]);
	register r7(inh, 1'b0, clk, 1'b0, out[255:224]);

endmodule

module reg_ints(in, clr, clk, clk_en, out);
	input clr, clk, clk_en;
	input [255:0] in;
	output [255:0] out;
	
	genvar i;
	generate
	for(i=0; i<225; i=i+32) begin: loop0
		register r(in[(i+31):i], 1'b0, clk, 1'b0, out[(i+31):i]); 
	end
	endgenerate
	
endmodule

module reg_data(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, 
in11, in12, in13, in14, in15, clr, clk, clk_en, out);
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
	input clr, clk, clk_en;
	output [511:0] out;
	
	register r0(in0, 1'b0, clk, 1'b0, out[31:0]); 
	register r1(in1, 1'b0, clk, 1'b0, out[63:32]);
	register r2(in2, 1'b0, clk, 1'b0, out[95:64]);
	register r3(in3, 1'b0, clk, 1'b0, out[127:96]);
	register r4(in4, 1'b0, clk, 1'b0, out[159:128]);
	register r5(in5, 1'b0, clk, 1'b0, out[191:160]);
	register r6(in6, 1'b0, clk, 1'b0, out[223:192]);
	register r7(in7, 1'b0, clk, 1'b0, out[255:224]);
	register r8(in8, 1'b0, clk, 1'b0, out[287:256]);
	register r9(in9, 1'b0, clk, 1'b0, out[319:288]);
	
	register r10(in10, 1'b0, clk, 1'b0, out[351:320]); 
	register r11(in11, 1'b0, clk, 1'b0, out[383:352]);
	register r12(in12, 1'b0, clk, 1'b0, out[415:384]);
	register r13(in13, 1'b0, clk, 1'b0, out[447:416]);
	register r14(in14, 1'b0, clk, 1'b0, out[479:448]);
	register r15(in15, 1'b0, clk, 1'b0, out[511:480]);
endmodule

module reg_w(in, clr, clk, clk_en, out);
	input [511:0] in;
	input clr, clk, clk_en;
	output [2047:0] out;
	
	genvar i;
	generate
	for(i=0; i<481; i=i+32) begin: loop0
		register r(in[(i+31):i], 1'b0, clk, 1'b0, out[(i+31):i]); 
	end
	endgenerate
	
	generate
	for(i=512; i<2048; i=i+32) begin: loop1
		wire [31:0] s0_w, s1_w, reg_in;
		s0 fs0(out[(i-449):(i-480)], s0_w);
		s1 fs1(out[(i-33):(i-64)], s1_w);
		my_4adder a(s0_w, s1_w, out[(i-481):(i-512)], out[(i-193):(i-224)], reg_in);
		
		register r(reg_in, 1'b0, clk, 1'b0, out[(i+31):i]); 
	end
	endgenerate

endmodule

module reg_k(clr, clk, clk_en, out);
	input clr, clk, clk_en;
	output [2047:0] out;
	
	wire [31:0] k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19,
	k20, k21, k22, k23, k24, k25, k26, k27, k28, k29, k30, k31, k32, k33, k34, k35, k36, k37, k38, k39,
	k40, k41, k42, k43, k44, k45, k46, k47, k48, k49, k50, k51, k52, k53, k54, k55, k56, k57, k58, k59,
	k60, k61, k62, k63;

	assign k0 =  32'h428a2f98; assign k1 =  32'h71374491; assign k2 =  32'hb5c0fbcf; assign k3 =  32'he9b5dba5; 
	assign k4 =  32'h3956c25b; assign k5 =  32'h59f111f1; assign k6 =  32'h923f82a4; assign k7 =  32'hab1c5ed5;
	assign k8 =  32'hd807aa98; assign k9 =  32'h12835b01; assign k10 = 32'h243185be; assign k11 = 32'h550c7dc3; 
	assign k12 = 32'h72be5d74; assign k13 = 32'h80deb1fe; assign k14 = 32'h9bdc06a7; assign k15 = 32'hc19bf174;
	assign k16 = 32'he49b69c1; assign k17 = 32'hefbe4786; assign k18 = 32'h0fc19dc6; assign k19 = 32'h240ca1cc; 
	assign k20 = 32'h2de92c6f; assign k21 = 32'h4a7484aa; assign k22 = 32'h5cb0a9dc; assign k23 = 32'h76f988da;
	assign k24 = 32'h983e5152; assign k25 = 32'ha831c66d; assign k26 = 32'hb00327c8; assign k27 = 32'hbf597fc7; 
	assign k28 = 32'hc6e00bf3; assign k29 = 32'hd5a79147; assign k30 = 32'h06ca6351; assign k31 = 32'h14292967;
	assign k32 = 32'h27b70a85; assign k33 = 32'h2e1b2138; assign k34 = 32'h4d2c6dfc; assign k35 = 32'h53380d13; 
	assign k36 = 32'h650a7354; assign k37 = 32'h766a0abb; assign k38 = 32'h81c2c92e; assign k39 = 32'h92722c85;
	assign k40 = 32'ha2bfe8a1; assign k41 = 32'ha81a664b; assign k42 = 32'hc24b8b70; assign k43 = 32'hc76c51a3; 
	assign k44 = 32'hd192e819; assign k45 = 32'hd6990624; assign k46 = 32'hf40e3585; assign k47 = 32'h106aa070;
	assign k48 = 32'h19a4c116; assign k49 = 32'h1e376c08; assign k50 = 32'h2748774c; assign k51 = 32'h34b0bcb5; 
	assign k52 = 32'h391c0cb3; assign k53 = 32'h4ed8aa4a; assign k54 = 32'h5b9cca4f; assign k55 = 32'h682e6ff3;
	assign k56 = 32'h748f82ee; assign k57 = 32'h78a5636f; assign k58 = 32'h84c87814; assign k59 = 32'h8cc70208; 
	assign k60 = 32'h90befffa; assign k61 = 32'ha4506ceb; assign k62 = 32'hbef9a3f7; assign k63 = 32'hc67178f2;
	
	
	register r0(k0, 1'b0, clk, 1'b0, out[31:0]); 
	register r1(k1, 1'b0, clk, 1'b0, out[63:32]);
	register r2(k2, 1'b0, clk, 1'b0, out[95:64]);
	register r3(k3, 1'b0, clk, 1'b0, out[127:96]);
	register r4(k4, 1'b0, clk, 1'b0, out[159:128]);
	register r5(k5, 1'b0, clk, 1'b0, out[191:160]);
	register r6(k6, 1'b0, clk, 1'b0, out[223:192]);
	register r7(k7, 1'b0, clk, 1'b0, out[255:224]);
	register r8(k8, 1'b0, clk, 1'b0, out[287:256]);
	register r9(k9, 1'b0, clk, 1'b0, out[319:288]);
	
	register r10(k10, 1'b0, clk, 1'b0, out[351:320]); 
	register r11(k11, 1'b0, clk, 1'b0, out[383:352]);
	register r12(k12, 1'b0, clk, 1'b0, out[415:384]);
	register r13(k13, 1'b0, clk, 1'b0, out[447:416]);
	register r14(k14, 1'b0, clk, 1'b0, out[479:448]);
	register r15(k15, 1'b0, clk, 1'b0, out[511:480]);
	register r16(k16, 1'b0, clk, 1'b0, out[543:512]);
	register r17(k17, 1'b0, clk, 1'b0, out[575:544]);
	register r18(k18, 1'b0, clk, 1'b0, out[607:576]);
	register r19(k19, 1'b0, clk, 1'b0, out[639:608]); 
	register r61(k20, 1'b0, clk, 1'b0, out[703:672]); // Added here
	
	register r20(k21, 1'b0, clk, 1'b0, out[703:672]); 
	register r21(k22, 1'b0, clk, 1'b0, out[735:704]);
	register r22(k23, 1'b0, clk, 1'b0, out[767:736]);
	register r23(k24, 1'b0, clk, 1'b0, out[799:768]);
	register r24(k25, 1'b0, clk, 1'b0, out[831:800]);
	register r25(k26, 1'b0, clk, 1'b0, out[863:832]);
	register r26(k27, 1'b0, clk, 1'b0, out[895:864]);
	register r27(k28, 1'b0, clk, 1'b0, out[927:896]);
	register r28(k29, 1'b0, clk, 1'b0, out[959:928]);
	register r29(k30, 1'b0, clk, 1'b0, out[991:960]);

	register r30(k31, 1'b0, clk, 1'b0, out[1023:992]); 
	register r31(k32, 1'b0, clk, 1'b0, out[1055:1024]);
	register r32(k33, 1'b0, clk, 1'b0, out[1087:1056]);
	register r33(k34, 1'b0, clk, 1'b0, out[1119:1088]);
	register r34(k35, 1'b0, clk, 1'b0, out[1151:1120]);
	register r35(k36, 1'b0, clk, 1'b0, out[1183:1152]);
	register r36(k37, 1'b0, clk, 1'b0, out[1215:1184]);
	register r37(k38, 1'b0, clk, 1'b0, out[1247:1216]);
	register r38(k39, 1'b0, clk, 1'b0, out[1279:1248]);
	register r39(k40, 1'b0, clk, 1'b0, out[1311:1280]);
	
	register r40(k41, 1'b0, clk, 1'b0, out[1343:1312]); 
	register r41(k42, 1'b0, clk, 1'b0, out[1375:1344]);
	register r42(k43, 1'b0, clk, 1'b0, out[1407:1376]);
	register r43(k44, 1'b0, clk, 1'b0, out[1439:1408]);
	register r44(k45, 1'b0, clk, 1'b0, out[1471:1440]);
	register r45(k46, 1'b0, clk, 1'b0, out[1503:1472]);
	register r46(k47, 1'b0, clk, 1'b0, out[1535:1504]);
	register r47(k48, 1'b0, clk, 1'b0, out[1567:1536]);
	register r48(k49, 1'b0, clk, 1'b0, out[1599:1568]);
	register r62(k50, 1'b0, clk, 1'b0, out[1631:1600]); // Added here
	
	register r49(k51, 1'b0, clk, 1'b0, out[1663:1632]);
	register r50(k52, 1'b0, clk, 1'b0, out[1695:1664]); 
	register r51(k53, 1'b0, clk, 1'b0, out[1727:1696]);
	register r52(k54, 1'b0, clk, 1'b0, out[1759:1728]);
	register r53(k55, 1'b0, clk, 1'b0, out[1791:1760]);
	register r54(k56, 1'b0, clk, 1'b0, out[1823:1792]);
	register r55(k57, 1'b0, clk, 1'b0, out[1855:1824]);
	register r56(k58, 1'b0, clk, 1'b0, out[1887:1856]);
	register r57(k59, 1'b0, clk, 1'b0, out[1919:1888]);
	register r58(k60, 1'b0, clk, 1'b0, out[1951:1920]);
	register r59(k61, 1'b0, clk, 1'b0, out[1983:1952]);
	
	register r60(k62, 1'b0, clk, 1'b0, out[2015:1984]); 
	register r63(k63, 1'b0, clk, 1'b0, out[2047:2016]);
endmodule

// Different functions
module s0(in, out);
	input [31:0] in;
	output [31:0] out;
	
	// Assign shift bits
	wire [4:0] s7, s18, s3;
	assign s7  = 5'b00111;
	assign s18 = 5'b10010;
	assign s3  = 5'b00011;
	
	// Create the three values to go into 3xor
	wire [31:0] a, b, c;
	
	my_rr  w7(in,  s7, a);
	my_rr w18(in, s18, b);
	my_sra w3(in,  s3, c);
	
	my_3xor s(a, b, c, out);

endmodule

module s1(in, out);
	input [31:0] in;
	output [31:0] out;
	
	// Create the shift values
	wire [4:0] s17, s19, s10;
	assign s17 = 5'b10001;
	assign s19 = 5'b10011;
	assign s10 = 5'b01010;
	
	// Create the three values to go into 3xor
	wire [31:0] a, b, c;
	
	my_rr  w17(in, s17, a);
	my_rr  w19(in, s19, b);
	my_sra w10(in, s10, c);
	
	my_3xor s(a, b, c, out);

endmodule

module my_4adder(a, b, c, d, out);
	input [31:0] a, b, c, d;
	output [31:0] out;
	
	wire [31:0] add1, add2;
	
	adder a1(a, b, add1);
	adder a2(add1, c, add2);
	adder a3(add2, d, out);

endmodule

module my_5adder(a, b, c, d, e, out);
	input [31:0] a, b, c, d, e;
	output [31:0] out;
	
	wire [31:0] add1;
	
	my_4adder(a, b, c, d, add1);
	adder a5(add1, e, out);
	
endmodule

module ch(e, f, g, out);
	input [31:0] e, f, g;
	output [31:0] out;
	
	genvar c;
	generate
	for(c=0; c<32; c=c+1) begin: loop1
		assign out[c] = (e[c]&f[c])^(~e[c]&g[c]);
	end
	endgenerate

endmodule

module maj(a, b, c, out);
	input [31:0] a, b, c;
	output [31:0] out;
	
	genvar i;
	generate
	for(i=0; i<32; i=i+1) begin: loop1
		assign out[i] = (a[i]&b[i])^(a[i]&c[i])^(b[i]&c[i]);
	end
	endgenerate
	
endmodule

module S1(in, out);
	input [31:0] in;
	output [31:0] out;
	
	// Assign shift bits
	wire [4:0] s6, s11, s25;
	assign s6  = 5'b00110;
	assign s11 = 5'b01011;
	assign s25 = 5'b11001;
	
	// Create the three values to go into 3xor
	wire [31:0] a, b, c;
	
	my_rr  w6(in,  s6, a);
	my_rr w11(in, s11, b);
	my_rr w25(in, s25, c);
	
	my_3xor s(a, b, c, out);

endmodule

module S0(in, out);
	input [31:0] in;
	output [31:0] out;
	// Create the shift values
	wire [4:0] s2, s13, s22;
	assign s2  = 5'b00010;
	assign s13 = 5'b01101;
	assign s22 = 5'b10110;
	
	// Create the three values to go into 3xor
	wire [31:0] a, b, c;
	
	my_rr  w2(in, s2, a);
	my_rr w13(in, s13, b);
	my_rr w22(in, s22, c);
	
	my_3xor s(a, b, c, out);

endmodule
