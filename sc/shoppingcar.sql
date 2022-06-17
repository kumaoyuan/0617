DROP DATABASE IF EXISTS shoppingcar;

CREATE DATABASE shoppingcar CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE shoppingcar;

#咖啡品項
CREATE TABLE coffee(
	product_id varchar(45) NOT NULL UNIQUE,
	product_name varchar(20) NOT NULL,
    product_aroma varchar(45),
    product_flavor varchar(45),
    img varchar(45),
    product_note varchar(100),
    product_price INTEGER,
    ipound INT,
    PRIMARY KEY (product_id)
);

INSERT INTO coffee VALUES('A01','巴拿馬藝伎','水果','水蜜桃、熱帶水果、巧克力','../assets/img/balama.png','世界冠軍品種，被稱作精品咖啡指標的巴拿馬藝伎，產量稀少珍貴，採用日曬處理、淺中焙度，口感乾淨明亮，聞得到花香、喝得到熱帶水果的甜韻。',1360,305);
INSERT INTO coffee VALUES('A02','三連霸-古吉罕貝拉','水果','花香、荔枝、可可、溫帶水果','../assets/img/three.png','選自冠軍產區古吉的優質生豆，與尋豆師合作獨家客製「厭氧發酵日曬處理」，透過延長發酵時間將香氣和甜味保留住，提升風味發展出卓越的甜味及平衡感。',630,506);
INSERT INTO coffee VALUES('A03','超級肯亞','水果','柑橘、黑醋栗、烏梅、蔗糖','../assets/img/super.png','超級肯亞被譽為非洲精品豆之王，酸感優於一般肯亞能感受到極明亮的酸質，帶有黑醋栗、烏梅風味。',520,604);
INSERT INTO coffee VALUES('A04','水果耶加雪菲 G1','水果','水果感、葡萄、藍莓','../assets/img/fruit.png','採用水洗處理法，過程中去除果皮與果肉並篩選掉不成熟的果實，與日曬法相比風味更清新香甜。',520,808);
INSERT INTO coffee VALUES('A05','印尼 林東之金','木質','青草、藥草系風味','../assets/img/inni.png','林東之金曼特寧具有辨識度極高且讓饕客著迷的青草、藥草系風味，極致厚醇，凸顯出曼特寧特有的濃郁感。',520,774);
INSERT INTO coffee VALUES('A06','百年冠軍莊園 巴拿馬','花香','莓果、龍眼、核果、可可','../assets/img/champion.png','嚴選於最佳巴拿馬（Best of Panama）獲獎無數的百年冠軍莊園咖啡豆，採用非洲棚日曬處理，帶有莓果、龍眼、核果、可可，Body厚實、甜感極佳。',660,203);
INSERT INTO coffee VALUES('A07','薩爾瓦多國寶豆種 PACAMARA','花香','花香．黑莓果．熟成柑橘甜','../assets/img/pacamara.png','由Pacas和Maragogipe混種培育而成，豆型碩大風味獨特，多次贏得CoE（Cup of Excellence）是為國際杯測賽中的常勝軍，花香濃烈，有著黑莓果明亮酸感，尾韻長帶有熟成柑橘的香甜。',570,75);
INSERT INTO coffee VALUES('B01','完美日曬耶加雪菲 G1','水果','果香、草莓、鳳梨、熱帶水果','../assets/img/perfect.png','咖啡果實經日曬後糖分轉化吸入咖啡豆中，能品嚐到濃郁奔放的果香、草莓、鳳梨等熱帶水果風味，尾韻甘甜醇厚。',500,35);
INSERT INTO coffee VALUES('B02','黃金曼特寧 G1-三次手選','木質','回甘明媚水果香氣','../assets/img/gold.png','選用G1特優級原生曼特寧，再經由人工篩選優質生豆，甘苦中散發天然水果香氣。',520,76);
INSERT INTO coffee VALUES('B03','水洗耶加雪菲 科契爾 G1','水果','檸檬・柑橘・甜度高','../assets/img/water.png','入口時細緻迷人的檸檬、茉莉花及野薑花香氣散發在口腔內，伴隨著柑橘般甘醇、酸甜的口感。',360,95);
INSERT INTO coffee VALUES('B04','肯亞 精選小農','水果','烏梅酒香・黑醋栗','../assets/img/kenya.png','細緻、乾淨、酸質明亮，入口後由酸轉甜，蔗糖甜味帶出肯亞特有的烏梅酒香與黑醋栗般的尾韻。',360,110);
INSERT INTO coffee VALUES('B05','曼特寧 迦佑山 G1','木質','草本香料・醇厚口感','../assets/img/mentening.png','嚴選迦佑產區Ｇ1高等級咖啡豆，散發獨特的大地藥草香及豐富的辛香料味，酸度低、口感厚實飽滿。',340,95);
INSERT INTO coffee VALUES('B06','哥倫比亞 薇拉','水果','葡萄柚・圓潤・甘甜','../assets/img/colombia.png','世界第三大咖啡生產國哥倫比亞，以柔順甘醇、香甜順口著稱，葡萄柚般的明亮果酸及細緻口感，交織出豐富多變的餘韻。',340,63);
INSERT INTO coffee VALUES('B07','曼巴','木質','核果香料・平衡沉穩','../assets/img/menba.png','巴西咖啡太妃糖般的滑順甘甜，完美平衡曼特寧的醇厚濃度，更凸顯曼特寧特有的草本香料風味，兩者融合的口感溫順甘美怡人。',340,98);
INSERT INTO coffee VALUES('B08','莊園老饕深焙','木質','黑巧克力・濃郁甘甜','../assets/img/deep.png','精選中南美洲高山種植的水洗阿拉比卡豆，香氣芳醇、口感豐厚沉穩，散發微微煙燻氣息。',340,62);

#會員資料表
CREATE TABLE customers(
	id varchar(45) NOT NULL unique,
    pwd varchar(45),
	username varchar(45) NOT NULL,
    tel varchar(45),
    addr varchar(100),
	email varchar(45),
    birth varchar(45),
    PRIMARY KEY (id)
);
INSERT INTO customers VALUES('123@gmail.com','1234','黃小雲','0912345678','桃園市中壢區中北路200號','123@gmail.com','2002/06/03');
INSERT INTO customers VALUES('456@gmail.com','5678','陳國慶','0912345679','桃園市中壢區大仁一街25號','456@gmail.com','2002/10/10');
INSERT INTO customers VALUES('789@gmail.com','3456','李小賀','0912345789','桃園市中壢區弘揚路5號','789@gmail.com','2020/05/20');
INSERT INTO customers VALUES('1102sc','1102','管理者',NULL,NULL,NULL,NULL);

#個人購物車
CREATE TABLE cart(
	id varchar(45) NOT NULL ,
	product_id varchar(45) NOT NULL ,
    product_number varchar(10),
    cartid INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (cartid)
);
INSERT INTO cart VALUES('123@gmail.com','A01','1',1);
INSERT INTO cart VALUES('123@gmail.com','A04','2',2);
INSERT INTO cart VALUES('456@gmail.com','B05','1',4);

#訂單資料表
CREATE TABLE orders(
  oid INT NOT NULL AUTO_INCREMENT,
  id varchar(45),
  product_id varchar(45),
  product_number varchar(10),
  receivername varchar(45),
  tel varchar(45),
  pay_way VARCHAR(45),
  email varchar(45),
  countyname varchar(45),
  addr varchar(100),
  note varchar(100),
  total INT,
  orders_number INT,
  PRIMARY KEY (oid)
);
INSERT INTO orders VALUES (1,'123@gmail.com','A01','1','黃小雲','0912345678','貨到付款','123@gmail.com','桃園市','中壢區中北路200號','送來的時候幫我附上名片，謝謝!',1360,123);


#留言板
CREATE TABLE `message`(
  `product_id` varchar(3),
  `id` VARCHAR(45) NOT NULL ,
  `username` VARCHAR(20),
  `msg_content` VARCHAR(100),
  `star_number` VARCHAR(200),
  `msg_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`msg_id`)
);

#瀏覽人數
CREATE TABLE `counter`(
  `count` int NOT NULL UNIQUE,
  PRIMARY KEY (`count`)
);

INSERT INTO `counter` VALUES (150);

#聯絡我們 意見反饋
CREATE TABLE `question`(
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `id` VARCHAR(45),
  `question_content` VARCHAR(100),
  PRIMARY KEY (`question_id`)
);







