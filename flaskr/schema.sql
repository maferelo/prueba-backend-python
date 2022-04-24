DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);


DROP TABLE IF EXISTS post;

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);


DROP TABLE IF EXISTS "product";

CREATE TABLE "product" (
  product_id INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" VARCHAR(191) NOT NULL,
  product_description VARCHAR(191) NOT NULL,
  price DOUBLE(10, 2) NOT NULL
);


DROP TABLE IF EXISTS "customer";

CREATE TABLE "customer" (
  customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" VARCHAR(191) NOT NULL,
  email VARCHAR(191) NOT NULL
);


DROP TABLE IF EXISTS "order";

CREATE TABLE "order" (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_id INTEGER NOT NULL,
  creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  delivery_address VARCHAR(191) NOT NULL,
  product_count INTEGER NOT NULL DEFAULT 0,
  "total" DOUBLE(15, 2) DEFAULT 0,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);


DROP TABLE IF EXISTS "order_detail";

CREATE TABLE "order_detail" (
  order_detail_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  product_description VARCHAR(191) NOT NULL,
  price DOUBLE(10, 2) NOT NULL,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (order_id) REFERENCES "order" (order_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

DROP TABLE IF EXISTS "customer_product";

CREATE TABLE "customer_product" (
  customer_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id),
  PRIMARY KEY (customer_id, product_id)
);

INSERT INTO product ("name",product_description,price)
	VALUES ('Product A','Description A',100);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product B','Description B',200);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product C','Description C',300);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product D','Description D',400);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product E','Description E',500);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product F','Description F',600);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product G','Description G',700);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product H','Description H',800);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product I','Description I',900);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product J','Description J',1000);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product K','Description K',1100);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product L','Description L',1200);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product M','Description M',1300);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product N','Description N',1400);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product O','Description O',1500);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product P','Description P',1600);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product Q','Description Q',1700);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product R','Description R',1800);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product S','Description S',1900);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product T','Description T',2000);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product U','Description U',2100);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product V','Description V',2200);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product W','Description W',2300);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product X','Description X',2400);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product Y','Description Y',2500);
INSERT INTO product ("name",product_description,price)
	VALUES ('Product Z','Description Z',2600);
	
INSERT INTO customer ("name",email)
	VALUES ('Customer A','a@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer B','b@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer C','c@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer D','d@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer E','e@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer F','f@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer G','g@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer H','h@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer I','i@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer J','j@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer K','k@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer L','l@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer M','m@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer N','n@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer O','o@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer P','p@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer Q','q@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer R','r@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer S','s@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer T','t@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer U','u@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer V','v@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer W','w@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer X','x@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer Y','y@gmail.com');
INSERT INTO customer ("name",email)
	VALUES ('Customer Z','z@gmail.com');

INSERT INTO customer_product (customer_id,product_id)
	VALUES (1, 4);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (1, 7);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (1, 15);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (1, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (1, 12);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (2, 18);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (2, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (2, 4);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (2, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (2, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (3, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (3, 19);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (3, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (3, 21);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (3, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (4, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (4, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (4, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (4, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (4, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (5, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (5, 21);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (5, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (5, 7);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (5, 18);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (6, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (6, 8);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (6, 1);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (6, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (6, 23);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (7, 24);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (7, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (7, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (7, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (7, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (8, 9);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (8, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (8, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (8, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (8, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (9, 19);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (9, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (9, 23);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (9, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (9, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (10, 3);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (10, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (10, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (10, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (10, 8);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (11, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (11, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (11, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (11, 1);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (11, 25);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (12, 15);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (12, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (12, 6);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (12, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (12, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (13, 21);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (13, 15);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (13, 12);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (13, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (13, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (14, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (14, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (14, 19);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (14, 3);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (14, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (15, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (15, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (15, 25);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (15, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (15, 3);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (16, 24);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (16, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (16, 25);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (16, 7);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (16, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (17, 18);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (17, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (17, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (17, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (17, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (18, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (18, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (18, 19);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (18, 8);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (18, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (19, 1);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (19, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (19, 24);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (19, 6);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (19, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (20, 17);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (20, 19);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (20, 9);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (20, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (20, 3);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (21, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (21, 9);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (21, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (21, 25);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (21, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (22, 13);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (22, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (22, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (22, 6);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (22, 21);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (23, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (23, 8);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (23, 10);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (23, 24);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (23, 11);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (24, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (24, 16);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (24, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (24, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (24, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (25, 23);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (25, 3);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (25, 22);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (25, 5);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (25, 26);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (26, 12);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (26, 14);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (26, 2);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (26, 20);
INSERT INTO customer_product (customer_id,product_id)
	VALUES (26, 15);

