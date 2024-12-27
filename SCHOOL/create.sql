
CREATE TABLE school.school_dataset (
	school_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	school_name varchar(50) NOT NULL,
	CONSTRAINT school_dataset_pkey PRIMARY KEY (school_id)
);

CREATE TABLE student_dataset (
	"student_id" int4 GENERATED BY DEFAULT AS IDENTITY (MINVALUE 1 START WITH 1 INCREMENT BY 1) primary key ,
	"student_names" varchar(50) NULL,
	"phone_no." float8 NOT NULL,
	"math" int4 NOT NULL,
	"physics" int4 NOT NULL,
	"chemistry" int4 NOT NULL,
	"grade" varchar(50) NOT NULL,
	"comment" varchar(50) NOT NULL,
	"roll_no" float8 NOT NULL,
	"school_id" int4 NOT NULL,
	"student_address" varchar(500) NOT NULL
);