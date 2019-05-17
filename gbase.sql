
drop database  if exists his;
create database his;
use his;

-- drop table  if exists hospital_data;
create table hospital_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(200)                             ,
	address             	varchar(24)                              ,
	telephone           	varchar(44)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists expense_type_data;
create table expense_type_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(12)                              ,
	helper_chars        	varchar(12)                              ,
	status              	varchar(8)                               ,
	hospital            	varchar(48)                              ,
	description         	varchar(32765)                           ,
	update_time         	timestamp                                ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists period_data;
create table period_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(8)                               ,
	hospital            	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists expense_item_data;
create table expense_item_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(20)                              ,
	price               	numeric(15,2)                            ,
	expense_type        	varchar(48)                              ,
	hospital            	varchar(48)                              ,
	update_time         	timestamp                                ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists doctor_data;
create table doctor_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(12)                              ,
	shot_image          	varchar(512)                             ,
	hospital            	varchar(48)                              ,
	update_time         	timestamp                                ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists department_data;
create table department_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(12)                              ,
	hospital            	varchar(48)                              ,
	update_time         	timestamp                                ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists doctor_assignment_data;
create table doctor_assignment_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(40)                              ,
	doctor              	varchar(48)                              ,
	department          	varchar(48)                              ,
	update_time         	timestamp                                ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists doctor_schedule_data;
create table doctor_schedule_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(116)                             ,
	doctor              	varchar(48)                              ,
	schedule_date       	date                                     ,
	period              	varchar(48)                              ,
	department          	varchar(48)                              ,
	available           	int                                      ,
	price               	numeric(7,2)                             ,
	expense_type        	varchar(48)                              ,
	create_time         	timestamp                                ,
	update_time         	timestamp                                ,
	hospital            	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists user_domain_data;
create table user_domain_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(16)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists user_white_list_data;
create table user_white_list_data (
	id                  	varchar(48)          not null            ,
	user_identity       	varchar(40)                              ,
	user_special_functions	varchar(200)                             ,
	domain              	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists sec_user_data;
create table sec_user_data (
	id                  	varchar(48)          not null            ,
	login               	varchar(20)                              ,
	mobile              	varchar(11)                              ,
	email               	varchar(76)                              ,
	pwd                 	varchar(64)                              ,
	verification_code   	int                                      ,
	verification_code_expire	timestamp                                ,
	last_login_time     	timestamp                                ,
	domain              	varchar(48)                              ,
	blocking            	varchar(48)                              ,
	current_status      	varchar(28)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists sec_user_blocking_data;
create table sec_user_blocking_data (
	id                  	varchar(48)          not null            ,
	who                 	varchar(52)                              ,
	block_time          	timestamp                                ,
	comments            	varchar(96)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists user_app_data;
create table user_app_data (
	id                  	varchar(48)          not null            ,
	title               	varchar(300)                             ,
	sec_user            	varchar(48)                              ,
	app_icon            	varchar(36)                              ,
	full_access         	boolean                                  ,
	permission          	varchar(16)                              ,
	object_type         	varchar(100)                             ,
	object_id           	varchar(40)                              ,
	location            	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists list_access_data;
create table list_access_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(200)                             ,
	internal_name       	varchar(200)                             ,
	read_permission     	boolean                                  ,
	create_permission   	boolean                                  ,
	delete_permission   	boolean                                  ,
	update_permission   	boolean                                  ,
	execution_permission	boolean                                  ,
	app                 	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists object_access_data;
create table object_access_data (
	id                  	varchar(48)          not null            ,
	name                	varchar(28)                              ,
	object_type         	varchar(112)                             ,
	list1               	varchar(80)                              ,
	list2               	varchar(80)                              ,
	list3               	varchar(80)                              ,
	list4               	varchar(80)                              ,
	list5               	varchar(80)                              ,
	list6               	varchar(80)                              ,
	list7               	varchar(80)                              ,
	list8               	varchar(80)                              ,
	list9               	varchar(80)                              ,
	app                 	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists login_history_data;
create table login_history_data (
	id                  	varchar(48)          not null            ,
	login_time          	timestamp                                ,
	from_ip             	varchar(44)                              ,
	description         	varchar(16)                              ,
	sec_user            	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists generic_form_data;
create table generic_form_data (
	id                  	varchar(48)          not null            ,
	title               	varchar(20)                              ,
	description         	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists form_message_data;
create table form_message_data (
	id                  	varchar(48)          not null            ,
	title               	varchar(24)                              ,
	form                	varchar(48)                              ,
	level               	varchar(28)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists form_field_message_data;
create table form_field_message_data (
	id                  	varchar(48)          not null            ,
	title               	varchar(16)                              ,
	parameter_name      	varchar(16)                              ,
	form                	varchar(48)                              ,
	level               	varchar(28)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists form_field_data;
create table form_field_data (
	id                  	varchar(48)          not null            ,
	label               	varchar(12)                              ,
	locale_key          	varchar(44)                              ,
	parameter_name      	varchar(16)                              ,
	type                	varchar(36)                              ,
	form                	varchar(48)                              ,
	placeholder         	varchar(48)                              ,
	default_value       	varchar(12)                              ,
	description         	varchar(48)                              ,
	field_group         	varchar(16)                              ,
	minimum_value       	varchar(60)                              ,
	maximum_value       	varchar(72)                              ,
	required            	boolean                                  ,
	disabled            	boolean                                  ,
	custom_rendering    	boolean                                  ,
	candidate_values    	varchar(12)                              ,
	suggest_values      	varchar(12)                              ,
	version             	int                                      ,
	primary key(id)
);

-- drop table  if exists form_action_data;
create table form_action_data (
	id                  	varchar(48)          not null            ,
	label               	varchar(8)                               ,
	locale_key          	varchar(16)                              ,
	action_key          	varchar(24)                              ,
	level               	varchar(28)                              ,
	url                 	varchar(168)                             ,
	form                	varchar(48)                              ,
	version             	int                                      ,
	primary key(id)
);






	
insert into hospital_data values ('H000001','上和医院','毕升路22号','028-9123123','1');

	
insert into expense_type_data values ('ET000001','诊疗费','zlf','正常','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-05-14 00:55:25','1');
insert into expense_type_data values ('ET000002','治疗费','zlf','停用','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-05-10 18:07:24','1');
insert into expense_type_data values ('ET000003','检查费','jcf','正常','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-05-06 12:24:12','1');
insert into expense_type_data values ('ET000004','诊疗费','zlf','停用','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-05-15 20:46:38','1');
insert into expense_type_data values ('ET000005','治疗费','zlf','正常','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-04-29 18:22:51','1');
insert into expense_type_data values ('ET000006','检查费','jcf','停用','H000001','    一段样例文字。    一段样例文字。\n可以分段。可以分段。\n\n可以空行。可以空行。\n\n','2019-05-16 19:33:57','1');

	
insert into period_data values ('P000001','上午','H000001','1');
insert into period_data values ('P000002','下午','H000001','1');
insert into period_data values ('P000003','夜班','H000001','1');

	
insert into expense_item_data values ('EI000001','专家诊疗费','89227149312.00','ET000001','H000001','2019-04-28 02:09:39','1');
insert into expense_item_data values ('EI000002','血常规','98521858048.00','ET000001','H000001','2019-05-16 18:26:09','1');
insert into expense_item_data values ('EI000003','煎药费','74525040640.00','ET000001','H000001','2019-04-28 21:39:47','1');
insert into expense_item_data values ('EI000004','专家诊疗费','82626002944.00','ET000001','H000001','2019-05-15 23:44:06','1');
insert into expense_item_data values ('EI000005','血常规','72719581184.00','ET000001','H000001','2019-05-14 12:01:56','1');
insert into expense_item_data values ('EI000006','煎药费','88420081664.00','ET000001','H000001','2019-05-10 12:48:29','1');
insert into expense_item_data values ('EI000007','专家诊疗费','83156770816.00','ET000002','H000001','2019-05-10 15:00:53','1');
insert into expense_item_data values ('EI000008','血常规','71969619968.00','ET000002','H000001','2019-05-11 02:28:05','1');
insert into expense_item_data values ('EI000009','煎药费','71348035584.00','ET000002','H000001','2019-05-04 13:51:18','1');
insert into expense_item_data values ('EI000010','专家诊疗费','83252568064.00','ET000002','H000001','2019-05-09 07:46:35','1');
insert into expense_item_data values ('EI000011','血常规','92759924736.00','ET000002','H000001','2019-05-16 18:13:04','1');
insert into expense_item_data values ('EI000012','煎药费','95959302144.00','ET000002','H000001','2019-04-26 22:44:08','1');
insert into expense_item_data values ('EI000013','专家诊疗费','87843708928.00','ET000003','H000001','2019-04-27 01:46:46','1');
insert into expense_item_data values ('EI000014','血常规','81181540352.00','ET000003','H000001','2019-04-26 13:15:47','1');
insert into expense_item_data values ('EI000015','煎药费','71574331392.00','ET000003','H000001','2019-05-01 12:48:23','1');
insert into expense_item_data values ('EI000016','专家诊疗费','91116085248.00','ET000003','H000001','2019-05-12 08:14:46','1');
insert into expense_item_data values ('EI000017','血常规','70933913600.00','ET000003','H000001','2019-05-16 15:26:24','1');
insert into expense_item_data values ('EI000018','煎药费','89231499264.00','ET000003','H000001','2019-05-14 20:26:40','1');
insert into expense_item_data values ('EI000019','专家诊疗费','76753911808.00','ET000004','H000001','2019-05-13 09:19:31','1');
insert into expense_item_data values ('EI000020','血常规','91480408064.00','ET000004','H000001','2019-05-08 07:05:10','1');
insert into expense_item_data values ('EI000021','煎药费','82120589312.00','ET000004','H000001','2019-05-07 09:40:30','1');
insert into expense_item_data values ('EI000022','专家诊疗费','79087640576.00','ET000004','H000001','2019-05-03 10:12:59','1');
insert into expense_item_data values ('EI000023','血常规','88152367104.00','ET000004','H000001','2019-04-28 00:01:29','1');
insert into expense_item_data values ('EI000024','煎药费','97203920896.00','ET000004','H000001','2019-05-10 20:47:33','1');
insert into expense_item_data values ('EI000025','专家诊疗费','99373465600.00','ET000005','H000001','2019-04-29 03:50:23','1');
insert into expense_item_data values ('EI000026','血常规','95287459840.00','ET000005','H000001','2019-05-16 13:46:38','1');
insert into expense_item_data values ('EI000027','煎药费','95136702464.00','ET000005','H000001','2019-04-26 16:21:22','1');
insert into expense_item_data values ('EI000028','专家诊疗费','84460068864.00','ET000005','H000001','2019-05-02 23:16:22','1');
insert into expense_item_data values ('EI000029','血常规','80589488128.00','ET000005','H000001','2019-05-13 00:10:37','1');
insert into expense_item_data values ('EI000030','煎药费','94282137600.00','ET000005','H000001','2019-04-28 11:02:24','1');
insert into expense_item_data values ('EI000031','专家诊疗费','80530407424.00','ET000006','H000001','2019-05-01 13:14:06','1');
insert into expense_item_data values ('EI000032','血常规','76400336896.00','ET000006','H000001','2019-05-05 22:11:24','1');
insert into expense_item_data values ('EI000033','煎药费','92170002432.00','ET000006','H000001','2019-04-26 21:42:41','1');
insert into expense_item_data values ('EI000034','专家诊疗费','75344191488.00','ET000006','H000001','2019-05-02 20:47:33','1');
insert into expense_item_data values ('EI000035','血常规','78287601664.00','ET000006','H000001','2019-05-12 16:38:09','1');
insert into expense_item_data values ('EI000036','煎药费','97382539264.00','ET000006','H000001','2019-05-14 22:01:37','1');

	
insert into doctor_data values ('D000001','魏松全','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-05-02 14:00:48','1');
insert into doctor_data values ('D000002','魏松全0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-04-29 17:08:12','1');
insert into doctor_data values ('D000003','魏松全0003','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-04-28 00:51:05','1');
insert into doctor_data values ('D000004','魏松全0004','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-04-30 03:55:13','1');
insert into doctor_data values ('D000005','魏松全0005','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-05-07 09:04:31','1');
insert into doctor_data values ('D000006','魏松全0006','https://demo.doublechaintech.com/demodata/imageManager/genImage/snap.shot00/400/300/red/','H000001','2019-05-15 17:40:57','1');

	
insert into department_data values ('D000001','放射科','H000001','2019-04-29 04:53:17','1');
insert into department_data values ('D000002','放射科0002','H000001','2019-05-17 09:02:40','1');
insert into department_data values ('D000003','放射科0003','H000001','2019-05-12 09:02:43','1');
insert into department_data values ('D000004','放射科0004','H000001','2019-05-09 05:57:12','1');
insert into department_data values ('D000005','放射科0005','H000001','2019-04-30 09:45:24','1');
insert into department_data values ('D000006','放射科0006','H000001','2019-04-25 23:36:20','1');

	
insert into doctor_assignment_data values ('DA000001','魏松全在内分泌科室上','D000001','D000001','2019-04-25 19:36:13','1');
insert into doctor_assignment_data values ('DA000002','魏松全在内分泌科室上0002','D000001','D000001','2019-04-28 00:36:14','1');
insert into doctor_assignment_data values ('DA000003','魏松全在内分泌科室上0003','D000001','D000001','2019-05-04 01:50:15','1');
insert into doctor_assignment_data values ('DA000004','魏松全在内分泌科室上0004','D000001','D000001','2019-04-30 05:45:07','1');
insert into doctor_assignment_data values ('DA000005','魏松全在内分泌科室上0005','D000001','D000001','2019-05-10 20:13:23','1');
insert into doctor_assignment_data values ('DA000006','魏松全在内分泌科室上0006','D000001','D000001','2019-05-02 06:07:49','1');
insert into doctor_assignment_data values ('DA000007','魏松全在内分泌科室上0007','D000002','D000002','2019-04-29 18:57:50','1');
insert into doctor_assignment_data values ('DA000008','魏松全在内分泌科室上0008','D000002','D000002','2019-05-08 23:25:18','1');
insert into doctor_assignment_data values ('DA000009','魏松全在内分泌科室上0009','D000002','D000002','2019-05-11 17:44:59','1');
insert into doctor_assignment_data values ('DA000010','魏松全在内分泌科室上0010','D000002','D000002','2019-05-17 11:19:04','1');
insert into doctor_assignment_data values ('DA000011','魏松全在内分泌科室上0011','D000002','D000002','2019-04-26 04:36:57','1');
insert into doctor_assignment_data values ('DA000012','魏松全在内分泌科室上0012','D000002','D000002','2019-05-10 21:06:16','1');
insert into doctor_assignment_data values ('DA000013','魏松全在内分泌科室上0013','D000003','D000003','2019-05-01 00:13:31','1');
insert into doctor_assignment_data values ('DA000014','魏松全在内分泌科室上0014','D000003','D000003','2019-05-15 03:33:14','1');
insert into doctor_assignment_data values ('DA000015','魏松全在内分泌科室上0015','D000003','D000003','2019-05-10 05:53:49','1');
insert into doctor_assignment_data values ('DA000016','魏松全在内分泌科室上0016','D000003','D000003','2019-05-07 23:38:10','1');
insert into doctor_assignment_data values ('DA000017','魏松全在内分泌科室上0017','D000003','D000003','2019-05-03 09:26:12','1');
insert into doctor_assignment_data values ('DA000018','魏松全在内分泌科室上0018','D000003','D000003','2019-05-15 04:48:30','1');
insert into doctor_assignment_data values ('DA000019','魏松全在内分泌科室上0019','D000004','D000004','2019-05-08 12:28:00','1');
insert into doctor_assignment_data values ('DA000020','魏松全在内分泌科室上0020','D000004','D000004','2019-05-13 10:02:25','1');
insert into doctor_assignment_data values ('DA000021','魏松全在内分泌科室上0021','D000004','D000004','2019-05-07 11:14:06','1');
insert into doctor_assignment_data values ('DA000022','魏松全在内分泌科室上0022','D000004','D000004','2019-05-05 22:43:34','1');
insert into doctor_assignment_data values ('DA000023','魏松全在内分泌科室上0023','D000004','D000004','2019-04-28 22:35:50','1');
insert into doctor_assignment_data values ('DA000024','魏松全在内分泌科室上0024','D000004','D000004','2019-05-02 01:50:17','1');
insert into doctor_assignment_data values ('DA000025','魏松全在内分泌科室上0025','D000005','D000005','2019-05-12 19:30:47','1');
insert into doctor_assignment_data values ('DA000026','魏松全在内分泌科室上0026','D000005','D000005','2019-05-10 05:39:52','1');
insert into doctor_assignment_data values ('DA000027','魏松全在内分泌科室上0027','D000005','D000005','2019-05-05 03:28:00','1');
insert into doctor_assignment_data values ('DA000028','魏松全在内分泌科室上0028','D000005','D000005','2019-05-10 08:10:39','1');
insert into doctor_assignment_data values ('DA000029','魏松全在内分泌科室上0029','D000005','D000005','2019-05-09 10:56:16','1');
insert into doctor_assignment_data values ('DA000030','魏松全在内分泌科室上0030','D000005','D000005','2019-05-06 02:23:00','1');
insert into doctor_assignment_data values ('DA000031','魏松全在内分泌科室上0031','D000006','D000006','2019-05-08 10:26:25','1');
insert into doctor_assignment_data values ('DA000032','魏松全在内分泌科室上0032','D000006','D000006','2019-04-30 12:12:24','1');
insert into doctor_assignment_data values ('DA000033','魏松全在内分泌科室上0033','D000006','D000006','2019-05-16 04:14:41','1');
insert into doctor_assignment_data values ('DA000034','魏松全在内分泌科室上0034','D000006','D000006','2019-05-05 23:32:38','1');
insert into doctor_assignment_data values ('DA000035','魏松全在内分泌科室上0035','D000006','D000006','2019-04-27 14:53:01','1');
insert into doctor_assignment_data values ('DA000036','魏松全在内分泌科室上0036','D000006','D000006','2019-05-06 21:16:59','1');

	
insert into doctor_schedule_data values ('DS000001','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个10','D000001','2018-06-09','P000001','D000001','15','112.41','ET000001','2019-05-03 05:08:12','2019-05-12 09:37:15','H000001','1');
insert into doctor_schedule_data values ('DS000002','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100002','D000001','2019-04-07','P000001','D000001','15','92.24','ET000001','2019-05-16 05:02:33','2019-05-16 02:07:20','H000001','1');
insert into doctor_schedule_data values ('DS000003','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100003','D000001','2018-07-21','P000001','D000001','16','96.20','ET000001','2019-05-15 06:43:53','2019-04-29 16:00:44','H000001','1');
insert into doctor_schedule_data values ('DS000004','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100004','D000001','2018-04-06','P000001','D000001','20','92.24','ET000001','2019-04-28 09:23:36','2019-04-27 14:41:35','H000001','1');
insert into doctor_schedule_data values ('DS000005','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100005','D000001','2017-01-01','P000001','D000001','19','111.75','ET000001','2019-05-12 11:59:24','2019-04-25 17:00:15','H000001','1');
insert into doctor_schedule_data values ('DS000006','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100006','D000001','2017-10-24','P000001','D000001','17','103.14','ET000001','2019-04-26 13:29:06','2019-04-28 17:14:06','H000001','1');
insert into doctor_schedule_data values ('DS000007','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100007','D000002','2017-12-03','P000001','D000002','15','99.40','ET000002','2019-05-09 10:06:41','2019-04-27 07:06:08','H000001','1');
insert into doctor_schedule_data values ('DS000008','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100008','D000002','2018-04-07','P000001','D000002','16','98.40','ET000002','2019-05-05 12:57:49','2019-05-02 05:42:58','H000001','1');
insert into doctor_schedule_data values ('DS000009','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100009','D000002','2017-12-08','P000001','D000002','17','103.56','ET000002','2019-04-29 03:37:58','2019-05-11 15:18:13','H000001','1');
insert into doctor_schedule_data values ('DS000010','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100010','D000002','2018-10-08','P000001','D000002','16','93.32','ET000002','2019-05-04 00:40:55','2019-05-03 23:34:41','H000001','1');
insert into doctor_schedule_data values ('DS000011','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100011','D000002','2017-11-21','P000001','D000002','19','95.80','ET000002','2019-05-16 06:52:59','2019-05-05 18:51:02','H000001','1');
insert into doctor_schedule_data values ('DS000012','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100012','D000002','2016-07-04','P000001','D000002','15','122.69','ET000002','2019-05-14 16:10:16','2019-05-01 05:39:49','H000001','1');
insert into doctor_schedule_data values ('DS000013','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100013','D000003','2017-02-15','P000002','D000003','16','107.39','ET000003','2019-05-07 05:37:06','2019-05-08 15:13:42','H000001','1');
insert into doctor_schedule_data values ('DS000014','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100014','D000003','2018-09-14','P000002','D000003','16','99.28','ET000003','2019-04-30 08:49:51','2019-05-06 04:56:01','H000001','1');
insert into doctor_schedule_data values ('DS000015','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100015','D000003','2016-12-03','P000002','D000003','16','97.50','ET000003','2019-05-06 21:06:44','2019-05-11 12:45:29','H000001','1');
insert into doctor_schedule_data values ('DS000016','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100016','D000003','2016-12-04','P000002','D000003','18','105.62','ET000003','2019-04-26 13:18:20','2019-05-02 06:13:23','H000001','1');
insert into doctor_schedule_data values ('DS000017','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100017','D000003','2017-12-28','P000002','D000003','16','101.91','ET000003','2019-04-27 19:23:31','2019-04-27 19:39:50','H000001','1');
insert into doctor_schedule_data values ('DS000018','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100018','D000003','2016-09-08','P000002','D000003','15','87.45','ET000003','2019-05-01 04:35:01','2019-04-26 04:52:02','H000001','1');
insert into doctor_schedule_data values ('DS000019','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100019','D000004','2016-09-13','P000002','D000004','17','104.98','ET000004','2019-05-17 06:25:10','2019-04-29 11:59:14','H000001','1');
insert into doctor_schedule_data values ('DS000020','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100020','D000004','2018-05-10','P000002','D000004','16','108.66','ET000004','2019-04-26 11:23:58','2019-05-01 14:20:24','H000001','1');
insert into doctor_schedule_data values ('DS000021','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100021','D000004','2019-05-16','P000002','D000004','17','110.45','ET000004','2019-05-10 02:38:52','2019-05-04 16:04:04','H000001','1');
insert into doctor_schedule_data values ('DS000022','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100022','D000004','2018-11-16','P000002','D000004','18','118.82','ET000004','2019-05-14 15:11:14','2019-05-09 07:21:29','H000001','1');
insert into doctor_schedule_data values ('DS000023','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100023','D000004','2016-09-15','P000002','D000004','16','89.48','ET000004','2019-04-30 21:13:17','2019-05-04 19:15:38','H000001','1');
insert into doctor_schedule_data values ('DS000024','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100024','D000004','2016-12-23','P000002','D000004','16','102.26','ET000004','2019-05-15 03:33:18','2019-04-26 16:26:15','H000001','1');
insert into doctor_schedule_data values ('DS000025','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100025','D000005','2018-04-25','P000003','D000005','15','105.81','ET000005','2019-05-05 03:48:37','2019-04-30 00:48:34','H000001','1');
insert into doctor_schedule_data values ('DS000026','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100026','D000005','2018-07-15','P000003','D000005','18','88.75','ET000005','2019-04-29 23:06:49','2019-05-02 21:33:17','H000001','1');
insert into doctor_schedule_data values ('DS000027','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100027','D000005','2018-11-12','P000003','D000005','15','98.92','ET000005','2019-04-27 03:56:57','2019-04-26 07:44:34','H000001','1');
insert into doctor_schedule_data values ('DS000028','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100028','D000005','2018-04-01','P000003','D000005','17','120.01','ET000005','2019-05-06 11:43:24','2019-05-15 16:23:30','H000001','1');
insert into doctor_schedule_data values ('DS000029','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100029','D000005','2017-09-09','P000003','D000005','16','100.08','ET000005','2019-05-11 05:19:31','2019-05-08 01:48:20','H000001','1');
insert into doctor_schedule_data values ('DS000030','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100030','D000005','2019-03-20','P000003','D000005','15','96.35','ET000005','2019-05-03 08:58:04','2019-05-12 15:57:54','H000001','1');
insert into doctor_schedule_data values ('DS000031','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100031','D000006','2017-06-17','P000003','D000006','19','110.69','ET000006','2019-05-17 07:24:05','2019-04-26 06:37:27','H000001','1');
insert into doctor_schedule_data values ('DS000032','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100032','D000006','2019-03-30','P000003','D000006','16','120.21','ET000006','2019-05-01 16:09:52','2019-05-09 15:19:56','H000001','1');
insert into doctor_schedule_data values ('DS000033','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100033','D000006','2018-09-02','P000003','D000006','19','95.90','ET000006','2019-05-11 08:38:58','2019-05-10 13:14:16','H000001','1');
insert into doctor_schedule_data values ('DS000034','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100034','D000006','2016-12-17','P000003','D000006','18','87.17','ET000006','2019-05-04 03:25:26','2019-04-28 17:40:12','H000001','1');
insert into doctor_schedule_data values ('DS000035','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100035','D000006','2016-07-17','P000003','D000006','20','95.31','ET000006','2019-05-04 07:47:35','2019-05-01 17:16:42','H000001','1');
insert into doctor_schedule_data values ('DS000036','2019年3月11日魏松全在内分泌科坐班收诊疗费,每个100036','D000006','2018-09-17','P000003','D000006','17','92.74','ET000006','2019-04-29 18:04:32','2019-05-17 06:25:30','H000001','1');

	
insert into user_domain_data values ('UD000001','用户区域','1');

	
insert into user_white_list_data values ('UWL000001','clariones','tester;ios-spokesperson','UD000001','1');
insert into user_white_list_data values ('UWL000002','13808188512','tester;ios-spokesperson0002','UD000001','1');
insert into user_white_list_data values ('UWL000003','clariones','tester;ios-spokesperson0003','UD000001','1');
insert into user_white_list_data values ('UWL000004','13808188512','tester;ios-spokesperson0004','UD000001','1');
insert into user_white_list_data values ('UWL000005','clariones','tester;ios-spokesperson0005','UD000001','1');
insert into user_white_list_data values ('UWL000006','13808188512','tester;ios-spokesperson0006','UD000001','1');

	
insert into sec_user_data values ('SU000001','login','13900000001','','C183EC89F92A462CF45B95504792EC4625E847C90536EEFE512D1C9DB8602E95','0','2019-05-05 13:59:12','2019-05-12 12:53:00','UD000001',NULL,'BLOCKED','1');
insert into sec_user_data values ('SU000002','login0002','13900000002','suddy_chang@163.com','AC2F95628244C6975EB2C36942EA879ED93D93F5895EF3157733E4629FA86B92','9999999','2019-05-02 01:56:11','2019-05-08 06:13:22','UD000001',NULL,'BLOCKED0002','1');
insert into sec_user_data values ('SU000003','login0003','13900000003','','1A39AE05E011CF4B6ADE19307698831F4303CEB3FF5A9E21EEC0B21FB19B1050','0','2019-05-14 06:49:02','2019-04-28 14:35:48','UD000001',NULL,'BLOCKED0003','1');
insert into sec_user_data values ('SU000004','login0004','13900000004','suddy_chang@163.com','331D0B81C261072AB3E01D2D09A3D1F9B03F1E5F095D6BF7284F32BF85135D59','9999999','2019-05-02 17:52:21','2019-05-17 02:39:42','UD000001',NULL,'BLOCKED0004','1');
insert into sec_user_data values ('SU000005','login0005','13900000005','','CBDC109937F570CA1D5F223EC59F5368AF9380F9DBF7E553124132BB402ED457','0','2019-05-12 13:32:36','2019-05-03 18:38:49','UD000001',NULL,'BLOCKED0005','1');
insert into sec_user_data values ('SU000006','login0006','13900000006','suddy_chang@163.com','69A610F10CE3333E0767CAEEB075A88B6B63E286F8BEBB9271C3EA6DF0CB2F7B','9999999','2019-05-15 21:40:52','2019-04-29 05:11:20','UD000001',NULL,'BLOCKED0006','1');

	
insert into sec_user_blocking_data values ('SUB000001','currentUser()','2019-05-17 05:20:26','这个用户多次发送违反社区的帖子，现在把他给屏蔽了','1');

	
insert into user_app_data values ('UA000001','审车平台','SU000001','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app','1');
insert into user_app_data values ('UA000002','账户管理','SU000001','bank','T','MXWR','UserDomain','UD000001','/link/to/app0002','1');
insert into user_app_data values ('UA000003','接车公司','SU000001','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0003','1');
insert into user_app_data values ('UA000004','审车公司','SU000001','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0004','1');
insert into user_app_data values ('UA000005','维修公司','SU000001','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0005','1');
insert into user_app_data values ('UA000006','顾客','SU000001','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0006','1');
insert into user_app_data values ('UA000007','审车平台','SU000002','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app0007','1');
insert into user_app_data values ('UA000008','账户管理','SU000002','bank','T','MXWR','UserDomain','UD000001','/link/to/app0008','1');
insert into user_app_data values ('UA000009','接车公司','SU000002','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0009','1');
insert into user_app_data values ('UA000010','审车公司','SU000002','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0010','1');
insert into user_app_data values ('UA000011','维修公司','SU000002','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0011','1');
insert into user_app_data values ('UA000012','顾客','SU000002','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0012','1');
insert into user_app_data values ('UA000013','审车平台','SU000003','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app0013','1');
insert into user_app_data values ('UA000014','账户管理','SU000003','bank','T','MXWR','UserDomain','UD000001','/link/to/app0014','1');
insert into user_app_data values ('UA000015','接车公司','SU000003','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0015','1');
insert into user_app_data values ('UA000016','审车公司','SU000003','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0016','1');
insert into user_app_data values ('UA000017','维修公司','SU000003','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0017','1');
insert into user_app_data values ('UA000018','顾客','SU000003','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0018','1');
insert into user_app_data values ('UA000019','审车平台','SU000004','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app0019','1');
insert into user_app_data values ('UA000020','账户管理','SU000004','bank','T','MXWR','UserDomain','UD000001','/link/to/app0020','1');
insert into user_app_data values ('UA000021','接车公司','SU000004','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0021','1');
insert into user_app_data values ('UA000022','审车公司','SU000004','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0022','1');
insert into user_app_data values ('UA000023','维修公司','SU000004','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0023','1');
insert into user_app_data values ('UA000024','顾客','SU000004','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0024','1');
insert into user_app_data values ('UA000025','审车平台','SU000005','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app0025','1');
insert into user_app_data values ('UA000026','账户管理','SU000005','bank','T','MXWR','UserDomain','UD000001','/link/to/app0026','1');
insert into user_app_data values ('UA000027','接车公司','SU000005','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0027','1');
insert into user_app_data values ('UA000028','审车公司','SU000005','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0028','1');
insert into user_app_data values ('UA000029','维修公司','SU000005','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0029','1');
insert into user_app_data values ('UA000030','顾客','SU000005','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0030','1');
insert into user_app_data values ('UA000031','审车平台','SU000006','users','T','MXWR','CarInspectionPlatform','CIP000001','/link/to/app0031','1');
insert into user_app_data values ('UA000032','账户管理','SU000006','bank','T','MXWR','UserDomain','UD000001','/link/to/app0032','1');
insert into user_app_data values ('UA000033','接车公司','SU000006','wechat','T','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0033','1');
insert into user_app_data values ('UA000034','审车公司','SU000006','bar-chart','T','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0034','1');
insert into user_app_data values ('UA000035','维修公司','SU000006','user','T','MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0035','1');
insert into user_app_data values ('UA000036','顾客','SU000006','users','T','MXWR','CustomerInfo','CI000001','/link/to/app0036','1');

	
insert into list_access_data values ('LA000001','列表','levelOneCategoryList','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000002','列表0002','levelOneCategoryList0002','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000003','列表0003','levelOneCategoryList0003','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000004','列表0004','levelOneCategoryList0004','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000005','列表0005','levelOneCategoryList0005','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000006','列表0006','levelOneCategoryList0006','T','T','T','T','T','UA000001','1');
insert into list_access_data values ('LA000007','列表0007','levelOneCategoryList0007','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000008','列表0008','levelOneCategoryList0008','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000009','列表0009','levelOneCategoryList0009','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000010','列表0010','levelOneCategoryList0010','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000011','列表0011','levelOneCategoryList0011','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000012','列表0012','levelOneCategoryList0012','T','T','T','T','T','UA000002','1');
insert into list_access_data values ('LA000013','列表0013','levelOneCategoryList0013','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000014','列表0014','levelOneCategoryList0014','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000015','列表0015','levelOneCategoryList0015','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000016','列表0016','levelOneCategoryList0016','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000017','列表0017','levelOneCategoryList0017','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000018','列表0018','levelOneCategoryList0018','T','T','T','T','T','UA000003','1');
insert into list_access_data values ('LA000019','列表0019','levelOneCategoryList0019','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000020','列表0020','levelOneCategoryList0020','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000021','列表0021','levelOneCategoryList0021','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000022','列表0022','levelOneCategoryList0022','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000023','列表0023','levelOneCategoryList0023','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000024','列表0024','levelOneCategoryList0024','T','T','T','T','T','UA000004','1');
insert into list_access_data values ('LA000025','列表0025','levelOneCategoryList0025','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000026','列表0026','levelOneCategoryList0026','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000027','列表0027','levelOneCategoryList0027','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000028','列表0028','levelOneCategoryList0028','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000029','列表0029','levelOneCategoryList0029','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000030','列表0030','levelOneCategoryList0030','T','T','T','T','T','UA000005','1');
insert into list_access_data values ('LA000031','列表0031','levelOneCategoryList0031','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000032','列表0032','levelOneCategoryList0032','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000033','列表0033','levelOneCategoryList0033','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000034','列表0034','levelOneCategoryList0034','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000035','列表0035','levelOneCategoryList0035','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000036','列表0036','levelOneCategoryList0036','T','T','T','T','T','UA000006','1');
insert into list_access_data values ('LA000037','列表0037','levelOneCategoryList0037','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000038','列表0038','levelOneCategoryList0038','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000039','列表0039','levelOneCategoryList0039','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000040','列表0040','levelOneCategoryList0040','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000041','列表0041','levelOneCategoryList0041','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000042','列表0042','levelOneCategoryList0042','T','T','T','T','T','UA000007','1');
insert into list_access_data values ('LA000043','列表0043','levelOneCategoryList0043','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000044','列表0044','levelOneCategoryList0044','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000045','列表0045','levelOneCategoryList0045','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000046','列表0046','levelOneCategoryList0046','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000047','列表0047','levelOneCategoryList0047','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000048','列表0048','levelOneCategoryList0048','T','T','T','T','T','UA000008','1');
insert into list_access_data values ('LA000049','列表0049','levelOneCategoryList0049','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000050','列表0050','levelOneCategoryList0050','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000051','列表0051','levelOneCategoryList0051','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000052','列表0052','levelOneCategoryList0052','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000053','列表0053','levelOneCategoryList0053','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000054','列表0054','levelOneCategoryList0054','T','T','T','T','T','UA000009','1');
insert into list_access_data values ('LA000055','列表0055','levelOneCategoryList0055','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000056','列表0056','levelOneCategoryList0056','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000057','列表0057','levelOneCategoryList0057','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000058','列表0058','levelOneCategoryList0058','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000059','列表0059','levelOneCategoryList0059','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000060','列表0060','levelOneCategoryList0060','T','T','T','T','T','UA000010','1');
insert into list_access_data values ('LA000061','列表0061','levelOneCategoryList0061','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000062','列表0062','levelOneCategoryList0062','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000063','列表0063','levelOneCategoryList0063','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000064','列表0064','levelOneCategoryList0064','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000065','列表0065','levelOneCategoryList0065','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000066','列表0066','levelOneCategoryList0066','T','T','T','T','T','UA000011','1');
insert into list_access_data values ('LA000067','列表0067','levelOneCategoryList0067','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000068','列表0068','levelOneCategoryList0068','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000069','列表0069','levelOneCategoryList0069','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000070','列表0070','levelOneCategoryList0070','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000071','列表0071','levelOneCategoryList0071','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000072','列表0072','levelOneCategoryList0072','T','T','T','T','T','UA000012','1');
insert into list_access_data values ('LA000073','列表0073','levelOneCategoryList0073','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000074','列表0074','levelOneCategoryList0074','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000075','列表0075','levelOneCategoryList0075','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000076','列表0076','levelOneCategoryList0076','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000077','列表0077','levelOneCategoryList0077','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000078','列表0078','levelOneCategoryList0078','T','T','T','T','T','UA000013','1');
insert into list_access_data values ('LA000079','列表0079','levelOneCategoryList0079','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000080','列表0080','levelOneCategoryList0080','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000081','列表0081','levelOneCategoryList0081','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000082','列表0082','levelOneCategoryList0082','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000083','列表0083','levelOneCategoryList0083','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000084','列表0084','levelOneCategoryList0084','T','T','T','T','T','UA000014','1');
insert into list_access_data values ('LA000085','列表0085','levelOneCategoryList0085','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000086','列表0086','levelOneCategoryList0086','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000087','列表0087','levelOneCategoryList0087','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000088','列表0088','levelOneCategoryList0088','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000089','列表0089','levelOneCategoryList0089','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000090','列表0090','levelOneCategoryList0090','T','T','T','T','T','UA000015','1');
insert into list_access_data values ('LA000091','列表0091','levelOneCategoryList0091','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000092','列表0092','levelOneCategoryList0092','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000093','列表0093','levelOneCategoryList0093','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000094','列表0094','levelOneCategoryList0094','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000095','列表0095','levelOneCategoryList0095','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000096','列表0096','levelOneCategoryList0096','T','T','T','T','T','UA000016','1');
insert into list_access_data values ('LA000097','列表0097','levelOneCategoryList0097','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000098','列表0098','levelOneCategoryList0098','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000099','列表0099','levelOneCategoryList0099','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000100','列表0100','levelOneCategoryList0100','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000101','列表0101','levelOneCategoryList0101','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000102','列表0102','levelOneCategoryList0102','T','T','T','T','T','UA000017','1');
insert into list_access_data values ('LA000103','列表0103','levelOneCategoryList0103','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000104','列表0104','levelOneCategoryList0104','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000105','列表0105','levelOneCategoryList0105','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000106','列表0106','levelOneCategoryList0106','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000107','列表0107','levelOneCategoryList0107','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000108','列表0108','levelOneCategoryList0108','T','T','T','T','T','UA000018','1');
insert into list_access_data values ('LA000109','列表0109','levelOneCategoryList0109','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000110','列表0110','levelOneCategoryList0110','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000111','列表0111','levelOneCategoryList0111','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000112','列表0112','levelOneCategoryList0112','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000113','列表0113','levelOneCategoryList0113','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000114','列表0114','levelOneCategoryList0114','T','T','T','T','T','UA000019','1');
insert into list_access_data values ('LA000115','列表0115','levelOneCategoryList0115','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000116','列表0116','levelOneCategoryList0116','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000117','列表0117','levelOneCategoryList0117','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000118','列表0118','levelOneCategoryList0118','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000119','列表0119','levelOneCategoryList0119','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000120','列表0120','levelOneCategoryList0120','T','T','T','T','T','UA000020','1');
insert into list_access_data values ('LA000121','列表0121','levelOneCategoryList0121','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000122','列表0122','levelOneCategoryList0122','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000123','列表0123','levelOneCategoryList0123','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000124','列表0124','levelOneCategoryList0124','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000125','列表0125','levelOneCategoryList0125','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000126','列表0126','levelOneCategoryList0126','T','T','T','T','T','UA000021','1');
insert into list_access_data values ('LA000127','列表0127','levelOneCategoryList0127','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000128','列表0128','levelOneCategoryList0128','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000129','列表0129','levelOneCategoryList0129','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000130','列表0130','levelOneCategoryList0130','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000131','列表0131','levelOneCategoryList0131','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000132','列表0132','levelOneCategoryList0132','T','T','T','T','T','UA000022','1');
insert into list_access_data values ('LA000133','列表0133','levelOneCategoryList0133','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000134','列表0134','levelOneCategoryList0134','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000135','列表0135','levelOneCategoryList0135','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000136','列表0136','levelOneCategoryList0136','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000137','列表0137','levelOneCategoryList0137','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000138','列表0138','levelOneCategoryList0138','T','T','T','T','T','UA000023','1');
insert into list_access_data values ('LA000139','列表0139','levelOneCategoryList0139','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000140','列表0140','levelOneCategoryList0140','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000141','列表0141','levelOneCategoryList0141','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000142','列表0142','levelOneCategoryList0142','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000143','列表0143','levelOneCategoryList0143','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000144','列表0144','levelOneCategoryList0144','T','T','T','T','T','UA000024','1');
insert into list_access_data values ('LA000145','列表0145','levelOneCategoryList0145','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000146','列表0146','levelOneCategoryList0146','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000147','列表0147','levelOneCategoryList0147','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000148','列表0148','levelOneCategoryList0148','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000149','列表0149','levelOneCategoryList0149','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000150','列表0150','levelOneCategoryList0150','T','T','T','T','T','UA000025','1');
insert into list_access_data values ('LA000151','列表0151','levelOneCategoryList0151','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000152','列表0152','levelOneCategoryList0152','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000153','列表0153','levelOneCategoryList0153','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000154','列表0154','levelOneCategoryList0154','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000155','列表0155','levelOneCategoryList0155','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000156','列表0156','levelOneCategoryList0156','T','T','T','T','T','UA000026','1');
insert into list_access_data values ('LA000157','列表0157','levelOneCategoryList0157','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000158','列表0158','levelOneCategoryList0158','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000159','列表0159','levelOneCategoryList0159','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000160','列表0160','levelOneCategoryList0160','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000161','列表0161','levelOneCategoryList0161','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000162','列表0162','levelOneCategoryList0162','T','T','T','T','T','UA000027','1');
insert into list_access_data values ('LA000163','列表0163','levelOneCategoryList0163','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000164','列表0164','levelOneCategoryList0164','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000165','列表0165','levelOneCategoryList0165','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000166','列表0166','levelOneCategoryList0166','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000167','列表0167','levelOneCategoryList0167','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000168','列表0168','levelOneCategoryList0168','T','T','T','T','T','UA000028','1');
insert into list_access_data values ('LA000169','列表0169','levelOneCategoryList0169','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000170','列表0170','levelOneCategoryList0170','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000171','列表0171','levelOneCategoryList0171','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000172','列表0172','levelOneCategoryList0172','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000173','列表0173','levelOneCategoryList0173','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000174','列表0174','levelOneCategoryList0174','T','T','T','T','T','UA000029','1');
insert into list_access_data values ('LA000175','列表0175','levelOneCategoryList0175','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000176','列表0176','levelOneCategoryList0176','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000177','列表0177','levelOneCategoryList0177','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000178','列表0178','levelOneCategoryList0178','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000179','列表0179','levelOneCategoryList0179','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000180','列表0180','levelOneCategoryList0180','T','T','T','T','T','UA000030','1');
insert into list_access_data values ('LA000181','列表0181','levelOneCategoryList0181','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000182','列表0182','levelOneCategoryList0182','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000183','列表0183','levelOneCategoryList0183','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000184','列表0184','levelOneCategoryList0184','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000185','列表0185','levelOneCategoryList0185','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000186','列表0186','levelOneCategoryList0186','T','T','T','T','T','UA000031','1');
insert into list_access_data values ('LA000187','列表0187','levelOneCategoryList0187','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000188','列表0188','levelOneCategoryList0188','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000189','列表0189','levelOneCategoryList0189','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000190','列表0190','levelOneCategoryList0190','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000191','列表0191','levelOneCategoryList0191','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000192','列表0192','levelOneCategoryList0192','T','T','T','T','T','UA000032','1');
insert into list_access_data values ('LA000193','列表0193','levelOneCategoryList0193','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000194','列表0194','levelOneCategoryList0194','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000195','列表0195','levelOneCategoryList0195','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000196','列表0196','levelOneCategoryList0196','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000197','列表0197','levelOneCategoryList0197','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000198','列表0198','levelOneCategoryList0198','T','T','T','T','T','UA000033','1');
insert into list_access_data values ('LA000199','列表0199','levelOneCategoryList0199','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000200','列表0200','levelOneCategoryList0200','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000201','列表0201','levelOneCategoryList0201','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000202','列表0202','levelOneCategoryList0202','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000203','列表0203','levelOneCategoryList0203','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000204','列表0204','levelOneCategoryList0204','T','T','T','T','T','UA000034','1');
insert into list_access_data values ('LA000205','列表0205','levelOneCategoryList0205','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000206','列表0206','levelOneCategoryList0206','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000207','列表0207','levelOneCategoryList0207','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000208','列表0208','levelOneCategoryList0208','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000209','列表0209','levelOneCategoryList0209','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000210','列表0210','levelOneCategoryList0210','T','T','T','T','T','UA000035','1');
insert into list_access_data values ('LA000211','列表0211','levelOneCategoryList0211','T','T','T','T','T','UA000036','1');
insert into list_access_data values ('LA000212','列表0212','levelOneCategoryList0212','T','T','T','T','T','UA000036','1');
insert into list_access_data values ('LA000213','列表0213','levelOneCategoryList0213','T','T','T','T','T','UA000036','1');
insert into list_access_data values ('LA000214','列表0214','levelOneCategoryList0214','T','T','T','T','T','UA000036','1');
insert into list_access_data values ('LA000215','列表0215','levelOneCategoryList0215','T','T','T','T','T','UA000036','1');
insert into list_access_data values ('LA000216','列表0216','levelOneCategoryList0216','T','T','T','T','T','UA000036','1');

	
insert into object_access_data values ('OA000001','控制访问列表1','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000001','1');
insert into object_access_data values ('OA000002','控制访问列表10002','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000001','1');
insert into object_access_data values ('OA000003','控制访问列表10003','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000001','1');
insert into object_access_data values ('OA000004','控制访问列表10004','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000001','1');
insert into object_access_data values ('OA000005','控制访问列表10005','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000001','1');
insert into object_access_data values ('OA000006','控制访问列表10006','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000001','1');
insert into object_access_data values ('OA000007','控制访问列表10007','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000002','1');
insert into object_access_data values ('OA000008','控制访问列表10008','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000002','1');
insert into object_access_data values ('OA000009','控制访问列表10009','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000002','1');
insert into object_access_data values ('OA000010','控制访问列表10010','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000002','1');
insert into object_access_data values ('OA000011','控制访问列表10011','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000002','1');
insert into object_access_data values ('OA000012','控制访问列表10012','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000002','1');
insert into object_access_data values ('OA000013','控制访问列表10013','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000003','1');
insert into object_access_data values ('OA000014','控制访问列表10014','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000003','1');
insert into object_access_data values ('OA000015','控制访问列表10015','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000003','1');
insert into object_access_data values ('OA000016','控制访问列表10016','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000003','1');
insert into object_access_data values ('OA000017','控制访问列表10017','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000003','1');
insert into object_access_data values ('OA000018','控制访问列表10018','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000003','1');
insert into object_access_data values ('OA000019','控制访问列表10019','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000004','1');
insert into object_access_data values ('OA000020','控制访问列表10020','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000004','1');
insert into object_access_data values ('OA000021','控制访问列表10021','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000004','1');
insert into object_access_data values ('OA000022','控制访问列表10022','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000004','1');
insert into object_access_data values ('OA000023','控制访问列表10023','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000004','1');
insert into object_access_data values ('OA000024','控制访问列表10024','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000004','1');
insert into object_access_data values ('OA000025','控制访问列表10025','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000005','1');
insert into object_access_data values ('OA000026','控制访问列表10026','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000005','1');
insert into object_access_data values ('OA000027','控制访问列表10027','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000005','1');
insert into object_access_data values ('OA000028','控制访问列表10028','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000005','1');
insert into object_access_data values ('OA000029','控制访问列表10029','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000005','1');
insert into object_access_data values ('OA000030','控制访问列表10030','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000005','1');
insert into object_access_data values ('OA000031','控制访问列表10031','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000006','1');
insert into object_access_data values ('OA000032','控制访问列表10032','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000006','1');
insert into object_access_data values ('OA000033','控制访问列表10033','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000006','1');
insert into object_access_data values ('OA000034','控制访问列表10034','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000006','1');
insert into object_access_data values ('OA000035','控制访问列表10035','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000006','1');
insert into object_access_data values ('OA000036','控制访问列表10036','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000006','1');
insert into object_access_data values ('OA000037','控制访问列表10037','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000007','1');
insert into object_access_data values ('OA000038','控制访问列表10038','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000007','1');
insert into object_access_data values ('OA000039','控制访问列表10039','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000007','1');
insert into object_access_data values ('OA000040','控制访问列表10040','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000007','1');
insert into object_access_data values ('OA000041','控制访问列表10041','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000007','1');
insert into object_access_data values ('OA000042','控制访问列表10042','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000007','1');
insert into object_access_data values ('OA000043','控制访问列表10043','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000008','1');
insert into object_access_data values ('OA000044','控制访问列表10044','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000008','1');
insert into object_access_data values ('OA000045','控制访问列表10045','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000008','1');
insert into object_access_data values ('OA000046','控制访问列表10046','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000008','1');
insert into object_access_data values ('OA000047','控制访问列表10047','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000008','1');
insert into object_access_data values ('OA000048','控制访问列表10048','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000008','1');
insert into object_access_data values ('OA000049','控制访问列表10049','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000009','1');
insert into object_access_data values ('OA000050','控制访问列表10050','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000009','1');
insert into object_access_data values ('OA000051','控制访问列表10051','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000009','1');
insert into object_access_data values ('OA000052','控制访问列表10052','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000009','1');
insert into object_access_data values ('OA000053','控制访问列表10053','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000009','1');
insert into object_access_data values ('OA000054','控制访问列表10054','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000009','1');
insert into object_access_data values ('OA000055','控制访问列表10055','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000010','1');
insert into object_access_data values ('OA000056','控制访问列表10056','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000010','1');
insert into object_access_data values ('OA000057','控制访问列表10057','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000010','1');
insert into object_access_data values ('OA000058','控制访问列表10058','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000010','1');
insert into object_access_data values ('OA000059','控制访问列表10059','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000010','1');
insert into object_access_data values ('OA000060','控制访问列表10060','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000010','1');
insert into object_access_data values ('OA000061','控制访问列表10061','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000011','1');
insert into object_access_data values ('OA000062','控制访问列表10062','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000011','1');
insert into object_access_data values ('OA000063','控制访问列表10063','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000011','1');
insert into object_access_data values ('OA000064','控制访问列表10064','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000011','1');
insert into object_access_data values ('OA000065','控制访问列表10065','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000011','1');
insert into object_access_data values ('OA000066','控制访问列表10066','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000011','1');
insert into object_access_data values ('OA000067','控制访问列表10067','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000012','1');
insert into object_access_data values ('OA000068','控制访问列表10068','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000012','1');
insert into object_access_data values ('OA000069','控制访问列表10069','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000012','1');
insert into object_access_data values ('OA000070','控制访问列表10070','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000012','1');
insert into object_access_data values ('OA000071','控制访问列表10071','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000012','1');
insert into object_access_data values ('OA000072','控制访问列表10072','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000012','1');
insert into object_access_data values ('OA000073','控制访问列表10073','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000013','1');
insert into object_access_data values ('OA000074','控制访问列表10074','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000013','1');
insert into object_access_data values ('OA000075','控制访问列表10075','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000013','1');
insert into object_access_data values ('OA000076','控制访问列表10076','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000013','1');
insert into object_access_data values ('OA000077','控制访问列表10077','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000013','1');
insert into object_access_data values ('OA000078','控制访问列表10078','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000013','1');
insert into object_access_data values ('OA000079','控制访问列表10079','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000014','1');
insert into object_access_data values ('OA000080','控制访问列表10080','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000014','1');
insert into object_access_data values ('OA000081','控制访问列表10081','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000014','1');
insert into object_access_data values ('OA000082','控制访问列表10082','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000014','1');
insert into object_access_data values ('OA000083','控制访问列表10083','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000014','1');
insert into object_access_data values ('OA000084','控制访问列表10084','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000014','1');
insert into object_access_data values ('OA000085','控制访问列表10085','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000015','1');
insert into object_access_data values ('OA000086','控制访问列表10086','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000015','1');
insert into object_access_data values ('OA000087','控制访问列表10087','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000015','1');
insert into object_access_data values ('OA000088','控制访问列表10088','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000015','1');
insert into object_access_data values ('OA000089','控制访问列表10089','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000015','1');
insert into object_access_data values ('OA000090','控制访问列表10090','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000015','1');
insert into object_access_data values ('OA000091','控制访问列表10091','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000016','1');
insert into object_access_data values ('OA000092','控制访问列表10092','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000016','1');
insert into object_access_data values ('OA000093','控制访问列表10093','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000016','1');
insert into object_access_data values ('OA000094','控制访问列表10094','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000016','1');
insert into object_access_data values ('OA000095','控制访问列表10095','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000016','1');
insert into object_access_data values ('OA000096','控制访问列表10096','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000016','1');
insert into object_access_data values ('OA000097','控制访问列表10097','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000017','1');
insert into object_access_data values ('OA000098','控制访问列表10098','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000017','1');
insert into object_access_data values ('OA000099','控制访问列表10099','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000017','1');
insert into object_access_data values ('OA000100','控制访问列表10100','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000017','1');
insert into object_access_data values ('OA000101','控制访问列表10101','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000017','1');
insert into object_access_data values ('OA000102','控制访问列表10102','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000017','1');
insert into object_access_data values ('OA000103','控制访问列表10103','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000018','1');
insert into object_access_data values ('OA000104','控制访问列表10104','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000018','1');
insert into object_access_data values ('OA000105','控制访问列表10105','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000018','1');
insert into object_access_data values ('OA000106','控制访问列表10106','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000018','1');
insert into object_access_data values ('OA000107','控制访问列表10107','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000018','1');
insert into object_access_data values ('OA000108','控制访问列表10108','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000018','1');
insert into object_access_data values ('OA000109','控制访问列表10109','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000019','1');
insert into object_access_data values ('OA000110','控制访问列表10110','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000019','1');
insert into object_access_data values ('OA000111','控制访问列表10111','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000019','1');
insert into object_access_data values ('OA000112','控制访问列表10112','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000019','1');
insert into object_access_data values ('OA000113','控制访问列表10113','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000019','1');
insert into object_access_data values ('OA000114','控制访问列表10114','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000019','1');
insert into object_access_data values ('OA000115','控制访问列表10115','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000020','1');
insert into object_access_data values ('OA000116','控制访问列表10116','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000020','1');
insert into object_access_data values ('OA000117','控制访问列表10117','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000020','1');
insert into object_access_data values ('OA000118','控制访问列表10118','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000020','1');
insert into object_access_data values ('OA000119','控制访问列表10119','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000020','1');
insert into object_access_data values ('OA000120','控制访问列表10120','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000020','1');
insert into object_access_data values ('OA000121','控制访问列表10121','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000021','1');
insert into object_access_data values ('OA000122','控制访问列表10122','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000021','1');
insert into object_access_data values ('OA000123','控制访问列表10123','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000021','1');
insert into object_access_data values ('OA000124','控制访问列表10124','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000021','1');
insert into object_access_data values ('OA000125','控制访问列表10125','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000021','1');
insert into object_access_data values ('OA000126','控制访问列表10126','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000021','1');
insert into object_access_data values ('OA000127','控制访问列表10127','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000022','1');
insert into object_access_data values ('OA000128','控制访问列表10128','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000022','1');
insert into object_access_data values ('OA000129','控制访问列表10129','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000022','1');
insert into object_access_data values ('OA000130','控制访问列表10130','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000022','1');
insert into object_access_data values ('OA000131','控制访问列表10131','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000022','1');
insert into object_access_data values ('OA000132','控制访问列表10132','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000022','1');
insert into object_access_data values ('OA000133','控制访问列表10133','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000023','1');
insert into object_access_data values ('OA000134','控制访问列表10134','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000023','1');
insert into object_access_data values ('OA000135','控制访问列表10135','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000023','1');
insert into object_access_data values ('OA000136','控制访问列表10136','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000023','1');
insert into object_access_data values ('OA000137','控制访问列表10137','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000023','1');
insert into object_access_data values ('OA000138','控制访问列表10138','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000023','1');
insert into object_access_data values ('OA000139','控制访问列表10139','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000024','1');
insert into object_access_data values ('OA000140','控制访问列表10140','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000024','1');
insert into object_access_data values ('OA000141','控制访问列表10141','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000024','1');
insert into object_access_data values ('OA000142','控制访问列表10142','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000024','1');
insert into object_access_data values ('OA000143','控制访问列表10143','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000024','1');
insert into object_access_data values ('OA000144','控制访问列表10144','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000024','1');
insert into object_access_data values ('OA000145','控制访问列表10145','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000025','1');
insert into object_access_data values ('OA000146','控制访问列表10146','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000025','1');
insert into object_access_data values ('OA000147','控制访问列表10147','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000025','1');
insert into object_access_data values ('OA000148','控制访问列表10148','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000025','1');
insert into object_access_data values ('OA000149','控制访问列表10149','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000025','1');
insert into object_access_data values ('OA000150','控制访问列表10150','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000025','1');
insert into object_access_data values ('OA000151','控制访问列表10151','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000026','1');
insert into object_access_data values ('OA000152','控制访问列表10152','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000026','1');
insert into object_access_data values ('OA000153','控制访问列表10153','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000026','1');
insert into object_access_data values ('OA000154','控制访问列表10154','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000026','1');
insert into object_access_data values ('OA000155','控制访问列表10155','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000026','1');
insert into object_access_data values ('OA000156','控制访问列表10156','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000026','1');
insert into object_access_data values ('OA000157','控制访问列表10157','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000027','1');
insert into object_access_data values ('OA000158','控制访问列表10158','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000027','1');
insert into object_access_data values ('OA000159','控制访问列表10159','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000027','1');
insert into object_access_data values ('OA000160','控制访问列表10160','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000027','1');
insert into object_access_data values ('OA000161','控制访问列表10161','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000027','1');
insert into object_access_data values ('OA000162','控制访问列表10162','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000027','1');
insert into object_access_data values ('OA000163','控制访问列表10163','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000028','1');
insert into object_access_data values ('OA000164','控制访问列表10164','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000028','1');
insert into object_access_data values ('OA000165','控制访问列表10165','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000028','1');
insert into object_access_data values ('OA000166','控制访问列表10166','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000028','1');
insert into object_access_data values ('OA000167','控制访问列表10167','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000028','1');
insert into object_access_data values ('OA000168','控制访问列表10168','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000028','1');
insert into object_access_data values ('OA000169','控制访问列表10169','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000029','1');
insert into object_access_data values ('OA000170','控制访问列表10170','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000029','1');
insert into object_access_data values ('OA000171','控制访问列表10171','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000029','1');
insert into object_access_data values ('OA000172','控制访问列表10172','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000029','1');
insert into object_access_data values ('OA000173','控制访问列表10173','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000029','1');
insert into object_access_data values ('OA000174','控制访问列表10174','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000029','1');
insert into object_access_data values ('OA000175','控制访问列表10175','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000030','1');
insert into object_access_data values ('OA000176','控制访问列表10176','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000030','1');
insert into object_access_data values ('OA000177','控制访问列表10177','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000030','1');
insert into object_access_data values ('OA000178','控制访问列表10178','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000030','1');
insert into object_access_data values ('OA000179','控制访问列表10179','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000030','1');
insert into object_access_data values ('OA000180','控制访问列表10180','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000030','1');
insert into object_access_data values ('OA000181','控制访问列表10181','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000031','1');
insert into object_access_data values ('OA000182','控制访问列表10182','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000031','1');
insert into object_access_data values ('OA000183','控制访问列表10183','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000031','1');
insert into object_access_data values ('OA000184','控制访问列表10184','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000031','1');
insert into object_access_data values ('OA000185','控制访问列表10185','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000031','1');
insert into object_access_data values ('OA000186','控制访问列表10186','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000031','1');
insert into object_access_data values ('OA000187','控制访问列表10187','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000032','1');
insert into object_access_data values ('OA000188','控制访问列表10188','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000032','1');
insert into object_access_data values ('OA000189','控制访问列表10189','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000032','1');
insert into object_access_data values ('OA000190','控制访问列表10190','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000032','1');
insert into object_access_data values ('OA000191','控制访问列表10191','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000032','1');
insert into object_access_data values ('OA000192','控制访问列表10192','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000032','1');
insert into object_access_data values ('OA000193','控制访问列表10193','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000033','1');
insert into object_access_data values ('OA000194','控制访问列表10194','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000033','1');
insert into object_access_data values ('OA000195','控制访问列表10195','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000033','1');
insert into object_access_data values ('OA000196','控制访问列表10196','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000033','1');
insert into object_access_data values ('OA000197','控制访问列表10197','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000033','1');
insert into object_access_data values ('OA000198','控制访问列表10198','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000033','1');
insert into object_access_data values ('OA000199','控制访问列表10199','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000034','1');
insert into object_access_data values ('OA000200','控制访问列表10200','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000034','1');
insert into object_access_data values ('OA000201','控制访问列表10201','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000034','1');
insert into object_access_data values ('OA000202','控制访问列表10202','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000034','1');
insert into object_access_data values ('OA000203','控制访问列表10203','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000034','1');
insert into object_access_data values ('OA000204','控制访问列表10204','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000034','1');
insert into object_access_data values ('OA000205','控制访问列表10205','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000035','1');
insert into object_access_data values ('OA000206','控制访问列表10206','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000035','1');
insert into object_access_data values ('OA000207','控制访问列表10207','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000035','1');
insert into object_access_data values ('OA000208','控制访问列表10208','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000035','1');
insert into object_access_data values ('OA000209','控制访问列表10209','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000035','1');
insert into object_access_data values ('OA000210','控制访问列表10210','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000035','1');
insert into object_access_data values ('OA000211','控制访问列表10211','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000036','1');
insert into object_access_data values ('OA000212','控制访问列表10212','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000036','1');
insert into object_access_data values ('OA000213','控制访问列表10213','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000036','1');
insert into object_access_data values ('OA000214','控制访问列表10214','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000036','1');
insert into object_access_data values ('OA000215','控制访问列表10215','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000036','1');
insert into object_access_data values ('OA000216','控制访问列表10216','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000036','1');

	
insert into login_history_data values ('LH000001','2019-05-15 08:40:22','192.168.1.1','登陆成功','SU000001','1');
insert into login_history_data values ('LH000002','2019-05-13 13:38:28','192.168.1.2','登陆成功0002','SU000001','1');
insert into login_history_data values ('LH000003','2019-05-03 09:39:41','192.168.1.1','登陆成功0003','SU000001','1');
insert into login_history_data values ('LH000004','2019-05-07 01:57:54','192.168.1.2','登陆成功0004','SU000001','1');
insert into login_history_data values ('LH000005','2019-05-04 17:12:32','192.168.1.1','登陆成功0005','SU000001','1');
insert into login_history_data values ('LH000006','2019-05-13 13:11:50','192.168.1.2','登陆成功0006','SU000001','1');
insert into login_history_data values ('LH000007','2019-05-06 07:30:21','192.168.1.1','登陆成功0007','SU000002','1');
insert into login_history_data values ('LH000008','2019-05-08 17:22:03','192.168.1.2','登陆成功0008','SU000002','1');
insert into login_history_data values ('LH000009','2019-04-30 17:22:18','192.168.1.1','登陆成功0009','SU000002','1');
insert into login_history_data values ('LH000010','2019-05-03 01:14:25','192.168.1.2','登陆成功0010','SU000002','1');
insert into login_history_data values ('LH000011','2019-05-16 10:44:52','192.168.1.1','登陆成功0011','SU000002','1');
insert into login_history_data values ('LH000012','2019-05-06 03:32:15','192.168.1.2','登陆成功0012','SU000002','1');
insert into login_history_data values ('LH000013','2019-05-02 20:18:14','192.168.1.1','登陆成功0013','SU000003','1');
insert into login_history_data values ('LH000014','2019-05-10 16:40:23','192.168.1.2','登陆成功0014','SU000003','1');
insert into login_history_data values ('LH000015','2019-05-07 10:59:49','192.168.1.1','登陆成功0015','SU000003','1');
insert into login_history_data values ('LH000016','2019-05-09 20:37:44','192.168.1.2','登陆成功0016','SU000003','1');
insert into login_history_data values ('LH000017','2019-04-28 11:36:21','192.168.1.1','登陆成功0017','SU000003','1');
insert into login_history_data values ('LH000018','2019-05-05 18:45:29','192.168.1.2','登陆成功0018','SU000003','1');
insert into login_history_data values ('LH000019','2019-05-05 08:04:28','192.168.1.1','登陆成功0019','SU000004','1');
insert into login_history_data values ('LH000020','2019-04-29 14:05:12','192.168.1.2','登陆成功0020','SU000004','1');
insert into login_history_data values ('LH000021','2019-05-12 21:32:19','192.168.1.1','登陆成功0021','SU000004','1');
insert into login_history_data values ('LH000022','2019-05-14 10:40:06','192.168.1.2','登陆成功0022','SU000004','1');
insert into login_history_data values ('LH000023','2019-05-10 02:30:21','192.168.1.1','登陆成功0023','SU000004','1');
insert into login_history_data values ('LH000024','2019-05-14 01:16:47','192.168.1.2','登陆成功0024','SU000004','1');
insert into login_history_data values ('LH000025','2019-05-05 23:29:24','192.168.1.1','登陆成功0025','SU000005','1');
insert into login_history_data values ('LH000026','2019-05-07 03:31:08','192.168.1.2','登陆成功0026','SU000005','1');
insert into login_history_data values ('LH000027','2019-05-07 09:34:10','192.168.1.1','登陆成功0027','SU000005','1');
insert into login_history_data values ('LH000028','2019-05-13 22:40:15','192.168.1.2','登陆成功0028','SU000005','1');
insert into login_history_data values ('LH000029','2019-04-28 10:37:02','192.168.1.1','登陆成功0029','SU000005','1');
insert into login_history_data values ('LH000030','2019-05-15 19:56:05','192.168.1.2','登陆成功0030','SU000005','1');
insert into login_history_data values ('LH000031','2019-05-16 15:21:48','192.168.1.1','登陆成功0031','SU000006','1');
insert into login_history_data values ('LH000032','2019-05-05 22:11:14','192.168.1.2','登陆成功0032','SU000006','1');
insert into login_history_data values ('LH000033','2019-05-02 01:19:21','192.168.1.1','登陆成功0033','SU000006','1');
insert into login_history_data values ('LH000034','2019-05-12 03:06:54','192.168.1.2','登陆成功0034','SU000006','1');
insert into login_history_data values ('LH000035','2019-05-03 07:52:34','192.168.1.1','登陆成功0035','SU000006','1');
insert into login_history_data values ('LH000036','2019-05-01 08:13:30','192.168.1.2','登陆成功0036','SU000006','1');

	
insert into generic_form_data values ('GF000001','登记输入单','姓名就是你身份证上的名字','1');

	
insert into form_message_data values ('FM000001','字段组合错误','GF000001','success','1');
insert into form_message_data values ('FM000002','字段组合错误0002','GF000001','info','1');
insert into form_message_data values ('FM000003','字段组合错误0003','GF000001','warning','1');
insert into form_message_data values ('FM000004','字段组合错误0004','GF000001','danger','1');
insert into form_message_data values ('FM000005','字段组合错误0005','GF000001','success','1');
insert into form_message_data values ('FM000006','字段组合错误0006','GF000001','info','1');

	
insert into form_field_message_data values ('FFM000001','输入错误','name','GF000001','success','1');
insert into form_field_message_data values ('FFM000002','输入错误0002','name0002','GF000001','info','1');
insert into form_field_message_data values ('FFM000003','输入错误0003','name0003','GF000001','warning','1');
insert into form_field_message_data values ('FFM000004','输入错误0004','name0004','GF000001','danger','1');
insert into form_field_message_data values ('FFM000005','输入错误0005','name0005','GF000001','success','1');
insert into form_field_message_data values ('FFM000006','输入错误0006','name0006','GF000001','info','1');

	
insert into form_field_data values ('FF000001','姓名','name','name','text','GF000001','姓名就是你身份证上的名字','李一一','姓名就是你身份证上的名字','基础信息','maybe any value','a value expression','T','T','T','','','1');
insert into form_field_data values ('FF000002','年龄','age','name0002','longtext','GF000001','姓名就是你身份证上的名字0002','李一一0002','姓名就是你身份证上的名字0002','扩展信息','maybe any value0002','a value expression0002','T','T','T','','','1');
insert into form_field_data values ('FF000003','出生地','birth_place','name0003','date','GF000001','姓名就是你身份证上的名字0003','李一一0003','姓名就是你身份证上的名字0003','基础信息','maybe any value0003','a value expression0003','T','T','T','','','1');
insert into form_field_data values ('FF000004','国籍','country','name0004','date_time','GF000001','姓名就是你身份证上的名字0004','李一一0004','姓名就是你身份证上的名字0004','扩展信息','maybe any value0004','a value expression0004','T','T','T','男,女','男,女','1');
insert into form_field_data values ('FF000005','姓名','name','name0005','money','GF000001','姓名就是你身份证上的名字0005','李一一0005','姓名就是你身份证上的名字0005','基础信息','maybe any value0005','a value expression0005','T','T','T','高,矮','高,矮','1');
insert into form_field_data values ('FF000006','年龄','age','name0006','url','GF000001','姓名就是你身份证上的名字0006','李一一0006','姓名就是你身份证上的名字0006','扩展信息','maybe any value0006','a value expression0006','T','T','T','','','1');

	
insert into form_action_data values ('FA000001','功能','name','save','default','genericFormManager/name/name0002/name0003/','GF000001','1');
insert into form_action_data values ('FA000002','功能0002','name0002','update','warning','genericFormManager/name/name0002/name0003/0002','GF000001','1');
insert into form_action_data values ('FA000003','功能0003','name0003','remove','danger','genericFormManager/name/name0002/name0003/0003','GF000001','1');
insert into form_action_data values ('FA000004','功能0004','name0004','save','primary','genericFormManager/name/name0002/name0003/0004','GF000001','1');
insert into form_action_data values ('FA000005','功能0005','name0005','update','default','genericFormManager/name/name0002/name0003/0005','GF000001','1');
insert into form_action_data values ('FA000006','功能0006','name0006','remove','warning','genericFormManager/name/name0002/name0003/0006','GF000001','1');

-- GBASE 约束名 写到最后 和别家不太一样

create unique index idx_hospital_version on hospital_data(id, version);

create unique index idx_expense_type_version on expense_type_data(id, version);

alter table expense_type_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint expense_type4hospital_fk);
create unique index idx_period_version on period_data(id, version);

alter table period_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint period4hospital_fk);
create unique index idx_expense_item_version on expense_item_data(id, version);

alter table expense_item_data add constraint 
	(foreign key(expense_type) references expense_type_data(id) on delete cascade  constraint expense_item4expense_type_fk);
alter table expense_item_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint expense_item4hospital_fk);
create unique index idx_doctor_version on doctor_data(id, version);

alter table doctor_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint doctor4hospital_fk);
create unique index idx_department_version on department_data(id, version);

alter table department_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint department4hospital_fk);
create unique index idx_doctor_assignment_version on doctor_assignment_data(id, version);

alter table doctor_assignment_data add constraint 
	(foreign key(doctor) references doctor_data(id) on delete cascade  constraint doctor_assignment4doctor_fk);
alter table doctor_assignment_data add constraint 
	(foreign key(department) references department_data(id) on delete cascade  constraint doctor_assignment4department_fk);
create unique index idx_doctor_schedule_version on doctor_schedule_data(id, version);

alter table doctor_schedule_data add constraint 
	(foreign key(doctor) references doctor_data(id) on delete cascade  constraint doctor_schedule4doctor_fk);
alter table doctor_schedule_data add constraint 
	(foreign key(period) references period_data(id) on delete cascade  constraint doctor_schedule4period_fk);
alter table doctor_schedule_data add constraint 
	(foreign key(department) references department_data(id) on delete cascade  constraint doctor_schedule4department_fk);
alter table doctor_schedule_data add constraint 
	(foreign key(expense_type) references expense_type_data(id) on delete cascade  constraint doctor_schedule4expense_type_fk);
alter table doctor_schedule_data add constraint 
	(foreign key(hospital) references hospital_data(id) on delete cascade  constraint doctor_schedule4hospital_fk);
create unique index idx_user_domain_version on user_domain_data(id, version);

create unique index idx_user_white_list_version on user_white_list_data(id, version);

alter table user_white_list_data add constraint 
	(foreign key(domain) references user_domain_data(id) on delete cascade  constraint user_white_list4domain_fk);
create unique index idx_sec_user_version on sec_user_data(id, version);

alter table sec_user_data add constraint 
	(foreign key(domain) references user_domain_data(id) on delete cascade  constraint sec_user4domain_fk);
alter table sec_user_data add constraint 
	(foreign key(blocking) references sec_user_blocking_data(id) on delete cascade  constraint sec_user4blocking_fk);
create unique index idx_sec_user_blocking_version on sec_user_blocking_data(id, version);

create unique index idx_user_app_version on user_app_data(id, version);

alter table user_app_data add constraint 
	(foreign key(sec_user) references sec_user_data(id) on delete cascade  constraint user_app4sec_user_fk);
create unique index idx_list_access_version on list_access_data(id, version);

alter table list_access_data add constraint 
	(foreign key(app) references user_app_data(id) on delete cascade  constraint list_access4app_fk);
create unique index idx_object_access_version on object_access_data(id, version);

alter table object_access_data add constraint 
	(foreign key(app) references user_app_data(id) on delete cascade  constraint object_access4app_fk);
create unique index idx_login_history_version on login_history_data(id, version);

alter table login_history_data add constraint 
	(foreign key(sec_user) references sec_user_data(id) on delete cascade  constraint login_history4sec_user_fk);
create unique index idx_generic_form_version on generic_form_data(id, version);

create unique index idx_form_message_version on form_message_data(id, version);

alter table form_message_data add constraint 
	(foreign key(form) references generic_form_data(id) on delete cascade  constraint form_message4form_fk);
create unique index idx_form_field_message_version on form_field_message_data(id, version);

alter table form_field_message_data add constraint 
	(foreign key(form) references generic_form_data(id) on delete cascade  constraint form_field_message4form_fk);
create unique index idx_form_field_version on form_field_data(id, version);

alter table form_field_data add constraint 
	(foreign key(form) references generic_form_data(id) on delete cascade  constraint form_field4form_fk);
create unique index idx_form_action_version on form_action_data(id, version);

alter table form_action_data add constraint 
	(foreign key(form) references generic_form_data(id) on delete cascade  constraint form_action4form_fk);


create index hospital4version_idx on hospital_data(version);
create index expense_type4update_time_idx on expense_type_data(update_time);
create index expense_type4version_idx on expense_type_data(version);
create index period4version_idx on period_data(version);
create index expense_item4price_idx on expense_item_data(price);
create index expense_item4update_time_idx on expense_item_data(update_time);
create index expense_item4version_idx on expense_item_data(version);
create index doctor4update_time_idx on doctor_data(update_time);
create index doctor4version_idx on doctor_data(version);
create index department4update_time_idx on department_data(update_time);
create index department4version_idx on department_data(version);
create index doctor_assignment4update_time_idx on doctor_assignment_data(update_time);
create index doctor_assignment4version_idx on doctor_assignment_data(version);
create index doctor_schedule4schedule_date_idx on doctor_schedule_data(schedule_date);
create index doctor_schedule4available_idx on doctor_schedule_data(available);
create index doctor_schedule4price_idx on doctor_schedule_data(price);
create index doctor_schedule4create_time_idx on doctor_schedule_data(create_time);
create index doctor_schedule4update_time_idx on doctor_schedule_data(update_time);
create index doctor_schedule4version_idx on doctor_schedule_data(version);
create index user_domain4version_idx on user_domain_data(version);
create index user_white_list4version_idx on user_white_list_data(version);
create index sec_user4mobile_idx on sec_user_data(mobile);
create index sec_user4verification_code_idx on sec_user_data(verification_code);
create index sec_user4verification_code_expire_idx on sec_user_data(verification_code_expire);
create index sec_user4last_login_time_idx on sec_user_data(last_login_time);
create index sec_user4version_idx on sec_user_data(version);
create index sec_user_blocking4block_time_idx on sec_user_blocking_data(block_time);
create index sec_user_blocking4version_idx on sec_user_blocking_data(version);
create index user_app4object_id_idx on user_app_data(object_id);
create index user_app4version_idx on user_app_data(version);
create index list_access4version_idx on list_access_data(version);
create index object_access4version_idx on object_access_data(version);
create index login_history4login_time_idx on login_history_data(login_time);
create index login_history4version_idx on login_history_data(version);
create index generic_form4version_idx on generic_form_data(version);
create index form_message4version_idx on form_message_data(version);
create index form_field_message4version_idx on form_field_message_data(version);
create index form_field4version_idx on form_field_data(version);
create index form_action4version_idx on form_action_data(version);










delete from list_access_data ;
delete from object_access_data ;
delete from user_app_data ;
delete from login_history_data ;
delete from sec_user_data ;




insert into sec_user_data values('SU000001','User000001','13900000001','1000001@qq.com','258D9BB89BBC1F2A6CDDD3A4CB300E6CD9B83F3FC9984619DF1A59F6051F1F44','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000001','医院','SU000001','hospital','T','MXWR','Hospital','H000001','/link/to/app','1');
insert into user_app_data values('UA000002','My Account','SU000001','lock','T','MXWR','SecUser','SU000001','/link/to/app','1'); 
insert into sec_user_data values('SU000002','User000002','13900000002','1000002@qq.com','7FEABCC19D638787655F9FFC2C22755D5771184D85D000147D643D22F6617F7B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000003','费用类型','SU000002','pen','T','MXWR','ExpenseType','ET000001','/link/to/app','1');
insert into user_app_data values('UA000004','My Account','SU000002','lock','T','MXWR','SecUser','SU000002','/link/to/app','1'); 
insert into sec_user_data values('SU000003','User000003','13900000003','1000003@qq.com','8169C17063461B0B0CC210CE5EF682E9517A19170F7DCA3C76170229D765DE7A','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000005','医生','SU000003','address-book','T','MXWR','Doctor','D000001','/link/to/app','1');
insert into user_app_data values('UA000006','My Account','SU000003','lock','T','MXWR','SecUser','SU000003','/link/to/app','1'); 
insert into sec_user_data values('SU000004','User000004','13900000004','1000004@qq.com','025745F4A4EA0C11059911E40714470F323C42836B1137D66AD3F85210A725CF','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000007','部门','SU000004','address-book','T','MXWR','Department','D000001','/link/to/app','1');
insert into user_app_data values('UA000008','My Account','SU000004','lock','T','MXWR','SecUser','SU000004','/link/to/app','1'); 
insert into sec_user_data values('SU000005','User000005','13900000005','1000005@qq.com','F8D472FBE8716BFB66C0A9BC73208FE4C5971051D240D9AC3B5EBCEF05CD5FFA','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000009','用户域','SU000005','user','T','MXWR','UserDomain','UD000001','/link/to/app','1');
insert into user_app_data values('UA000010','My Account','SU000005','lock','T','MXWR','SecUser','SU000005','/link/to/app','1'); 
insert into sec_user_data values('SU000006','User000006','13900000006','1000006@qq.com','FEE10F101DD4B9D2C98FAA1A672821DF22B9FA662528ED5B885B60C0979E6530','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000011','安全用户','SU000006','user','T','MXWR','SecUser','SU000001','/link/to/app','1');
insert into user_app_data values('UA000012','My Account','SU000006','lock','T','MXWR','SecUser','SU000006','/link/to/app','1'); 
insert into sec_user_data values('SU000007','User000007','13900000007','1000007@qq.com','016B4A47737559D64FC1369AA4D8CFD0B47E11F4C6219E80946C0E47A4C1C74B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000013','用户应用程序','SU000007','user','T','MXWR','UserApp','UA000001','/link/to/app','1');
insert into user_app_data values('UA000014','My Account','SU000007','lock','T','MXWR','SecUser','SU000007','/link/to/app','1'); 




/*
| 角色        | 用户名           | 密码         |
| ------------- |:-------------:|:-------------------:|
|医院|13900000001|DoubleChain!y1|
|费用类型|13900000002|DoubleChain!y1|
|医生|13900000003|DoubleChain!y1|
|部门|13900000004|DoubleChain!y1|
|用户域|13900000005|DoubleChain!y1|
|安全用户|13900000006|DoubleChain!y1|
|用户应用程序|13900000007|DoubleChain!y1|


*/



/* start with data patch */
/* The sql file is not found from: /Users/Philip/githome/web-code-generator/sky/data-patch/his.sql */




