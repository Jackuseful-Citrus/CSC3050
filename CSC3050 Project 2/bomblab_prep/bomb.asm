
bomb:     file format elf64-littleriscv


Disassembly of section .plt:

00000000000008b0 <.plt>:
 8b0:	00002397          	auipc	t2,0x2
 8b4:	41c30333          	sub	t1,t1,t3
 8b8:	7583be03          	ld	t3,1880(t2) # 3008 <__TMC_END__>
 8bc:	fd430313          	addi	t1,t1,-44
 8c0:	75838293          	addi	t0,t2,1880
 8c4:	00135313          	srli	t1,t1,0x1
 8c8:	0082b283          	ld	t0,8(t0)
 8cc:	000e0067          	jr	t3

00000000000008d0 <__libc_start_main@plt>:
 8d0:	00002e17          	auipc	t3,0x2
 8d4:	748e3e03          	ld	t3,1864(t3) # 3018 <__libc_start_main@GLIBC_2.27>
 8d8:	000e0367          	jalr	t1,t3
 8dc:	00000013          	nop

00000000000008e0 <__printf_chk@plt>:
 8e0:	00002e17          	auipc	t3,0x2
 8e4:	740e3e03          	ld	t3,1856(t3) # 3020 <__printf_chk@GLIBC_2.27>
 8e8:	000e0367          	jalr	t1,t3
 8ec:	00000013          	nop

00000000000008f0 <__isoc99_sscanf@plt>:
 8f0:	00002e17          	auipc	t3,0x2
 8f4:	738e3e03          	ld	t3,1848(t3) # 3028 <__isoc99_sscanf@GLIBC_2.27>
 8f8:	000e0367          	jalr	t1,t3
 8fc:	00000013          	nop

0000000000000900 <__stack_chk_fail@plt>:
 900:	00002e17          	auipc	t3,0x2
 904:	730e3e03          	ld	t3,1840(t3) # 3030 <__stack_chk_fail@GLIBC_2.27>
 908:	000e0367          	jalr	t1,t3
 90c:	00000013          	nop

0000000000000910 <memcpy@plt>:
 910:	00002e17          	auipc	t3,0x2
 914:	728e3e03          	ld	t3,1832(t3) # 3038 <memcpy@GLIBC_2.27>
 918:	000e0367          	jalr	t1,t3
 91c:	00000013          	nop

0000000000000920 <strlen@plt>:
 920:	00002e17          	auipc	t3,0x2
 924:	720e3e03          	ld	t3,1824(t3) # 3040 <strlen@GLIBC_2.27>
 928:	000e0367          	jalr	t1,t3
 92c:	00000013          	nop

0000000000000930 <fgets@plt>:
 930:	00002e17          	auipc	t3,0x2
 934:	718e3e03          	ld	t3,1816(t3) # 3048 <fgets@GLIBC_2.27>
 938:	000e0367          	jalr	t1,t3
 93c:	00000013          	nop

0000000000000940 <puts@plt>:
 940:	00002e17          	auipc	t3,0x2
 944:	710e3e03          	ld	t3,1808(t3) # 3050 <puts@GLIBC_2.27>
 948:	000e0367          	jalr	t1,t3
 94c:	00000013          	nop

0000000000000950 <exit@plt>:
 950:	00002e17          	auipc	t3,0x2
 954:	708e3e03          	ld	t3,1800(t3) # 3058 <exit@GLIBC_2.27>
 958:	000e0367          	jalr	t1,t3
 95c:	00000013          	nop

0000000000000960 <fopen@plt>:
 960:	00002e17          	auipc	t3,0x2
 964:	700e3e03          	ld	t3,1792(t3) # 3060 <fopen@GLIBC_2.27>
 968:	000e0367          	jalr	t1,t3
 96c:	00000013          	nop

0000000000000970 <strcmp@plt>:
 970:	00002e17          	auipc	t3,0x2
 974:	6f8e3e03          	ld	t3,1784(t3) # 3068 <strcmp@GLIBC_2.27>
 978:	000e0367          	jalr	t1,t3
 97c:	00000013          	nop

0000000000000980 <__ctype_b_loc@plt>:
 980:	00002e17          	auipc	t3,0x2
 984:	6f0e3e03          	ld	t3,1776(t3) # 3070 <__ctype_b_loc@GLIBC_2.27>
 988:	000e0367          	jalr	t1,t3
 98c:	00000013          	nop

Disassembly of section .text:

0000000000000990 <_start>:
 990:	02e000ef          	jal	ra,9be <load_gp>
 994:	87aa                	mv	a5,a0
 996:	00002517          	auipc	a0,0x2
 99a:	71253503          	ld	a0,1810(a0) # 30a8 <_GLOBAL_OFFSET_TABLE_+0x30>
 99e:	6582                	ld	a1,0(sp)
 9a0:	0030                	addi	a2,sp,8
 9a2:	ff017113          	andi	sp,sp,-16
 9a6:	00000697          	auipc	a3,0x0
 9aa:	50468693          	addi	a3,a3,1284 # eaa <__libc_csu_init>
 9ae:	00000717          	auipc	a4,0x0
 9b2:	55470713          	addi	a4,a4,1364 # f02 <__libc_csu_fini>
 9b6:	880a                	mv	a6,sp
 9b8:	f19ff0ef          	jal	ra,8d0 <__libc_start_main@plt>
 9bc:	9002                	ebreak

00000000000009be <load_gp>:
 9be:	00003197          	auipc	gp,0x3
 9c2:	e4218193          	addi	gp,gp,-446 # 3800 <__global_pointer$>
 9c6:	8082                	ret
	...

00000000000009ca <deregister_tm_clones>:
 9ca:	00002517          	auipc	a0,0x2
 9ce:	63e50513          	addi	a0,a0,1598 # 3008 <__TMC_END__>
 9d2:	00002797          	auipc	a5,0x2
 9d6:	63678793          	addi	a5,a5,1590 # 3008 <__TMC_END__>
 9da:	00a78963          	beq	a5,a0,9ec <deregister_tm_clones+0x22>
 9de:	00002317          	auipc	t1,0x2
 9e2:	6aa33303          	ld	t1,1706(t1) # 3088 <_ITM_deregisterTMCloneTable>
 9e6:	00030363          	beqz	t1,9ec <deregister_tm_clones+0x22>
 9ea:	8302                	jr	t1
 9ec:	8082                	ret

00000000000009ee <register_tm_clones>:
 9ee:	00002517          	auipc	a0,0x2
 9f2:	61a50513          	addi	a0,a0,1562 # 3008 <__TMC_END__>
 9f6:	00002797          	auipc	a5,0x2
 9fa:	61278793          	addi	a5,a5,1554 # 3008 <__TMC_END__>
 9fe:	8f89                	sub	a5,a5,a0
 a00:	4037d713          	srai	a4,a5,0x3
 a04:	03f7d593          	srli	a1,a5,0x3f
 a08:	95ba                	add	a1,a1,a4
 a0a:	8585                	srai	a1,a1,0x1
 a0c:	c981                	beqz	a1,a1c <register_tm_clones+0x2e>
 a0e:	00002317          	auipc	t1,0x2
 a12:	6aa33303          	ld	t1,1706(t1) # 30b8 <_ITM_registerTMCloneTable>
 a16:	00030363          	beqz	t1,a1c <register_tm_clones+0x2e>
 a1a:	8302                	jr	t1
 a1c:	8082                	ret

0000000000000a1e <__do_global_dtors_aux>:
 a1e:	1141                	addi	sp,sp,-16
 a20:	e022                	sd	s0,0(sp)
 a22:	00002417          	auipc	s0,0x2
 a26:	6a640413          	addi	s0,s0,1702 # 30c8 <completed.6761>
 a2a:	00044783          	lbu	a5,0(s0)
 a2e:	e406                	sd	ra,8(sp)
 a30:	e385                	bnez	a5,a50 <__do_global_dtors_aux+0x32>
 a32:	00002797          	auipc	a5,0x2
 a36:	67e7b783          	ld	a5,1662(a5) # 30b0 <__cxa_finalize@GLIBC_2.27>
 a3a:	c791                	beqz	a5,a46 <__do_global_dtors_aux+0x28>
 a3c:	00002517          	auipc	a0,0x2
 a40:	5c453503          	ld	a0,1476(a0) # 3000 <__dso_handle>
 a44:	9782                	jalr	a5
 a46:	f85ff0ef          	jal	ra,9ca <deregister_tm_clones>
 a4a:	4785                	li	a5,1
 a4c:	00f40023          	sb	a5,0(s0)
 a50:	60a2                	ld	ra,8(sp)
 a52:	6402                	ld	s0,0(sp)
 a54:	0141                	addi	sp,sp,16
 a56:	8082                	ret

0000000000000a58 <frame_dummy>:
 a58:	bf59                	j	9ee <register_tm_clones>

0000000000000a5a <main>:
 a5a:	1141                	addi	sp,sp,-16
 a5c:	e406                	sd	ra,8(sp)
 a5e:	e022                	sd	s0,0(sp)
 a60:	4785                	li	a5,1
 a62:	0af50a63          	beq	a0,a5,b16 <main+0xbc>
 a66:	842e                	mv	s0,a1
 a68:	4789                	li	a5,2
 a6a:	0cf51d63          	bne	a0,a5,b44 <main+0xea>
 a6e:	00000597          	auipc	a1,0x0
 a72:	49a58593          	addi	a1,a1,1178 # f08 <__libc_csu_fini+0x6>
 a76:	6408                	ld	a0,8(s0)
 a78:	ee9ff0ef          	jal	ra,960 <fopen@plt>
 a7c:	00002797          	auipc	a5,0x2
 a80:	6247b783          	ld	a5,1572(a5) # 30a0 <_GLOBAL_OFFSET_TABLE_+0x28>
 a84:	e388                	sd	a0,0(a5)
 a86:	c15d                	beqz	a0,b2c <main+0xd2>
 a88:	00000517          	auipc	a0,0x0
 a8c:	4c850513          	addi	a0,a0,1224 # f50 <__libc_csu_fini+0x4e>
 a90:	eb1ff0ef          	jal	ra,940 <puts@plt>
 a94:	00000517          	auipc	a0,0x0
 a98:	50c50513          	addi	a0,a0,1292 # fa0 <__libc_csu_fini+0x9e>
 a9c:	ea5ff0ef          	jal	ra,940 <puts@plt>
 aa0:	00000517          	auipc	a0,0x0
 aa4:	55050513          	addi	a0,a0,1360 # ff0 <__libc_csu_fini+0xee>
 aa8:	e99ff0ef          	jal	ra,940 <puts@plt>
 aac:	00000517          	auipc	a0,0x0
 ab0:	59450513          	addi	a0,a0,1428 # 1040 <__libc_csu_fini+0x13e>
 ab4:	e8dff0ef          	jal	ra,940 <puts@plt>
 ab8:	1e0000ef          	jal	ra,c98 <read_line>
 abc:	328000ef          	jal	ra,de4 <phase_1>
 ac0:	2fe000ef          	jal	ra,dbe <phase_defused>
 ac4:	00000517          	auipc	a0,0x0
 ac8:	5c450513          	addi	a0,a0,1476 # 1088 <__libc_csu_fini+0x186>
 acc:	e75ff0ef          	jal	ra,940 <puts@plt>
 ad0:	1c8000ef          	jal	ra,c98 <read_line>
 ad4:	32e000ef          	jal	ra,e02 <phase_2>
 ad8:	2e6000ef          	jal	ra,dbe <phase_defused>
 adc:	00000517          	auipc	a0,0x0
 ae0:	5dc50513          	addi	a0,a0,1500 # 10b8 <__libc_csu_fini+0x1b6>
 ae4:	e5dff0ef          	jal	ra,940 <puts@plt>
 ae8:	00000517          	auipc	a0,0x0
 aec:	60050513          	addi	a0,a0,1536 # 10e8 <__libc_csu_fini+0x1e6>
 af0:	e51ff0ef          	jal	ra,940 <puts@plt>
 af4:	00000517          	auipc	a0,0x0
 af8:	63450513          	addi	a0,a0,1588 # 1128 <__libc_csu_fini+0x226>
 afc:	e45ff0ef          	jal	ra,940 <puts@plt>
 b00:	00000517          	auipc	a0,0x0
 b04:	66850513          	addi	a0,a0,1640 # 1168 <__libc_csu_fini+0x266>
 b08:	e39ff0ef          	jal	ra,940 <puts@plt>
 b0c:	4501                	li	a0,0
 b0e:	60a2                	ld	ra,8(sp)
 b10:	6402                	ld	s0,0(sp)
 b12:	0141                	addi	sp,sp,16
 b14:	8082                	ret
 b16:	00002797          	auipc	a5,0x2
 b1a:	56a7b783          	ld	a5,1386(a5) # 3080 <stdin@GLIBC_2.27>
 b1e:	6398                	ld	a4,0(a5)
 b20:	00002797          	auipc	a5,0x2
 b24:	5807b783          	ld	a5,1408(a5) # 30a0 <_GLOBAL_OFFSET_TABLE_+0x28>
 b28:	e398                	sd	a4,0(a5)
 b2a:	bfb9                	j	a88 <main+0x2e>
 b2c:	6414                	ld	a3,8(s0)
 b2e:	6010                	ld	a2,0(s0)
 b30:	00000597          	auipc	a1,0x0
 b34:	3e058593          	addi	a1,a1,992 # f10 <__libc_csu_fini+0xe>
 b38:	4505                	li	a0,1
 b3a:	da7ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 b3e:	4521                	li	a0,8
 b40:	e11ff0ef          	jal	ra,950 <exit@plt>
 b44:	6190                	ld	a2,0(a1)
 b46:	00000597          	auipc	a1,0x0
 b4a:	3ea58593          	addi	a1,a1,1002 # f30 <__libc_csu_fini+0x2e>
 b4e:	4505                	li	a0,1
 b50:	d91ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 b54:	4521                	li	a0,8
 b56:	dfbff0ef          	jal	ra,950 <exit@plt>

0000000000000b5a <blank_line>:
 b5a:	1101                	addi	sp,sp,-32
 b5c:	ec06                	sd	ra,24(sp)
 b5e:	e822                	sd	s0,16(sp)
 b60:	e426                	sd	s1,8(sp)
 b62:	e04a                	sd	s2,0(sp)
 b64:	84aa                	mv	s1,a0
 b66:	6909                	lui	s2,0x2
 b68:	0004c403          	lbu	s0,0(s1)
 b6c:	cc11                	beqz	s0,b88 <blank_line+0x2e>
 b6e:	e13ff0ef          	jal	ra,980 <__ctype_b_loc@plt>
 b72:	0485                	addi	s1,s1,1
 b74:	611c                	ld	a5,0(a0)
 b76:	0406                	slli	s0,s0,0x1
 b78:	943e                	add	s0,s0,a5
 b7a:	00045783          	lhu	a5,0(s0)
 b7e:	0127f7b3          	and	a5,a5,s2
 b82:	f3fd                	bnez	a5,b68 <blank_line+0xe>
 b84:	4501                	li	a0,0
 b86:	a011                	j	b8a <blank_line+0x30>
 b88:	4505                	li	a0,1
 b8a:	60e2                	ld	ra,24(sp)
 b8c:	6442                	ld	s0,16(sp)
 b8e:	64a2                	ld	s1,8(sp)
 b90:	6902                	ld	s2,0(sp)
 b92:	6105                	addi	sp,sp,32
 b94:	8082                	ret

0000000000000b96 <skip>:
 b96:	7179                	addi	sp,sp,-48
 b98:	f406                	sd	ra,40(sp)
 b9a:	f022                	sd	s0,32(sp)
 b9c:	ec26                	sd	s1,24(sp)
 b9e:	e84a                	sd	s2,16(sp)
 ba0:	e44e                	sd	s3,8(sp)
 ba2:	00002997          	auipc	s3,0x2
 ba6:	4fe9b983          	ld	s3,1278(s3) # 30a0 <_GLOBAL_OFFSET_TABLE_+0x28>
 baa:	00002917          	auipc	s2,0x2
 bae:	52290913          	addi	s2,s2,1314 # 30cc <num_input_strings>
 bb2:	00002497          	auipc	s1,0x2
 bb6:	4de4b483          	ld	s1,1246(s1) # 3090 <_GLOBAL_OFFSET_TABLE_+0x18>
 bba:	00092783          	lw	a5,0(s2)
 bbe:	00279513          	slli	a0,a5,0x2
 bc2:	953e                	add	a0,a0,a5
 bc4:	0512                	slli	a0,a0,0x4
 bc6:	0009b603          	ld	a2,0(s3)
 bca:	05000593          	li	a1,80
 bce:	9526                	add	a0,a0,s1
 bd0:	d61ff0ef          	jal	ra,930 <fgets@plt>
 bd4:	842a                	mv	s0,a0
 bd6:	c501                	beqz	a0,bde <skip+0x48>
 bd8:	f83ff0ef          	jal	ra,b5a <blank_line>
 bdc:	fd79                	bnez	a0,bba <skip+0x24>
 bde:	8522                	mv	a0,s0
 be0:	70a2                	ld	ra,40(sp)
 be2:	7402                	ld	s0,32(sp)
 be4:	64e2                	ld	s1,24(sp)
 be6:	6942                	ld	s2,16(sp)
 be8:	69a2                	ld	s3,8(sp)
 bea:	6145                	addi	sp,sp,48
 bec:	8082                	ret

0000000000000bee <explode_bomb>:
 bee:	1141                	addi	sp,sp,-16
 bf0:	e406                	sd	ra,8(sp)
 bf2:	00000597          	auipc	a1,0x0
 bf6:	5be58593          	addi	a1,a1,1470 # 11b0 <__libc_csu_fini+0x2ae>
 bfa:	4505                	li	a0,1
 bfc:	ce5ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c00:	00000597          	auipc	a1,0x0
 c04:	5e858593          	addi	a1,a1,1512 # 11e8 <__libc_csu_fini+0x2e6>
 c08:	4505                	li	a0,1
 c0a:	cd7ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c0e:	00000597          	auipc	a1,0x0
 c12:	61258593          	addi	a1,a1,1554 # 1220 <__libc_csu_fini+0x31e>
 c16:	4505                	li	a0,1
 c18:	cc9ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c1c:	00000597          	auipc	a1,0x0
 c20:	63c58593          	addi	a1,a1,1596 # 1258 <__libc_csu_fini+0x356>
 c24:	4505                	li	a0,1
 c26:	cbbff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c2a:	00000597          	auipc	a1,0x0
 c2e:	66658593          	addi	a1,a1,1638 # 1290 <__libc_csu_fini+0x38e>
 c32:	4505                	li	a0,1
 c34:	cadff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c38:	00000597          	auipc	a1,0x0
 c3c:	69058593          	addi	a1,a1,1680 # 12c8 <__libc_csu_fini+0x3c6>
 c40:	4505                	li	a0,1
 c42:	c9fff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c46:	00000597          	auipc	a1,0x0
 c4a:	68258593          	addi	a1,a1,1666 # 12c8 <__libc_csu_fini+0x3c6>
 c4e:	4505                	li	a0,1
 c50:	c91ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c54:	00000597          	auipc	a1,0x0
 c58:	6ac58593          	addi	a1,a1,1708 # 1300 <__libc_csu_fini+0x3fe>
 c5c:	4505                	li	a0,1
 c5e:	c83ff0ef          	jal	ra,8e0 <__printf_chk@plt>
 c62:	00000517          	auipc	a0,0x0
 c66:	58650513          	addi	a0,a0,1414 # 11e8 <__libc_csu_fini+0x2e6>
 c6a:	cd7ff0ef          	jal	ra,940 <puts@plt>
 c6e:	00000517          	auipc	a0,0x0
 c72:	6ca50513          	addi	a0,a0,1738 # 1338 <__libc_csu_fini+0x436>
 c76:	ccbff0ef          	jal	ra,940 <puts@plt>
 c7a:	00000517          	auipc	a0,0x0
 c7e:	6d650513          	addi	a0,a0,1750 # 1350 <__libc_csu_fini+0x44e>
 c82:	cbfff0ef          	jal	ra,940 <puts@plt>
 c86:	00000517          	auipc	a0,0x0
 c8a:	6fa50513          	addi	a0,a0,1786 # 1380 <__libc_csu_fini+0x47e>
 c8e:	cb3ff0ef          	jal	ra,940 <puts@plt>
 c92:	4521                	li	a0,8
 c94:	cbdff0ef          	jal	ra,950 <exit@plt>

0000000000000c98 <read_line>:
 c98:	1101                	addi	sp,sp,-32
 c9a:	ec06                	sd	ra,24(sp)
 c9c:	e822                	sd	s0,16(sp)
 c9e:	e426                	sd	s1,8(sp)
 ca0:	ef7ff0ef          	jal	ra,b96 <skip>
 ca4:	c125                	beqz	a0,d04 <read_line+0x6c>
 ca6:	00002497          	auipc	s1,0x2
 caa:	4264a483          	lw	s1,1062(s1) # 30cc <num_input_strings>
 cae:	00249413          	slli	s0,s1,0x2
 cb2:	9426                	add	s0,s0,s1
 cb4:	0412                	slli	s0,s0,0x4
 cb6:	00002797          	auipc	a5,0x2
 cba:	3da7b783          	ld	a5,986(a5) # 3090 <_GLOBAL_OFFSET_TABLE_+0x18>
 cbe:	943e                	add	s0,s0,a5
 cc0:	8522                	mv	a0,s0
 cc2:	c5fff0ef          	jal	ra,920 <strlen@plt>
 cc6:	2501                	sext.w	a0,a0
 cc8:	04e00793          	li	a5,78
 ccc:	08a7c263          	blt	a5,a0,d50 <read_line+0xb8>
 cd0:	357d                	addiw	a0,a0,-1
 cd2:	00249793          	slli	a5,s1,0x2
 cd6:	97a6                	add	a5,a5,s1
 cd8:	00479713          	slli	a4,a5,0x4
 cdc:	00002797          	auipc	a5,0x2
 ce0:	3b47b783          	ld	a5,948(a5) # 3090 <_GLOBAL_OFFSET_TABLE_+0x18>
 ce4:	97ba                	add	a5,a5,a4
 ce6:	953e                	add	a0,a0,a5
 ce8:	00050023          	sb	zero,0(a0)
 cec:	0014879b          	addiw	a5,s1,1
 cf0:	00002717          	auipc	a4,0x2
 cf4:	3cf72e23          	sw	a5,988(a4) # 30cc <num_input_strings>
 cf8:	8522                	mv	a0,s0
 cfa:	60e2                	ld	ra,24(sp)
 cfc:	6442                	ld	s0,16(sp)
 cfe:	64a2                	ld	s1,8(sp)
 d00:	6105                	addi	sp,sp,32
 d02:	8082                	ret
 d04:	00002797          	auipc	a5,0x2
 d08:	37c7b783          	ld	a5,892(a5) # 3080 <stdin@GLIBC_2.27>
 d0c:	639c                	ld	a5,0(a5)
 d0e:	00002717          	auipc	a4,0x2
 d12:	39273703          	ld	a4,914(a4) # 30a0 <_GLOBAL_OFFSET_TABLE_+0x28>
 d16:	6318                	ld	a4,0(a4)
 d18:	02f70363          	beq	a4,a5,d3e <read_line+0xa6>
 d1c:	00002717          	auipc	a4,0x2
 d20:	38473703          	ld	a4,900(a4) # 30a0 <_GLOBAL_OFFSET_TABLE_+0x28>
 d24:	e31c                	sd	a5,0(a4)
 d26:	e71ff0ef          	jal	ra,b96 <skip>
 d2a:	fd35                	bnez	a0,ca6 <read_line+0xe>
 d2c:	00000517          	auipc	a0,0x0
 d30:	68450513          	addi	a0,a0,1668 # 13b0 <__libc_csu_fini+0x4ae>
 d34:	c0dff0ef          	jal	ra,940 <puts@plt>
 d38:	4501                	li	a0,0
 d3a:	c17ff0ef          	jal	ra,950 <exit@plt>
 d3e:	00000517          	auipc	a0,0x0
 d42:	67250513          	addi	a0,a0,1650 # 13b0 <__libc_csu_fini+0x4ae>
 d46:	bfbff0ef          	jal	ra,940 <puts@plt>
 d4a:	4521                	li	a0,8
 d4c:	c05ff0ef          	jal	ra,950 <exit@plt>
 d50:	00000517          	auipc	a0,0x0
 d54:	68050513          	addi	a0,a0,1664 # 13d0 <__libc_csu_fini+0x4ce>
 d58:	be9ff0ef          	jal	ra,940 <puts@plt>
 d5c:	00002717          	auipc	a4,0x2
 d60:	37070713          	addi	a4,a4,880 # 30cc <num_input_strings>
 d64:	431c                	lw	a5,0(a4)
 d66:	0017869b          	addiw	a3,a5,1
 d6a:	c314                	sw	a3,0(a4)
 d6c:	05000713          	li	a4,80
 d70:	02e787b3          	mul	a5,a5,a4
 d74:	4641                	li	a2,16
 d76:	00000597          	auipc	a1,0x0
 d7a:	67a58593          	addi	a1,a1,1658 # 13f0 <__libc_csu_fini+0x4ee>
 d7e:	00002517          	auipc	a0,0x2
 d82:	31253503          	ld	a0,786(a0) # 3090 <_GLOBAL_OFFSET_TABLE_+0x18>
 d86:	953e                	add	a0,a0,a5
 d88:	b89ff0ef          	jal	ra,910 <memcpy@plt>
 d8c:	e63ff0ef          	jal	ra,bee <explode_bomb>

0000000000000d90 <read_four_ints>:
 d90:	1141                	addi	sp,sp,-16
 d92:	e406                	sd	ra,8(sp)
 d94:	862e                	mv	a2,a1
 d96:	00c58793          	addi	a5,a1,12
 d9a:	00858713          	addi	a4,a1,8
 d9e:	00458693          	addi	a3,a1,4
 da2:	00000597          	auipc	a1,0x0
 da6:	65e58593          	addi	a1,a1,1630 # 1400 <__libc_csu_fini+0x4fe>
 daa:	b47ff0ef          	jal	ra,8f0 <__isoc99_sscanf@plt>
 dae:	4791                	li	a5,4
 db0:	00f51563          	bne	a0,a5,dba <read_four_ints+0x2a>
 db4:	60a2                	ld	ra,8(sp)
 db6:	0141                	addi	sp,sp,16
 db8:	8082                	ret
 dba:	e35ff0ef          	jal	ra,bee <explode_bomb>

0000000000000dbe <phase_defused>:
 dbe:	00002717          	auipc	a4,0x2
 dc2:	30e72703          	lw	a4,782(a4) # 30cc <num_input_strings>
 dc6:	4789                	li	a5,2
 dc8:	00f70363          	beq	a4,a5,dce <phase_defused+0x10>
 dcc:	8082                	ret
 dce:	1141                	addi	sp,sp,-16
 dd0:	e406                	sd	ra,8(sp)
 dd2:	00000517          	auipc	a0,0x0
 dd6:	63e50513          	addi	a0,a0,1598 # 1410 <__libc_csu_fini+0x50e>
 dda:	b67ff0ef          	jal	ra,940 <puts@plt>
 dde:	60a2                	ld	ra,8(sp)
 de0:	0141                	addi	sp,sp,16
 de2:	8082                	ret

0000000000000de4 <phase_1>:
 de4:	1141                	addi	sp,sp,-16
 de6:	e406                	sd	ra,8(sp)
 de8:	00000597          	auipc	a1,0x0
 dec:	66058593          	addi	a1,a1,1632 # 1448 <__libc_csu_fini+0x546>
 df0:	b81ff0ef          	jal	ra,970 <strcmp@plt>
 df4:	e501                	bnez	a0,dfc <phase_1+0x18>
 df6:	60a2                	ld	ra,8(sp)
 df8:	0141                	addi	sp,sp,16
 dfa:	8082                	ret
 dfc:	df3ff0ef          	jal	ra,bee <explode_bomb>
 e00:	bfdd                	j	df6 <phase_1+0x12>

0000000000000e02 <phase_2>:
 e02:	715d                	addi	sp,sp,-80
 e04:	e486                	sd	ra,72(sp)
 e06:	e0a2                	sd	s0,64(sp)
 e08:	fc26                	sd	s1,56(sp)
 e0a:	f84a                	sd	s2,48(sp)
 e0c:	f44e                	sd	s3,40(sp)
 e0e:	f052                	sd	s4,32(sp)
 e10:	4481                	li	s1,0
 e12:	00002797          	auipc	a5,0x2
 e16:	2867b783          	ld	a5,646(a5) # 3098 <__stack_chk_guard@GLIBC_2.27>
 e1a:	639c                	ld	a5,0(a5)
 e1c:	ec3e                	sd	a5,24(sp)
 e1e:	002c                	addi	a1,sp,8
 e20:	f71ff0ef          	jal	ra,d90 <read_four_ints>
 e24:	4922                	lw	s2,8(sp)
 e26:	49b2                	lw	s3,12(sp)
 e28:	4442                	lw	s0,16(sp)
 e2a:	4a52                	lw	s4,20(sp)
 e2c:	47a9                	li	a5,10
 e2e:	00f91563          	bne	s2,a5,e38 <phase_2+0x36>
 e32:	47b1                	li	a5,12
 e34:	00f98463          	beq	s3,a5,e3c <phase_2+0x3a>
 e38:	db7ff0ef          	jal	ra,bee <explode_bomb>
 e3c:	4795                	li	a5,5
 e3e:	0487ee63          	bltu	a5,s0,e9a <phase_2+0x98>
 e42:	040a                	slli	s0,s0,0x2
 e44:	00000717          	auipc	a4,0x0
 e48:	64070713          	addi	a4,a4,1600 # 1484 <__libc_csu_fini+0x582>
 e4c:	943a                	add	s0,s0,a4
 e4e:	401c                	lw	a5,0(s0)
 e50:	97ba                	add	a5,a5,a4
 e52:	8782                	jr	a5
 e54:	013904bb          	addw	s1,s2,s3
 e58:	05449463          	bne	s1,s4,ea0 <phase_2+0x9e>
 e5c:	6762                	ld	a4,24(sp)
 e5e:	00002797          	auipc	a5,0x2
 e62:	23a7b783          	ld	a5,570(a5) # 3098 <__stack_chk_guard@GLIBC_2.27>
 e66:	639c                	ld	a5,0(a5)
 e68:	02f71f63          	bne	a4,a5,ea6 <phase_2+0xa4>
 e6c:	60a6                	ld	ra,72(sp)
 e6e:	6406                	ld	s0,64(sp)
 e70:	74e2                	ld	s1,56(sp)
 e72:	7942                	ld	s2,48(sp)
 e74:	79a2                	ld	s3,40(sp)
 e76:	7a02                	ld	s4,32(sp)
 e78:	6161                	addi	sp,sp,80
 e7a:	8082                	ret
 e7c:	413904bb          	subw	s1,s2,s3
 e80:	bfe1                	j	e58 <phase_2+0x56>
 e82:	033904bb          	mulw	s1,s2,s3
 e86:	bfc9                	j	e58 <phase_2+0x56>
 e88:	013974b3          	and	s1,s2,s3
 e8c:	b7f1                	j	e58 <phase_2+0x56>
 e8e:	013964b3          	or	s1,s2,s3
 e92:	b7d9                	j	e58 <phase_2+0x56>
 e94:	013944b3          	xor	s1,s2,s3
 e98:	b7c1                	j	e58 <phase_2+0x56>
 e9a:	d55ff0ef          	jal	ra,bee <explode_bomb>
 e9e:	bf6d                	j	e58 <phase_2+0x56>
 ea0:	d4fff0ef          	jal	ra,bee <explode_bomb>
 ea4:	bf65                	j	e5c <phase_2+0x5a>
 ea6:	a5bff0ef          	jal	ra,900 <__stack_chk_fail@plt>

0000000000000eaa <__libc_csu_init>:
 eaa:	7139                	addi	sp,sp,-64
 eac:	f822                	sd	s0,48(sp)
 eae:	f04a                	sd	s2,32(sp)
 eb0:	00002417          	auipc	s0,0x2
 eb4:	f4040413          	addi	s0,s0,-192 # 2df0 <__frame_dummy_init_array_entry>
 eb8:	00002917          	auipc	s2,0x2
 ebc:	f4090913          	addi	s2,s2,-192 # 2df8 <__do_global_dtors_aux_fini_array_entry>
 ec0:	40890933          	sub	s2,s2,s0
 ec4:	fc06                	sd	ra,56(sp)
 ec6:	f426                	sd	s1,40(sp)
 ec8:	ec4e                	sd	s3,24(sp)
 eca:	e852                	sd	s4,16(sp)
 ecc:	e456                	sd	s5,8(sp)
 ece:	40395913          	srai	s2,s2,0x3
 ed2:	00090f63          	beqz	s2,ef0 <__libc_csu_init+0x46>
 ed6:	89aa                	mv	s3,a0
 ed8:	8a2e                	mv	s4,a1
 eda:	8ab2                	mv	s5,a2
 edc:	4481                	li	s1,0
 ede:	601c                	ld	a5,0(s0)
 ee0:	8656                	mv	a2,s5
 ee2:	85d2                	mv	a1,s4
 ee4:	854e                	mv	a0,s3
 ee6:	0485                	addi	s1,s1,1
 ee8:	9782                	jalr	a5
 eea:	0421                	addi	s0,s0,8
 eec:	fe9919e3          	bne	s2,s1,ede <__libc_csu_init+0x34>
 ef0:	70e2                	ld	ra,56(sp)
 ef2:	7442                	ld	s0,48(sp)
 ef4:	74a2                	ld	s1,40(sp)
 ef6:	7902                	ld	s2,32(sp)
 ef8:	69e2                	ld	s3,24(sp)
 efa:	6a42                	ld	s4,16(sp)
 efc:	6aa2                	ld	s5,8(sp)
 efe:	6121                	addi	sp,sp,64
 f00:	8082                	ret

0000000000000f02 <__libc_csu_fini>:
 f02:	8082                	ret
