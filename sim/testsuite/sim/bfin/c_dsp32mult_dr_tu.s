//Original:/testcases/core/c_dsp32mult_dr_tu/c_dsp32mult_dr_tu.dsp
// Spec Reference: dsp32mult single dr tu
# mach: bfin

.include "testutils.inc"
	start

imm32 r0, 0x8b235625;
imm32 r1, 0x98ba5127;
imm32 r2, 0xa3846725;
imm32 r3, 0x00080027;
imm32 r4, 0xb0ab8d29;
imm32 r5, 0x10ace82b;
imm32 r6, 0xc00c008d;
imm32 r7, 0xd2467028;
R4.H = R0.L * R0.L, R4.L = R0.L * R0.L (TFU);
R5.H = R0.L * R1.L, R5.L = R0.L * R1.H (TFU);
R6.H = R1.L * R0.L, R6.L = R1.H * R0.L (TFU);
R7.H = R1.L * R1.L, R7.L = R1.H * R1.H (TFU);
R0.H = R0.L * R0.L, R0.L = R0.L * R0.L (TFU);
R1.H = R0.L * R1.L, R1.L = R0.L * R1.H (TFU);
R2.H = R1.L * R0.L, R2.L = R1.H * R0.L (TFU);
R3.H = R1.L * R1.L, R3.L = R1.H * R1.H (TFU);
CHECKREG r0, 0x1CFC1CFC;
CHECKREG r1, 0x0930114A;
CHECKREG r2, 0x01F5010A;
CHECKREG r3, 0x012A0054;
CHECKREG r4, 0x1CFC1CFC;
CHECKREG r5, 0x1B4E3364;
CHECKREG r6, 0x1B4E3364;
CHECKREG r7, 0x19B95B1D;

imm32 r0, 0x9923a635;
imm32 r1, 0x6f995137;
imm32 r2, 0x1324b735;
imm32 r3, 0x99060037;
imm32 r4, 0x809bcd39;
imm32 r5, 0xb0a99f3b;
imm32 r6, 0xa00c093d;
imm32 r7, 0x12467093;
R4.H = R2.L * R2.H, R4.L = R2.H * R2.L (TFU);
R5.H = R2.L * R3.H, R5.L = R2.H * R3.H (TFU);
R6.H = R3.L * R2.L, R6.L = R3.L * R2.H (TFU);
R7.H = R3.L * R3.H, R7.L = R3.L * R3.H (TFU);
R2.H = R2.L * R2.H, R2.L = R2.H * R2.L (TFU);
R3.H = R2.L * R3.H, R3.L = R2.H * R3.H (TFU);
R0.H = R3.L * R2.H, R0.L = R3.L * R2.L (TFU);
R1.H = R3.L * R3.H, R1.L = R3.L * R3.H (TFU);
CHECKREG r0, 0x00700070;
CHECKREG r1, 0x00420042;
CHECKREG r2, 0x0DB20DB2;
CHECKREG r3, 0x082F082F;
CHECKREG r4, 0x0DB20DB2;
CHECKREG r5, 0x6D820B70;
CHECKREG r6, 0x00270004;
CHECKREG r7, 0x00200020;

imm32 r0, 0x19235655;
imm32 r1, 0xc9ba5157;
imm32 r2, 0x63246755;
imm32 r3, 0x0a060055;
imm32 r4, 0x90abc509;
imm32 r5, 0x10acef5b;
imm32 r6, 0xb00a005d;
imm32 r7, 0x1246a05f;
R0.H = R4.H * R4.L, R0.L = R4.L * R4.L (TFU);
R1.H = R4.H * R5.L, R1.L = R4.L * R5.H (TFU);
R2.H = R5.H * R4.L, R2.L = R5.H * R4.L (TFU);
R3.H = R5.L * R5.L, R3.L = R5.H * R5.H (TFU);
R4.H = R4.H * R4.L, R4.L = R4.L * R4.L (TFU);
R5.H = R4.H * R5.L, R5.L = R4.L * R5.L (TFU);
R6.H = R5.L * R4.L, R6.L = R5.H * R4.L (TFU);
R7.H = R5.H * R5.L, R7.L = R5.H * R5.H (TFU);
CHECKREG r0, 0x6F5897A6;
CHECKREG r1, 0x87430CD4;
CHECKREG r2, 0x0CD40CD4;
CHECKREG r3, 0xDFCB0115;
CHECKREG r4, 0x6F5897A6;
CHECKREG r5, 0x681A8DC9;
CHECKREG r6, 0x53FD3DAA;
CHECKREG r7, 0x39A82A55;

imm32 r0, 0xbb235666;
imm32 r1, 0xefba5166;
imm32 r2, 0x13248766;
imm32 r3, 0xe0060066;
imm32 r4, 0x9eab9d69;
imm32 r5, 0x10ecef6b;
imm32 r6, 0x800ee06d;
imm32 r7, 0x12467e6f;
// test the unsigned U=1
R0.H = R6.H * R6.H, R0.L = R6.L * R6.L (TFU);
R1.H = R6.H * R7.H, R1.L = R6.L * R7.H (TFU);
R2.H = R7.H * R6.H, R2.L = R7.H * R6.L (TFU);
R3.H = R7.H * R7.H, R3.L = R7.H * R7.H (TFU);
R6.H = R6.H * R6.H, R6.L = R6.L * R6.L (TFU);
R7.H = R6.H * R7.H, R7.L = R6.L * R7.H (TFU);
R4.H = R7.H * R6.H, R4.L = R7.H * R6.L (TFU);
R5.H = R7.H * R7.H, R5.L = R7.H * R7.H (TFU);
CHECKREG r0, 0x400EC4BE;
CHECKREG r1, 0x09231005;
CHECKREG r2, 0x09231005;
CHECKREG r3, 0x014D014D;
CHECKREG r4, 0x01240383;
CHECKREG r5, 0x00140014;
CHECKREG r6, 0x400EC4BE;
CHECKREG r7, 0x04920E0B;

// mix order
imm32 r0, 0xac23a675;
imm32 r1, 0xcfba5127;
imm32 r2, 0x13c46705;
imm32 r3, 0x00060007;
imm32 r4, 0x90accd09;
imm32 r5, 0x10acdfdb;
imm32 r6, 0x000cc00d;
imm32 r7, 0x1246fc0f;
R2.H = R0.L * R7.L, R2.L = R0.H * R7.H (TFU);
R5.H = R1.L * R6.L, R5.L = R1.L * R6.H (TFU);
R6.H = R2.H * R5.L, R6.L = R2.H * R5.L (TFU);
R7.H = R3.L * R4.L, R7.L = R3.L * R4.L (TFU);
R0.H = R4.L * R3.L, R0.L = R4.L * R3.L (TFU);
R1.H = R5.H * R2.L, R1.L = R5.H * R2.L (TFU);
R3.H = R6.L * R1.L, R3.L = R6.L * R1.L (TFU);
R4.H = R7.H * R0.L, R4.L = R7.H * R0.H (TFU);
CHECKREG r0, 0x00050005;
CHECKREG r1, 0x02EB02EB;
CHECKREG r2, 0xA3E40C49;
CHECKREG r3, 0x00000000;
CHECKREG r4, 0x00000000;
CHECKREG r5, 0x3CE10003;
CHECKREG r6, 0x00010001;
CHECKREG r7, 0x00050005;

imm32 r0, 0xab235a75;
imm32 r1, 0xcfba5127;
imm32 r2, 0xdd246905;
imm32 r3, 0x00d6d007;
imm32 r4, 0x90abcd09;
imm32 r5, 0x10aceddb;
imm32 r6, 0x000c0d0d;
imm32 r7, 0x1246700f;
R0.H = R7.H * R0.H, R0.L = R7.H * R0.L (TFU);
R1.H = R6.H * R1.H, R1.L = R6.L * R1.L (TFU);
R2.H = R5.H * R2.H, R2.L = R5.H * R2.L (TFU);
R3.H = R4.H * R3.H, R3.L = R4.H * R3.L (TFU);
R4.H = R3.H * R4.H, R4.L = R3.H * R4.L (TFU);
R5.H = R2.H * R5.H, R5.L = R2.H * R5.L (TFU);
R6.H = R1.H * R6.H, R6.L = R1.H * R6.L (TFU);
R7.H = R0.L * R7.H, R7.L = R0.H * R7.H (TFU);
CHECKREG r0, 0x0C370674;
CHECKREG r1, 0x00090423;
CHECKREG r2, 0x0E6606D6;
CHECKREG r3, 0x0078758E;
CHECKREG r4, 0x00430060;
CHECKREG r5, 0x00F00D60;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x007500DF;

imm32 r0, 0xfb235675;
imm32 r1, 0xcfba5127;
imm32 r2, 0x13f46705;
imm32 r3, 0x000f0007;
imm32 r4, 0x90abfd09;
imm32 r5, 0x10acefdb;
imm32 r6, 0x000c00fd;
imm32 r7, 0x1246700f;
R2.H = R0.L * R6.L, R2.L = R0.L * R6.H (TFU);
R3.H = R2.H * R7.H, R3.L = R2.H * R7.L (TFU);
R0.H = R1.L * R0.L, R0.L = R1.H * R0.H (TFU);
R1.H = R3.L * R0.L, R1.L = R3.H * R0.H (TFU);
R4.H = R4.L * R2.L, R4.L = R4.H * R2.H (TFU);
R5.H = R5.L * R3.H, R5.L = R5.H * R3.L (TFU);
R6.H = R6.H * R4.L, R6.L = R6.L * R4.H (TFU);
R7.H = R7.L * R6.L, R7.L = R7.H * R6.H (TFU);
CHECKREG r0, 0x1B68CBC7;
CHECKREG r1, 0x001D0000;
CHECKREG r2, 0x00550004;
CHECKREG r3, 0x00060025;
CHECKREG r4, 0x00030030;
CHECKREG r5, 0x00050002;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x00000000;

imm32 r0, 0xab2d5675;
imm32 r1, 0xcfbad127;
imm32 r2, 0x13246d05;
imm32 r3, 0x000600d7;
imm32 r4, 0x908bcd09;
imm32 r5, 0x10a9efdb;
imm32 r6, 0x000c500d;
imm32 r7, 0x1246760f;
R4.H = R5.L * R2.L, R4.L = R5.L * R2.H (TFU);
R6.H = R6.H * R3.L, R6.L = R6.H * R3.L (TFU);
R0.H = R7.L * R4.L, R0.L = R7.L * R4.H (TFU);
R1.H = R0.L * R5.H, R1.L = R0.L * R5.L (TFU);
R2.H = R1.L * R6.L, R2.L = R1.H * R6.H (TFU);
R5.H = R2.L * R7.H, R5.L = R2.H * R7.L (TFU);
R3.H = R3.L * R0.L, R3.L = R3.L * R0.L (TFU);
R7.H = R4.H * R1.L, R7.L = R4.H * R1.L (TFU);
CHECKREG r0, 0x08442F1A;
CHECKREG r1, 0x03102C21;
CHECKREG r2, 0x00000000;
CHECKREG r3, 0x00270027;
CHECKREG r4, 0x662411EE;
CHECKREG r5, 0x00000000;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x119B119B;



pass