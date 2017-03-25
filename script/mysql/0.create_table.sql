drop table bf_people;
drop table bf_department;
drop table bf_department_rel;
drop table bf_role;
drop table bf_people_role_rel;
drop table bf_menu;
drop table bf_role_menu_rel;
drop table bf_document;
drop table bf_role_document_rel;

CREATE TABLE `bf_people` (
  `create_date` datetime NOT NULL,
  `create_by` varchar(32) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_by` varchar(32) NOT NULL,
  `id_bf_people` varchar(32) NOT NULL COMMENT '����',
  `code` varchar(32) NOT NULL COMMENT '�û�����',
  `name` varchar(32) DEFAULT NULL COMMENT '�û�����',
  `password` varchar(32) NOT NULL COMMENT '����',
  `id_bf_department` varchar(32) DEFAULT NULL COMMENT '��������',
  `status` varchar(1) NOT NULL COMMENT '��Ա״̬��0-��Ч��1-������2-������3-����ˣ�',
  `error_count` int(11) DEFAULT '0' COMMENT '����������',
  PRIMARY KEY (`id_bf_people`),
  UNIQUE KEY `id_bizfw_people_info_UNIQUE` (`id_bf_people`),
  UNIQUE KEY `peopleCode_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա��';

CREATE TABLE `bf_department` (
  `create_by` varchar(32) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(32) NOT NULL,
  `update_date` datetime NOT NULL,
  `id_bf_department` varchar(45) NOT NULL COMMENT '����',
  `code` varchar(32) DEFAULT NULL COMMENT '��������',
  `name` varchar(32) DEFAULT NULL COMMENT '������',
  `level` int(11) DEFAULT NULL COMMENT '�����ȼ���rootΪ0',
  `parent_dept_id` varchar(32) DEFAULT NULL COMMENT '������id',
  PRIMARY KEY (`id_bf_department`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

CREATE TABLE `bf_department_rel` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_department_rel` varchar(32) NOT NULL COMMENT '����',
  `id_parent_department` varchar(32) DEFAULT NULL COMMENT '����������',
  `id_child_department` varchar(32) DEFAULT NULL COMMENT '�ӻ�������',
  `parent_level` int(11) DEFAULT NULL COMMENT '�������ȼ�',
  PRIMARY KEY (`id_bf_department_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������ϵ��';

CREATE TABLE `bf_role` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_role` varchar(32) NOT NULL COMMENT '����',
  `name` varchar(32) DEFAULT NULL COMMENT '��ɫ��',
  `description` varchar(1024) DEFAULT NULL COMMENT '��ɫ����',
  PRIMARY KEY (`id_bf_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

CREATE TABLE `bf_people_role_rel` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_people_role_rel` varchar(32) NOT NULL COMMENT '����',
  `id_bf_people` varchar(32) DEFAULT NULL COMMENT '��Աid',
  `id_bf_role` varchar(32) DEFAULT NULL COMMENT '��ɫid',
  PRIMARY KEY (`id_bf_people_role_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա��ɫ������';

CREATE TABLE `bf_menu` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_menu` varchar(32) NOT NULL COMMENT '����',
  `name` varchar(128) DEFAULT NULL COMMENT '�˵���',
  `url` varchar(512) DEFAULT NULL COMMENT 'ҳ��·��url',
  `orders` varchar(8) DEFAULT NULL COMMENT '˳��',
  `parent_menu_id` varchar(32) DEFAULT NULL COMMENT '���˵�id',
  PRIMARY KEY (`id_bf_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�˵���';

CREATE TABLE `bf_role_menu_rel` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_role_menu_rel` varchar(32) NOT NULL COMMENT '����',
  `id_bf_role` varchar(32) DEFAULT NULL COMMENT '��ɫid',
  `id_bf_menu` varchar(32) DEFAULT NULL COMMENT '�˵�id',
  PRIMARY KEY (`id_bf_role_menu_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ�˵�������';

CREATE TABLE `bf_document` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_document` varchar(32) NOT NULL COMMENT '����',
  `name` varchar(128) DEFAULT NULL COMMENT '�ļ�����',
  `extension` varchar(16) DEFAULT NULL COMMENT '��չ��',
  `type` varchar(2) DEFAULT NULL COMMENT '���ͣ�1-�ļ��У�2-�ļ�',
  `path` varchar(1024) DEFAULT NULL COMMENT '·��',
  `url` varchar(1024) DEFAULT NULL COMMENT '�ļ��洢·��',
  `size` int(11) DEFAULT NULL COMMENT '�ļ���С',
  `memo` varchar(1024) DEFAULT NULL COMMENT '��ע',
  `owner_document_id` varchar(32) DEFAULT NULL COMMENT '�����ĵ�id',
  `revision` int(11) DEFAULT NULL COMMENT '�ļ��汾��',
  `download_count` int(11) DEFAULT NULL COMMENT '���ش���',
  `md5` varchar(32) DEFAULT NULL COMMENT '�ļ�md5ֵ',
  PRIMARY KEY (`id_bf_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ĵ���';

CREATE TABLE `bf_role_document_rel` (
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `id_bf_role_document_rel` varchar(32) NOT NULL COMMENT '����',
  `id_bf_role` varchar(32) DEFAULT NULL COMMENT '��ɫid',
  `id_bf_document` varchar(32) DEFAULT NULL COMMENT '�ĵ�id',
  `auth` varchar(4) DEFAULT 'r' COMMENT 'Ȩ�ޣ�r-����w-д',
  PRIMARY KEY (`id_bf_role_document_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ�ĵ���ϵ��';

CREATE TABLE `bf_document_opt_log` (
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `id_bf_document_opt_log` varchar(45) NOT NULL COMMENT '����',
  `operation` varchar(2) DEFAULT NULL COMMENT '�������ͣ�1-������2-�޸ģ�3-ɾ��',
  `target_type` varchar(2) DEFAULT NULL COMMENT '����Ŀ�����ͣ�0-�ļ��У�1-�ļ�',
  `target_id` varchar(32) DEFAULT NULL COMMENT '������������',
  `target_name` varchar(512) DEFAULT NULL COMMENT '����������',
  PRIMARY KEY (`id_bf_document_opt_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ĵ�������־��';

CREATE TABLE `bf_file_deleted` (
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `id_bf_file_deleted` varchar(32) NOT NULL COMMENT '����',
  `url` varchar(1024) DEFAULT NULL COMMENT '�ļ�·��',
  PRIMARY KEY (`id_bf_file_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɾ���ļ���';
