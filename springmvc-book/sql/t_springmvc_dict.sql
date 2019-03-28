CREATE TABLE `t_springmvc_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_group` varchar(32) NOT NULL COMMENT '字典组',
  `dict_name` varchar(32) NOT NULL COMMENT '名称',
  `sort` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

