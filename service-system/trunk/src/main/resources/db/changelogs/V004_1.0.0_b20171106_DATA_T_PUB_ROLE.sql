--liquibase formatted sql
--changeset huangligui:system-4
INSERT INTO T_PUB_ROLE VALUES ('查询统计管理员-副', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20170616134359', 'YYYYMMDDHH24MISS'), '匿名', TO_DATE('20170616134359', 'YYYYMMDDHH24MISS'), '521', '582', NULL);
INSERT INTO T_PUB_ROLE VALUES ('考核登记角色', NULL, '710,711,712,713,714,715,771,772,775,783,784,785,786', 5, 1, 'Y', '张文锐', TO_DATE('20170618121923', 'YYYYMMDDHH24MISS'), '张文锐', TO_DATE('20170618122002', 'YYYYMMDDHH24MISS'), '541', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('测试管理员', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20170623153150', 'YYYYMMDDHH24MISS'), '匿名', TO_DATE('20170623153150', 'YYYYMMDDHH24MISS'), '549', '621', NULL);
INSERT INTO T_PUB_ROLE VALUES ('小角色', '做实验的', '260,261,265,263,527,282,264,271', 10, 1, 'Y', '超级系统管理员', TO_DATE('20170316104555', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170329111856', 'YYYYMMDDHH24MISS'), '368', '334', NULL);
INSERT INTO T_PUB_ROLE VALUES ('公共平台管理员-副', NULL, '223,291,295,296,297,301,292,294,329,331,333,334,335,336,330,343,345,346,347,362,363,365,394,395,396,397,398,421,422,569,575,577,578,579,572,580,581,582,583,570,584,586,587,585,588,589,590,700,702,718,767,227,89,44,270,41,267,268,269,272,293,59,162,163,164,165,166,243,591,321,322,323,324,325,45,167,168,169,244,46,283,284,286,953,954,956,957,958,959,960,1100,1106', 0, 2, 'N', '超级系统管理员', TO_DATE('20170703091353', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170925151551', 'YYYYMMDDHH24MISS'), '551', '1', NULL);
INSERT INTO T_PUB_ROLE VALUES ('勤务系统管理员', NULL, '672,673,674', 0, 2, 'Y', NULL, TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170410154800', 'YYYYMMDDHH24MISS'), '281', '421', NULL);
INSERT INTO T_PUB_ROLE VALUES ('公共平台管理员', NULL, '223,291,295,296,297,301,292,294,329,331,333,334,335,336,330,343,345,346,347,362,363,365,394,395,396,397,398,421,422,569,575,577,578,579,572,580,581,582,583,570,584,586,587,585,588,589,590,700,702,718,767,227,44,270,41,267,268,269,272,293,59,162,163,164,165,166,243,591,321,322,323,324,325,45,167,168,169,244,46,283,284,286,953,954,956,957,958,959,960,1100,1106,285,89,1107,1108,1109', 0, 8, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171012151655', 'YYYYMMDDHH24MISS'), '1', '1', NULL);
INSERT INTO T_PUB_ROLE VALUES ('合成作战管理员', NULL, '260,261,263,264,265,271,282', NULL, 0, 'Y', NULL, TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170116132700', 'YYYYMMDDHH24MISS'), '185', '334', NULL);
INSERT INTO T_PUB_ROLE VALUES ('可视化管理员', '可视化系统的管理员', '487,492,945,946,947,948,949,950,951,992,1161,1162,1163,1164,1165', 1, 2, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171118092442', 'YYYYMMDDHH24MISS'), '263', '404', NULL);
INSERT INTO T_PUB_ROLE VALUES ('警情回访管理员', NULL, '423,426,428,424,476,478,480,481,484,675,676,677,684,685,688,689,687,925,926,927,928,929,921,922,923,916,399,932,933,934,936,1025,1026,1027,1029,1030,1035,429,482,924,1036,1037,1120,1121,1122,1125', 1, 2, 'Y', NULL, TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '唐建冬', TO_DATE('20171117090531', 'YYYYMMDDHH24MISS'), '310', '460', NULL);
INSERT INTO T_PUB_ROLE VALUES ('子系统管理员-湖分', NULL, '89,41,46,284,286,45,167,168,169,244,44,267,268,270,269,272,293,59,162,163,164,165,166,243,362,363,365,421,422,394,395,397,398,396,570,584,586,587,585,588,589,767', 1, 6, 'Y', '超级系统管理员', TO_DATE('20170405182238', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170925151604', 'YYYYMMDDHH24MISS'), '464', '1', NULL);
INSERT INTO T_PUB_ROLE VALUES ('预案管理员', NULL, '373,851,852,853,883,884,885,886,892,890,889,893,843,846,876,877,878,879,848,955,995,994,847,988,989,990,991,849,908,909,911,912,854,855,856,857,858,377,379,380,381,382,383,457,464,465,466,467,459,460,461,462,463,486,489,488,490,491,502,521,522,523,558,559,560,561,562,563,510,511,512,515,519,564,565,566,567,568,593,594,595,596,597,605,606,607,608,609,1094,850,1090,1091,1092,1093', 1, 2, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '预案管理员', TO_DATE('20171006155958', 'YYYYMMDDHH24MISS'), '242', '381', NULL);
INSERT INTO T_PUB_ROLE VALUES ('角色3', NULL, '1151,1152,1153,1154,1155,1156,1158,1159,1160,1157', 0, 1, 'Y', '警情回访管理员', TO_DATE('20170830153231', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171103110634', 'YYYYMMDDHH24MISS'), '625', '662', NULL);
INSERT INTO T_PUB_ROLE VALUES ('三台合一接处警系统管', NULL, '507,513,514,517,518,520,1110,1111,1112,1113', NULL, 1, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '唐建冬', TO_DATE('20171122164846', 'YYYYMMDDHH24MISS'), '346', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('考核人员', NULL, '704,705,706,707,708,709,745,746,869,943,1028', 1, 1, 'Y', '超级系统管理员', TO_DATE('20170412131435', 'YYYYMMDDHH24MISS'), '绩效考核管理员', TO_DATE('20170629153844', 'YYYYMMDDHH24MISS'), '466', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('应急处置管理员', NULL, '816,817,820,824,825,821,827,829,822,831,832,833,823,826,818,837,839,838,860,859,830,863,864,865,871,870,872,873,887,828,917,918,919,920,939,862,819,844,845,896,897,1031,1033,1032,1034', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170503101401', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171128171554', 'YYYYMMDDHH24MISS'), '499', '583', NULL);
INSERT INTO T_PUB_ROLE VALUES ('绩效考核管理员', NULL, '366,704,745,746,943,705,706,707,708,709,869,710,711,712,713,714,715,771,772,775,783,784,785,786,799,800,812,813,986,987,882,874,875,888,895,880,881,930,940,941,614,615,617,618,619,683,616,620,621,622,623,686,695,696,697,698,699,952,981,982,983,984,985', 0, 2, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171128154927', 'YYYYMMDDHH24MISS'), '302', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('违法犯罪举报管理员', NULL, '728,719,734,735,736,737,367,372,669,670,671,680,681,682,371,610,611,612,613,727,729,732,731,733,754,788,789,790,791,792,794,755,756,757,764,758,759,760,766,748,795,796,797,798,370,555,556,450,598,599,801,840,841,802,861,866,867,937,693,694,1081,1082,1123,1124,1145,1146', NULL, 1, 'Y', '绩效考核系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '违法犯罪管理员', TO_DATE('20170828104610', 'YYYYMMDDHH24MISS'), '303', '443', NULL);
INSERT INTO T_PUB_ROLE VALUES ('值班要情管理员', NULL, '132,136,138,93,94,95,122,96,97,98,99,101,103,104,105,106,107,109,117,118,119,120,121,111,112,113,114,115,123,124,125,126,127,901,902,903,904,905,128,938,942,997,998,999,1000,108,1005,1006,1007,1008,1009,1010,1011,1013,1040,137,1043,1044,1045,1046,1047,1048,1049,1051,1052,139,140,1053,1054,1055,1056,1059,1060,1061,1062,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1077,1076,1075,1085,1086,1087,1088,1089', 1, 2, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170811093930', 'YYYYMMDDHH24MISS'), '262', '403', NULL);
INSERT INTO T_PUB_ROLE VALUES ('template管理员', NULL, '668,944', 1, 6, 'Y', '超级系统管理员', TO_DATE('20170310085057', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170807162402', 'YYYYMMDDHH24MISS'), '301', '441', NULL);
INSERT INTO T_PUB_ROLE VALUES ('短信平台录入员', '测试', '1127,1126,1128,1129,1130,1131,1132', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170829155508', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170829155534', 'YYYYMMDDHH24MISS'), '624', '661', NULL);
INSERT INTO T_PUB_ROLE VALUES ('三台合一数据维护管理', NULL, '524,525,602,601,603,604,661,662,664,665,666,667,663,716,717,776,779,780,781,782,787,777,803,804,805,806,778,807,808,809,810,adcd16dcf08a4f96a8e1a2e041e46db0', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170327150903', 'YYYYMMDDHH24MISS'), '唐建冬', TO_DATE('20171103160838', 'YYYYMMDDHH24MISS'), '418', '519', NULL);
INSERT INTO T_PUB_ROLE VALUES ('警情回访管理员-副', NULL, '399,423,426,428,424,429,476,478,482,480,481,484,675,676,677,684,685,687,688,689,932,933,934,925,926,927,928,929,921,922,923,924,936', 1, 2, 'Y', '匿名', TO_DATE('20170329113423', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170825110302', 'YYYYMMDDHH24MISS'), '452', '460', NULL);
INSERT INTO T_PUB_ROLE VALUES ('短信管理员', '短信管理员', '1019,1020,1021,1022,1023,1024', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170623154418', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170623154454', 'YYYYMMDDHH24MISS'), '550', '621', NULL);
INSERT INTO T_PUB_ROLE VALUES ('三台合一接处警系统接', NULL, '507,513,514,517,518,520,1113,1111,1112', 3, 2, 'Y', '超级系统管理员', TO_DATE('20170327135939', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171121204628', 'YYYYMMDDHH24MISS'), '414', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('接警大组长', NULL, '507,517,518,514,520,1133,1134,c2e41d92e4d8447f88447cd08702bde0,a601e8d93ff84968a8a27de27914ab25,1ced84183f534477881e00021e1cfa57,5231e26d30d04108937944000515c49e,513,538e39d901dd4ac7a26fa1b6380830d2,fd3bf4af59b34265bbedca374fe9115c,1114,caa30433bd164de795ea3a20eb036a95', 0, 2, 'Y', '超级系统管理员', TO_DATE('20170327140054', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171121204543', 'YYYYMMDDHH24MISS'), '416', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('三台合一接处警系统处', NULL, '507,513,514,517,518,520', 2, 2, 'Y', '超级系统管理员', TO_DATE('20170327140030', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171022182825', 'YYYYMMDDHH24MISS'), '415', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('接警小组长', NULL, 'c2e41d92e4d8447f88447cd08702bde0,507,513,1113,517,518,514,1111,1112,520', 1, 3, 'Y', '超级系统管理员', TO_DATE('20170327140130', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20171121204615', 'YYYYMMDDHH24MISS'), '417', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('系统管理员', NULL, '614,615,617,618,619,683,616,620,621,622,623,686,695,696,697,698,699,952,981,982,983,984,985', 0, 1, 'Y', '绩效考核管理员', TO_DATE('20170731153414', 'YYYYMMDDHH24MISS'), '绩效考核管理员', TO_DATE('20170731161137', 'YYYYMMDDHH24MISS'), '602', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('查询统计管理员', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20170424102501', 'YYYYMMDDHH24MISS'), '匿名', TO_DATE('20170424102501', 'YYYYMMDDHH24MISS'), '474', '582', NULL);
INSERT INTO T_PUB_ROLE VALUES ('警情研判分析系统管理', NULL, '1038,1039,1041,1042', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170705163546', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170706164934', 'YYYYMMDDHH24MISS'), '561', '641', NULL);
INSERT INTO T_PUB_ROLE VALUES ('短信平台管理员', NULL, '1126,1129,1128,1130,1127,1136,1137,1138,1139,1140,1131,1141,1142,1143,1144,1132,1147,1148,1149,1150', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170825131013', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170828104026', 'YYYYMMDDHH24MISS'), '623', '661', NULL);
INSERT INTO T_PUB_ROLE VALUES ('领导人员', NULL, '366,710,711,712,713,714,715,771,772,775,783,784,785,786,799,800,812,813,986,987,882,874,875,888,895,880,881,930,940,941', 0, 1, 'Y', '绩效考核管理员', TO_DATE('20170731152557', 'YYYYMMDDHH24MISS'), '绩效考核管理员', TO_DATE('20170731153346', 'YYYYMMDDHH24MISS'), '601', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('处警终端管理员', NULL, '651,652', 0, 1, 'Y', '超级系统管理员', TO_DATE('20170405163615', 'YYYYMMDDHH24MISS'), '处警终端管理员', TO_DATE('20170405183317', 'YYYYMMDDHH24MISS'), '463', '563', NULL);
INSERT INTO T_PUB_ROLE VALUES ('警情抽查角色', NULL, '799,800,812,813,882,874,875,888,895,986,987', 3, 1, 'Y', '绩效考核管理员', TO_DATE('20170601131846', 'YYYYMMDDHH24MISS'), '绩效考核管理员', TO_DATE('20170610130837', 'YYYYMMDDHH24MISS'), '502', '442', NULL);
INSERT INTO T_PUB_ROLE VALUES ('公共平台管理前台测试', '3', '89,286,46,41,329,331,336,330,346,569,578,572,582,700,702,718,244,45,272,44,59,243,223,227,573', 3, 13, 'Y', '超级系统管理员', TO_DATE('20170316141157', 'YYYYMMDDHH24MISS'), '超级系统管理员', TO_DATE('20170807135449', 'YYYYMMDDHH24MISS'), '390', '1', NULL);
INSERT INTO T_PUB_ROLE VALUES ('处警大组长', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20171120150043', 'YYYYMMDDHH24MISS'), NULL, TO_DATE('20171120150043', 'YYYYMMDDHH24MISS'), 'ff335f244e064c0d946fdea250924cbe', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('处警小组长', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20171120150056', 'YYYYMMDDHH24MISS'), NULL, TO_DATE('20171120150056', 'YYYYMMDDHH24MISS'), '5eb258600aed488494dd1f562fa867ca', '481', NULL);
INSERT INTO T_PUB_ROLE VALUES ('测试角色新增', NULL, NULL, 0, 1, 'Y', '超级系统管理员', TO_DATE('20171129083210', 'YYYYMMDDHH24MISS'), NULL, TO_DATE('20171129083210', 'YYYYMMDDHH24MISS'), '86649c534f7246948f677554044cc89a', '404', NULL);
