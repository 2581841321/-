DROP TABLE IF EXISTS t_springmvc_book;
CREATE TABLE IF NOT EXISTS t_springmvc_book(
  id int NOT NULL AUTO_INCREMENT,
  book_name VARCHAR(128) NOT NULL COMMENT '书名',
  author VARCHAR(128) NOT NULL COMMENT '作者',
  price DOUBLE(3, 2) NOT NULL COMMENT '价格',
  category int(1) COMMENT '书籍类别',
  publish_date date NOT NULL COMMENT '出版日期',
  create_time datetime NOT NULL COMMENT '创建时间',
  update_time TIMESTAMP NOT NULL COMMENT '更新时间',
  cover_path VARCHAR(256) DEFAULT NULL COMMENT '封面',
  PRIMARY KEY(id)
);

