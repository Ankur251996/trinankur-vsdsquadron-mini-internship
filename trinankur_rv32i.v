@@ -3,15 +3,15 @@ input clk;
input RN;
//input EN;
integer k;
reg  EX_MEM_COND ;
wire  EX_MEM_COND ;

reg 
BR_EN;

//I_FETCH STAGE
reg[31:0] 
IF_ID_IR,
IF_ID,IF_ID_NPC;                                
IF_ID_NPC;                                

//I_DECODE STAGE
reg[31:0] 
@@ -32,21 +32,30 @@ SUB=3'd1,
AND=3'd2,
OR=3'd3,
XOR=3'd4,
SLT=3'd5,

ADDI=3'd0,
SUBI=3'd1,
ANDI=3'd2,
ORI=3'd3,
XORI=3'd4,

LW=3'd0,
SW=3'd1,

BEQ=3'd0,
BNE=3'd1,

SLL=3'd0,
SRL=3'd1,
SLT=3'd5;
SRL=3'd1;


parameter 
RR_TYPE=7'd0,
RM_TYPE=7'd1,
AR_TYPE=7'd0,
M_TYPE=7'd1,
BR_TYPE=7'd2,
SH_TYPE=7'd3,
M_TYPE=7'd4;
SH_TYPE=7'd3;


//MEMORY STAGE
reg[31:0] 
@@ -65,7 +74,7 @@ reg [31:0]MEM[0:31];
reg [31:0]DM[0:31];   


//assign EX_MEM_COND = (ID_EX_IR[6:0]==BR_TYPE) ? 1'b1 : 1'b0;
//assign EX_MEM_COND = (EX_MEM_IR[6:0]==BR_TYPE) ? 1'b1 : 1'b0;
                     //1'b1 ? (ID_EX_A!=ID_EX_RD) : 1'b0;

always @(posedge clk or posedge RN) begin
@@ -84,46 +93,97 @@ always @(posedge clk or posedge RN) begin
    //else if(EX_MEM_COND)
    //NPC <= EX_MEM_ALUOUT;

    else if (BR_EN)begin
    NPC = EX_MEM_COND ? EX_MEM_ALUOUT : NPC +32'd1;
    //else if (EX_MEM_COND)begin
    //NPC = EX_MEM_COND ? EX_MEM_ALUOUT : NPC +32'd1;
    //NPC <= EX_MEM_ALUOUT;
    //EX_MEM_COND = BR_EN;
    //NPC = BR_EN ? EX_MEM_ALUOUT : NPC +32'd1;
    BR_EN = 1'd0;
    //BR_EN = 1'd0;
    //EX_MEM_COND <= 1'd0;
    end
    //end
    else begin
        NPC <= NPC +32'd1;
    NPC <= BR_EN ? EX_MEM_ALUOUT : NPC +32'd1;
    BR_EN <= 1'd0;
    //NPC <= NPC +32'd1;
    //EX_MEM_COND <=1'd0;
    IF_ID <=MEM[NPC];
    IF_ID_IR <=MEM[NPC];
    IF_ID_NPC <=NPC+32'd1;
    end
end

always @(posedge RN) begin

MEM[0] <= 32'h00208300;         // add r6,r1,r2.(i1)
MEM[1] <= 32'h00209380;         //sub r7,r1,r2.(i2)
MEM[2] <= 32'h0030a400;         //and r8,r1,r3.(i3)
MEM[3] <= 32'h00513480;         //or r9,r2,r5.(i4)
MEM[4] <= 32'h0040c500;         //xor r10,r1,r4.(i5)
MEM[5] <= 32'h00415580;         //slt r11,r2,r4.(i6)
MEM[6] <= 32'h00520601;         //addi r12,r4,5.(i7)
MEM[7] <= 32'h00209184;         //sw r3,r1,2.(i8)
MEM[8] <= 32'h00208684;         //lw r13,r1,2.(i9)
    //NPC<= 32'd0;
MEM[0] <= 32'h02208300;         // add r6,r1,r2.(i1)
MEM[1] <= 32'h02209380;         //sub r7,r1,r2.(i2)
MEM[2] <= 32'h0230a400;         //and r8,r1,r3.(i3)
MEM[3] <= 32'h02513480;         //or r9,r2,r5.(i4)
MEM[4] <= 32'h0240c500;         //xor r10,r1,r4.(i5)
MEM[5] <= 32'h02415580;         //slt r11,r2,r4.(i6)
MEM[6] <= 32'h00520600;         //addi r12,r4,5.(i7)
MEM[7] <= 32'h00209181;         //sw r3,r1,2.(i8)
MEM[8] <= 32'h00208681;         //lw r13,r1,2.(i9)
MEM[9] <= 32'h00f00002;         //beq r0,r0,15.(i10)
MEM[26] <= 32'h00210700;         //add r14,r2,r2.
MEM[27] <= 32'h00208783;         //sll r15,r1,r2(2).(i14)
MEM[28] <= 32'h00271803;         //srl r16,r14,r2(2).(i15) 
MEM[25] <= 32'h00210700;         //add r14,r2,r2.(i11)
//MEM[27] <= 32'h01409002;         //bne r0,r1,20.(i12)
//MEM[49] <= 32'h00520601;         //addi r12,r4,5.(i13)
//MEM[50] <= 32'h00208783;         //sll r15,r1,r2(2).(i14)
//MEM[51] <= 32'h00271803;         //srl r16,r14,r2(2).(i15) */

//for(k=0;k<=31;k++)
//REG[k]<=k;
/*REG[0] <= 32'h00000000;
REG[1] <= 32'd1;
REG[2] <= 32'd2;
REG[3] <= 32'd3;
REG[4] <= 32'd4;
REG[5] <= 32'd5;
REG[6] <= 32'd6;
REG[7] = 32'd7;
REG[6] = 32'd6;
REG[7] = 32'd7;
REG[8] = 32'd8;
REG[9] = 32'd9;
REG[10] = 32'd10;
REG[11] = 32'd11;
REG[12] = 32'd12;
REG[13] = 32'd13;
REG[14] = 32'd14;
REG[15] = 32'd15;
REG[16] = 32'd16;
REG[17] = 32'd17;*/
/*end
else begin
    if(EX_MEM_COND==1 && EX_MEM_IR[6:0]==BR_TYPE) begin
    NPC=EX_MEM_ALUOUT;
    IF_ID=MEM[NPC];
    end
    else begin
    NPC<=NPC+32'd1;
    IF_ID<=MEM[NPC];
    IF_ID_NPC<=NPC+32'd1;
    end
end*/
end
//I_FECT STAGE

/*always @(posedge clk) begin
always @(posedge clk) begin
//NPC <= rst ? 32'd0 : NPC+32'd1;
IF_ID_IR <= IF_ID;
if(EX_MEM_COND==1 && EX_MEM_IR[6:0]==BR_TYPE) begin
NPC=EX_MEM_ALUOUT;
IF_ID=MEM[NPC];
end
else begin
NPC<=NPC+32'd1;
IF_ID<=MEM[NPC];
IF_ID_NPC<=NPC+32'd1;
end
end*/


//FETCH STAGE END

//I_DECODE STAGE 
@@ -138,47 +198,66 @@ ID_EX_NPC<=IF_ID_NPC;
end
//DECODE STAGE END

/*always@(posedge clk) begin
if(ID_EX_IR[6:0]== BR_TYPE)
EX_MEM_COND <= EN;
else
EX_MEM_COND <= !EN;
end*/


//EXECUTION STAGE

always@(posedge clk) begin

EX_MEM_IR <=  ID_EX_IR;
EX_MEM_COND <= (ID_EX_IR[6:0] == BR_TYPE) ? 1'd1 :1'd0;
//EX_MEM_COND <= (ID_EX_IR[6:0] == BR_TYPE) ? 1'd1 :1'd0;


case(ID_EX_IR[6:0])

RR_TYPE:begin
case(ID_EX_IR[14:12])
AR_TYPE:begin
    if(ID_EX_IR[31:25]== 7'd1)begin
    case(ID_EX_IR[14:12])

ADD:EX_MEM_ALUOUT <= ID_EX_A + ID_EX_B;
SUB:EX_MEM_ALUOUT <= ID_EX_A - ID_EX_B;
AND:EX_MEM_ALUOUT <= ID_EX_A & ID_EX_B;
OR :EX_MEM_ALUOUT <= ID_EX_A | ID_EX_B;
XOR:EX_MEM_ALUOUT <= ID_EX_A ^ ID_EX_B;
SLT:EX_MEM_ALUOUT <= (ID_EX_A < ID_EX_B) ? 32'd1 : 32'd0;
    ADD:EX_MEM_ALUOUT <= ID_EX_A + ID_EX_B;
    SUB:EX_MEM_ALUOUT <= ID_EX_A - ID_EX_B;
    AND:EX_MEM_ALUOUT <= ID_EX_A & ID_EX_B;
    OR :EX_MEM_ALUOUT <= ID_EX_A | ID_EX_B;
    XOR:EX_MEM_ALUOUT <= ID_EX_A ^ ID_EX_B;
    SLT:EX_MEM_ALUOUT <= (ID_EX_A < ID_EX_B) ? 32'd1 : 32'd0;

    endcase
    end
    else begin
        case(ID_EX_IR[14:12])
        ADDI:EX_MEM_ALUOUT <= ID_EX_A + ID_EX_IMMEDIATE;
        SUBI:EX_MEM_ALUOUT <= ID_EX_A - ID_EX_IMMEDIATE;
        ANDI:EX_MEM_ALUOUT <= ID_EX_A & ID_EX_B;
        ORI:EX_MEM_ALUOUT  <= ID_EX_A | ID_EX_B;
        XORI:EX_MEM_ALUOUT <= ID_EX_A ^ ID_EX_B;
        endcase
    end

endcase
end

RM_TYPE:begin
case(ID_EX_IR[14:12])
ADDI:EX_MEM_ALUOUT <= ID_EX_A + ID_EX_IMMEDIATE;
endcase
M_TYPE:begin
    case(ID_EX_IR[14:12])
    LW  :EX_MEM_ALUOUT <= ID_EX_A + ID_EX_IMMEDIATE;
    SW  :EX_MEM_ALUOUT <= ID_EX_IR[24:20] + ID_EX_IR[19:15];
    endcase
end

BR_TYPE:begin
case(ID_EX_IR[14:12])
BEQ:begin 
EX_MEM_ALUOUT <= ID_EX_NPC+ID_EX_IMMEDIATE;
BR_EN <= 1'd1 ? (ID_EX_IR[19:15] == ID_EX_IR[11:7]) : 1'd0;
//BR_PC = EX_MEM_COND ? EX_MEM_ALUOUT : 1'd0; 
    case(ID_EX_IR[14:12])
    BEQ:begin 
    EX_MEM_ALUOUT <= ID_EX_NPC+ID_EX_IMMEDIATE;
    BR_EN <= 1'd1 ? (ID_EX_IR[19:15] == ID_EX_IR[11:7]) : 1'd0;
    //BR_PC = EX_MEM_COND ? EX_MEM_ALUOUT : 1'd0; 
end
BNE:begin 
EX_MEM_ALUOUT <= ID_EX_NPC+ID_EX_IMMEDIATE;
BR_EN <= (ID_EX_IR[19:15] != ID_EX_IR[11:7]) ? 1'd1 : 1'd0;
    EX_MEM_ALUOUT <= ID_EX_NPC+ID_EX_IMMEDIATE;
    BR_EN <= (ID_EX_IR[19:15] != ID_EX_IR[11:7]) ? 1'd1 : 1'd0;
end
endcase
end
@@ -190,13 +269,6 @@ SRL:EX_MEM_ALUOUT <= ID_EX_A >> ID_EX_B;
endcase
end

M_TYPE:begin
case(ID_EX_IR[14:12])
LW  :EX_MEM_ALUOUT <= ID_EX_A + ID_EX_IMMEDIATE;
SW  :EX_MEM_ALUOUT <= ID_EX_IR[24:20] +ID_EX_IR[19:15];
endcase
end

endcase
end

@@ -210,13 +282,12 @@ MEM_WB_IR <= EX_MEM_IR;

case(EX_MEM_IR[6:0])

RR_TYPE:MEM_WB_ALUOUT <=  EX_MEM_ALUOUT;
RM_TYPE:MEM_WB_ALUOUT <=  EX_MEM_ALUOUT;
AR_TYPE:MEM_WB_ALUOUT <=  EX_MEM_ALUOUT;
SH_TYPE:MEM_WB_ALUOUT <=  EX_MEM_ALUOUT;

M_TYPE:begin
case(EX_MEM_IR[14:12])
LW:MEM_WB_LDM = DM[EX_MEM_ALUOUT];
LW:MEM_WB_LDM <= DM[EX_MEM_ALUOUT];
SW:DM[EX_MEM_ALUOUT]<=REG[EX_MEM_IR[11:7]];
endcase
end
@@ -232,30 +303,21 @@ always@(posedge clk) begin

case(MEM_WB_IR[6:0])

RR_TYPE:begin 
WB_OUT=MEM_WB_ALUOUT;
REG[MEM_WB_IR[11:7]]=WB_OUT;
end

RM_TYPE:begin
case(MEM_WB_IR[14:12])
ADDI:begin
WB_OUT=MEM_WB_ALUOUT;
REG[MEM_WB_IR[11:7]]=WB_OUT;
end
endcase
AR_TYPE:begin 
WB_OUT<=MEM_WB_ALUOUT;
REG[MEM_WB_IR[11:7]]<=MEM_WB_ALUOUT;
end

SH_TYPE:begin
WB_OUT=MEM_WB_ALUOUT;
REG[MEM_WB_IR[11:7]]=WB_OUT;
WB_OUT<=MEM_WB_ALUOUT;
REG[MEM_WB_IR[11:7]]<=MEM_WB_ALUOUT;
end

M_TYPE:begin
case(MEM_WB_IR[14:12])
LW:begin
WB_OUT=MEM_WB_LDM;
REG[MEM_WB_IR[11:7]]=WB_OUT;
WB_OUT<=MEM_WB_LDM;
REG[MEM_WB_IR[11:7]]<=MEM_WB_LDM;
end
endcase
end
