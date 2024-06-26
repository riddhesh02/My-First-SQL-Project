CREATE DATABASE social_media;
USE social_media;

CREATE TABLE users (
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);
ALTER TABLE users ADD email VARCHAR(30) NOT NULL; 

CREATE TABLE login (
  login_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
); 

CREATE TABLE photos (
    photo_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    size FLOAT CHECK (size<5)
);

CREATE TABLE post (
	post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    photo_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id)
);

CREATE TABLE comments (
    comment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO users(username, profile_photo_url, bio,email) VALUES 
("kanavphull","https://pbs.twimg.com/profile_images/1386885117428191232/70SyHOxP_400x400.jpg","Hedonist yet Spiritual || IT at NITJ 2024",'as1mobiles@gmail.com'),
('raj gupta' , '/klsadf893724:f//432' , 'soon to be updated','admin@1shopbuy.com'),
('Sahib Singh' , 'https://pbs.twimg.com/profile_images/1465003815820693506/gbTJoe66_400x400.jpg' ,"Life is a journey, It drives you MAD.|| IT NITJ'24",'12angeldesignworld@gmail.com'),
('Sakshi Warandani' , "https://vader.news/__export/1612817390103/sites/gadgets/img/2021/02/08/ian_somerhalder_vampires.jpg_246448593.jpg" , "NITJ wish me on 23 jan",'deepak@24sevenindia.com'),
("Omnicron Larson", "/sdfvsdf", "Heart Stealer",'101cartinfo@gmail.com'),
("dettol sharma", "/sdfvsdf", "Dettol Stealer",'the.yellow.gold@gmail.com'),
('sunil' , '/yisadf324//' , 'hotel manageemnt ','deepak@24sevenindia.com'),
('sanjay' , '/fduiahj43' , 'football lover','deepak@24sevenindia.com' ),
('Axel Sivert Anker' , '/adaskjnas','Norwegian','gazender.686@gmail.com'),
('Steven','/acdsccsdc', 'living life my way','sravi07@yahoo.com'),
('Jack','https://picsum.photos/100','𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐌𝐲 𝐏𝐫𝐨𝐟𝐢𝐥𝐞','contact@21fools.com'),
('Oliver','https://picsum.photos/101','𝐎𝐟𝐟𝐢𝐜𝐢𝐚𝐥 𝐀𝐜𝐜𝐨𝐮𝐧𝐭','the.yellow.gold@gmail.com'),
('James','https://picsum.photos/102','𝐖𝐢𝐬𝐡 𝐌𝐞 𝐎𝐧 𝟑 𝐎𝐜𝐭𝐨𝐛𝐞𝐫','contact@21fools.com'),
('Charlie','https://picsum.photos/103','aap yha aae kisliye','sravi07@yahoo.com'),
('Harris','https://picsum.photos/104','𝐒𝐚𝐧𝐬𝐤𝐚𝐫𝐢 𝐋𝐚𝐝𝐤𝐚','pawan.modi1@gmail.com'),
('Lewis','https://picsum.photos/105','aapne bulaya isilye','as1mobiles@gmail.com'),
('Leo','https://picsum.photos/106','𝐆𝐲𝐦 𝐋ø𝐯è𝐫','pawan.modi1@gmail.com'),
('Noah','https://picsum.photos/107','aae hai toh kaam bi btiye','sunglasses.24@gmail.com'),
('Alfie','https://picsum.photos/108','𝐒𝐢𝐧𝐠𝐥𝐞','deepak@24sevenindia.com'),
('Rory','https://picsum.photos/109','phle zara aap muskurae','pawan.modi1@gmail.com'),
('Alexander','https://picsum.photos/110','𝐑𝐞𝐬𝐩𝐞𝐜𝐭 𝐅𝐨𝐫 𝐀𝐥𝐥','umesh.agarwal@24x7safebuy.com'),
('Max','https://picsum.photos/111','𝐈𝐧𝐬𝐭𝐚𝐠𝐫𝐚𝐦 𝐊𝐢𝐧𝐠','as1mobiles@gmail.com'),
('Logan','https://picsum.photos/112','𝐂𝐚𝐤𝐞 𝐌𝐮𝐫𝐝𝐞𝐫 𝐎𝐧 𝟏𝟕 𝐉𝐮𝐧𝐞','101cartinfo@gmail.com'),
('Harry','https://picsum.photos/113','hhddsgb','shyamsunder121@gmail.com'),
('Theo','https://picsum.photos/114','♥️𝐏𝐡𝐨𝐭𝐨𝐠𝐫𝐚𝐩𝐡𝐲 ','info@3coinsplus.com'),
('Thomas','https://picsum.photos/115','siudgfibsiugs','wasif1@2dayenterprises.com'),
('Brodie','https://picsum.photos/116','𝐌𝐮𝐬𝐢𝐜 𝐀𝐝𝐝𝐢𝐜𝐭','shyamsunder121@gmail.com'),
('Archie','https://picsum.photos/117','uhiusgfufiusf','wasif1@2dayenterprises.com'),
('Jacob','https://picsum.photos/118',' 𝐒𝐢𝐧𝐠𝐥𝐞 ','mail@3gmobileworld.in'),
('Finlay','https://picsum.photos/119','usdsgbcu','mail@3gmobileworld.in'),
('Finn','https://picsum.photos/120','𝐏𝐫𝐨𝐮𝐝 𝐓𝐨 𝐁𝐞 𝐇𝐢𝐧𝐝𝐮','pawan.modi1@gmail.com'),
('Daniel','https://picsum.photos/121','hucussgcusn','shyamsunder121@gmail.com'),
('Joshua','https://picsum.photos/122','𝐁𝐢𝐠 𝐅𝐚𝐧 𝐎𝐟 𝐌𝐚𝐡𝐚𝐤𝐚𝐥','sunglasses.24@gmail.com'),
('Oscar','https://picsum.photos/123','𝐌𝐫.𝐩𝐞𝐫𝐟𝐞𝐜𝐭','gazender.686@gmail.com'),
('Arthur','https://picsum.photos/124','𝐇𝐚𝐭𝐞 𝐦𝐞 𝐨𝐫 𝐃𝐚𝐭𝐞 𝐦𝐞','.'),
('Hunter','https://picsum.photos/125','𝐩𝐡𝐨𝐭𝐨𝐡𝐨𝐥𝐢𝐤','mail@3gmobileworld.in'),
('Ethan','https://picsum.photos/126','gygyuuy','deepak@24sevenindia.com'),
('Mason','https://picsum.photos/127',' 𝐟𝐨𝐨𝐝𝐲 ','sunglasses.24@gmail.com'),
('Harrison','https://picsum.photos/128','gfytfvy','contact@21fools.com'),
('Freddie','https://picsum.photos/129','𝐬𝐢𝐧𝐠𝐥𝐞','contact@21fools.com'),
('Ollie','https://picsum.photos/130','fytfysguf','mail@3gmobileworld.in'),
('Adam','https://picsum.photos/131','𝐔 𝐰𝐢𝐥𝐥 𝐟𝐢𝐧𝐝 𝐚 𝐛𝐨𝐲 𝐛𝐞𝐭𝐭𝐞𝐫 𝐭𝐡𝐚𝐧 𝐦𝐞 𝐛𝐮𝐭 𝐔 𝐝𝐨𝐧’𝐭 𝐟𝐢𝐧𝐝 𝐛𝐨𝐲 𝐥𝐢𝐤𝐞 𝐦𝐞','sravi07@yahoo.com'),
('William','https://picsum.photos/132','fyasu','admin@1shopbuy.com'),
('Jaxon','https://picsum.photos/133','𝙊𝙛𝙛𝙞𝙘𝙞𝙖𝙡 𝙖𝙘𝙘𝙤𝙪𝙣𝙩','info@3coinsplus.com'),
('Aaron','https://picsum.photos/134','ytyftftyi','gazender.686@gmail.com'),
('Cameron','https://picsum.photos/135','uygdghfios','shyamsunder121@gmail.com'),
('Liam','https://picsum.photos/136','ygyugdysgc','wasif1@2dayenterprises.com'),
('George','https://picsum.photos/137','𝙈𝙪𝙨𝙞𝙘 𝙡𝙤𝙫𝙚𝙧','as1mobiles@gmail.com'),
('Jamie','https://picsum.photos/138','ygsgsogt','pawan.modi1@gmail.com'),
('Callum','https://picsum.photos/139','𝙎𝙥𝙤𝙧𝙩𝙨 𝙡𝙤𝙫𝙚𝙧','mail@3gmobileworld.in');

INSERT INTO LOGIN(user_id , ip) VALUES
(19,'186.83.147.14'),(43,'95.43.246.66'),(34,'105.238.37.204'),(36,'13.120.97.136'),
(36,'0.83.214.172'),(34,'20.182.93.222'),(11,'200.237.53.32'),(28,'41.81.231.81'),
(25,'24.223.2.33'),(43,'8.168.37.68'),(24,'129.91.145.75'),(15,'242.220.82.190'),
(6,'107.137.170.154'),(10,'206.40.219.225'),(2,'136.186.80.29'),(13,'234.153.100.73'),
(43,'137.168.133.16'),(43,'248.119.108.48'),(46,'92.178.211.66'),(17,'25.177.94.84'),
(22,'40.165.240.121'),(38,'14.217.104.111'),(26,'17.82.20.179'),(31,'183.67.159.170'),
(36,'211.7.231.108'),(41,'20.81.221.177'),(2,'235.195.9.138'),(15,'206.230.99.108'),
(38,'196.138.60.144'),(6,'103.52.7.34'),(34,'232.209.180.248'),(15,'109.26.198.247'),
(45,'76.38.160.92'),(47,'239.166.182.14'),(40,'225.130.239.107'),(46,'250.158.54.36'),
(10,'173.160.71.20'),(38,'200.10.166.141'),(15,'195.136.72.29'),(42,'58.64.148.8'),
(38,'245.136.26.79'),(5,'16.152.146.172'),(36,'56.127.227.250'),(25,'136.191.250.64'),
(33,'247.63.28.170'),(47,'77.112.183.186'),(26,'147.228.253.137'),(33,'3.70.234.168'),
(24,'213.98.160.235'),(45,'224.112.90.6'),(39,'163.233.26.24'),(9,'128.79.68.115'),
(20,'0.36.210.165'),(13,'138.32.95.212'),(22,'233.203.24.116'),(22,'45.87.104.147'),
(2,'178.217.157.41'),(42,'6.29.50.100'),(11,'99.177.102.209'),(25,'242.87.45.152'),
(12,'187.170.52.130'),(43,'112.10.139.193'),(43,'73.147.94.38'),(50,'157.45.4.120'),
(33,'176.2.26.232'),(14,'103.225.38.110'),(38,'81.42.205.37'),(26,'200.166.27.162'),
(8,'131.236.23.35'),(43,'107.163.201.212'),(46,'211.68.48.44'),(34,'159.155.216.188'),
(2,'236.127.210.188'),(22,'238.190.151.98'),(46,'145.80.84.206'),(45,'203.188.132.95'),
(28,'184.58.66.29'),(12,'86.104.134.78'),(47,'94.45.198.183'),(48,'50.222.193.184'),
(49,'43.49.49.88'),(24,'219.166.183.216'),(33,'15.21.216.21'),(20,'177.150.57.124'),
(34,'150.19.152.19'),(49,'112.226.244.101'),(9,'108.216.168.190'),(48,'66.76.200.102'),
(30,'23.225.200.35'),(50,'24.57.93.90'),(13,'65.104.238.185'),(18,'208.4.103.252'),
(26,'185.28.144.176'),(7,'116.215.67.178'),(41,'142.210.152.194'),(49,'194.198.76.27'),
(48,'155.148.13.228'),(35,'101.225.93.143'); 

INSERT INTO photos(photo_url, post_id, size) VALUE 
('https://picsum.photos/100', 26, 4),
('https://picsum.photos/101', 27, 1),
('https://picsum.photos/102', 28, 2),
('https://picsum.photos/103', 29, 1),
('https://picsum.photos/104', 30, 2),
('https://picsum.photos/105', 31, 3),
('https://picsum.photos/106', 32, 4),
('https://picsum.photos/107', 33, 4),
('https://picsum.photos/108', 34, 2),
('https://picsum.photos/109', 35, 2),
('https://picsum.photos/110', 36, 2),
('https://picsum.photos/111', 37, 2),
('https://picsum.photos/112', 38, 2),
('https://picsum.photos/113', 39, 2),
('https://picsum.photos/114', 40, 4),
('https://picsum.photos/115', 41, 4),
('https://picsum.photos/116', 42, 3),
('https://picsum.photos/117', 43, 3),
('https://picsum.photos/118', 44, 3),
('https://picsum.photos/119', 45, 1),
('https://picsum.photos/120', 46, 2),
('https://picsum.photos/121', 47, 3),
('https://picsum.photos/122', 48, 2),
('https://picsum.photos/123', 49, 3),
('https://picsum.photos/124', 50, 2),
('https://picsum.photos/125', 76, 3),
('https://picsum.photos/126', 77, 4),
('https://picsum.photos/127', 78, 3),
('https://picsum.photos/128', 79, 1),
('https://picsum.photos/129', 80, 4),
('https://picsum.photos/130', 81, 3),
('https://picsum.photos/131', 82, 3),
('https://picsum.photos/132', 83, 1),
('https://picsum.photos/133', 84, 1),
('https://picsum.photos/134', 85, 4),
('https://picsum.photos/135', 86, 4),
('https://picsum.photos/136', 87, 1),
('https://picsum.photos/137', 88, 4),
('https://picsum.photos/138', 89, 1),
('https://picsum.photos/139', 90, 3),
('https://picsum.photos/140', 91, 3),
('https://picsum.photos/141', 92, 2),
('https://picsum.photos/142', 93, 2),
('https://picsum.photos/143', 94, 2),
('https://picsum.photos/144', 95, 3),
('https://picsum.photos/145', 96, 1),
('https://picsum.photos/146', 97, 2),
('https://picsum.photos/147', 98, 3),
('https://picsum.photos/148', 99, 3),
('https://picsum.photos/149', 100, 2);

insert into post (post_id,photo_id,user_id,caption,location) values
(1,15,3,'HEY!!','VHA JHA KOI AATA JAATA NI'),
(2,21,47,'Live a good story.','The Red Fort, Delhi.'),
(3,45,6,'Escape the ordinary.','The Taj Mahal, Agra.'),
(4,7,37,'The best is yet to come.','Pangong Lake, Ladakh.'),
(5,4,22,'These are days we live for.','Valley of Flowers, Nainital.'),
(6,37,18,'Life happens, coffee helps.','Jaisalmer Fort, Jaisalmer.'),
(7,11,12,'Short sassy cute & classy.','Ruins of Hampi, Karnataka.'),
(8,50,30,'The future is bright.','Ghats at Varanasi, Uttar Pradesh.'),
(9,15,31,'Namastay in bed.','Backwaters, Kerala.'),
(10,10,44,'I have more issues than vogue.','abhayapuri'),
(11,8,32,'Life is short. Smile while you still have teeth.','achabbal'),
(12,9,25,'Ah, a perfectly captured selfie!','achalpur'),
(13,4,13,'Let’s just be who we are.','achhnera'),
(14,36,12,'One bad chapter doesn’t me','adari'),
(15,45,40,'Cinderella never asked for a prince.','adalaj'),
(16,39,17,'A selfie is worth a thousand words.','adilabad'),
(17,7,31,'Born to stand out with selfies.','adityana'),
(18,17,27,'I’m sorry I exist, here, a selfie.','pereyaapatna'),
(19,49,48,'….','adoni'),
(20,44,30,'dfgfsggf','adoor'),
(21,18,8,'4545','adyar'),
(22,47,7,'007@','adra'),
(23,40,32,',,,,','afzalpura'),
(24,45,24,'…..','agartala'),
(25,31,27,';;;@','agra'),
(26,39,11,'.','ahiwara'),
(27,38,7,'…','ahmedabad'),
(28,38,14,'….....','ahmedgarh'),
(29,41,35,'…..','ahmednagar'),
(30,1,9,'.///','ahmedpur'),
(31,39,14,'???/','aizawl'),
(32,42,3,'//""//','ajmer'),
(33,17,45,'Selfie on fleek.','ajra'),
(34,2,15,'This is how to become a heart breaker.','akaltara'),
(35,2,20,'No guts, no story.','akathiyoor'),
(36,24,33,'The selfie is the worst judge of beauty.','akhnoor'),
(37,7,15,'Nobody’s perfect…but I’m close.','akkalkot'),
(38,46,1,'Does this selfie make me look fat?','akola'),
(39,25,25,'Rate this selfie from 1-10.','akot'),
(40,49,6,'But first… let me take a selfie.','alandha'),
(41,49,45,'Gracing your feed with this fabulous selfie.','alandi'),
(42,21,30,'Mirror: “You look cute today.” Camera: “LOL, no.”','alang'),
(43,13,39,'Life is like a mirror, we get the best results when we smile.','alappuzha'),
(44,18,39,'Smile at the world, and she’ll smile back.','aldona'),
(45,35,20,'Keep the Smile On!','alibag'),
(46,25,24,'Please don’t download my Selfie, you may fall in love with me.','aligarh'),
(47,35,45,'Silly girls are the best.','alipurduar'),
(48,45,28,'I am not a selfie expert.','allahabad'),
(49,22,9,'Life is better when you’re smiling.','almora'),
(50,26,12,'I don’t take selfies all the time, just every day.','aalanavara'),
(51,46,10,'Be the best version of yourself.','along'),
(52,28,39,'Beauty begins the moment you decide to be yourself.','alur'),
(53,38,46,'Do more of what makes you happy.','assam'),
(54,14,20,'Anti-You.','jammu and kashmir'),
(55,28,17,'Sometimes I’m in a selfie mood.','maharashtra'),
(56,29,17,'I am not taking a selfie, I am just checking my camera quality.','maharashtra'),
(57,15,36,'Animal selfies are the best selfies.','uttar pradesh'),
(58,49,28,'Selfie Time!','west bengal'),
(59,36,21,'Simplicity is the key to brilliance.','uttar pradesh'),
(60,46,33,'There is beauty in simplicity.','uttarakhand'),
(61,22,16,'Be obsessively grateful.','karnataka'),
(62,15,37,'May your day feel as good as taking this perfect selfie on the first try.','arunachal pradesh'),
(63,9,43,'I’m not lazy, just relaxed.','maharashtra'),
(64,33,4,'Dinner time is selfie time.','maharashtra'),
(65,50,30,'I must have no selfie control.','karnataka'),
(66,4,4,'All-natural.','maharashtra'),
(67,13,20,'May your day feel as good as taking this perfect selfie on the first try.','gujarat'),
(68,44,42,'My favorite part about this selfie is the invisible crown.','kerala'),
(69,16,23,'Keep calm and take a selfie.','goa'),
(70,17,39,'Some call it arrogant, I call it confidence.','uttar pradesh'),
(71,10,39,'I woke up like this; flawless.','gujarat'),
(72,28,14,'“Who said I was an angel?”','andhra pradesh'),
(73,20,47,'Bout to make me give you a reason to be insecure.','gujarat'),
(74,13,27,'Dress like you’re already famous!','karnataka'),
(75,6,21,'You’re not fully dressed until you sparkle.','andhra pradesh'),
(76,32,21,'Normal is boring for me.','kerala'),
(77,40,15,'I am not trying to be cool, It’s what I am.','karnataka'),
(78,3,17,'I collect smiles, and then I give them away.','west bengal'),
(79,36,30,'A girl should be like a butterfly. Pretty to see, hard to catch.','karnataka'),
(80,25,14,'Queen of own world.','tripura'),
(81,41,2,'Being sexy is about attitude possessed, not a body type. It’s a state of mind.','uttar pradesh'),
(82,32,32,'Sexy is being confident, independent, and having fun.','chhattisgarh'),
(83,15,6,'If you cannot do great things, do small things in a great way.','gujarat'),
(84,8,9,'She turned her can’t into cans & her dreams into plans.','punjab'),
(85,19,28,'Coffee in one hand, Confidence in other.','maharashtra'),
(86,48,30,'Short hair, don’t care.','maharashtra'),
(87,40,14,'Be your own reason to smile.','mizoram'),
(88,22,18,'Seek respect, not attention.','rajasthan'),
(89,49,48,'I dress to impress myself.','maharashtra'),
(90,32,12,'A smile is the best makeup a girl can wear.','chhattisgarh'),
(91,17,23,'She was like a moon, a part of her always stayed hidden.','kerala'),
(92,33,8,'Smile with your eyes.','jammu and kashmir'),
(93,19,40,'Life is too short to wear boring clothes.','maharashtra'),
(94,49,27,'Lift up your head princess, if not the crown falls.','The Red Fort, Delhi.'),
(95,41,3,'Dressing well is the best revenge.','The Taj Mahal, Agra.'),
(96,22,4,'I don’t worry. I don’t doubt it. I’m daring. I’m a rebel.','Pangong Lake, Ladakh.'),
(97,36,34,'Life happens, coffee helps.','Valley of Flowers, Nainital.'),
(98,6,34,'You must be bold, brave, and courageous and find a way… to get in the way.','Jaisalmer Fort, Jaisalmer.'),
(99,23,1,'Don’t stop when you are tired. Stop when you are done!','Ruins of Hampi, Karnataka.'),
(100,31,45,'This is my moment I just feel so alive.','Ghats at Varanasi, Uttar Pradesh.');

INSERT INTO COMMENTS(comment_text ,post_id,user_id) VALUES 
('great man',26,6),
('looking greate bhai',12,17),
('nice place keep enjoying',29,15),
('great bhai meetu soon ',49,21),
('aag lga di bhai',37,34),
('briallant keep working',3,34),
('soon will join you all',86,21),
('nice man !! loved it',81,28),
('bawnadar aayega abb ',83,48),
('boht tezz ho rhe ho ',38,23),
('bade acche ho beta',92,27),
('rakh neeche rakh teri toh',83,7),
('kaise ho bro',5,50),
('aag lga di h bss fire extinguisher bulana pdega',42,4),
('ek kahani h jo sabko sunnani h jakne wako ki toh rooh bhi jaalani h',59,25),
('mast h bhai , mill tabb btata hu kon mast h ',62,31),
('sahi lgg rha h bss ',27,8),
('I think this is the best I’ve seen till now.',83,36),
(' Not enough for me, you are everything.',34,13),
(' Just when I couldn’t love you more. You posted this pic and my jaw dropped to the floor.',81,46),
('You are a symbol of beauty.',77,38),
(' Surely you are the most beautiful woman alive, the most that I’ve seen.',96,19),
('You mean the world to me.',58,10),
('The word pretty is worthless without you.',64,44),
('You are the definition of Beauty',81,4),
('Flawless outstanding eccentric lovely beauty.',36,20),
('The stars, the moon, and the sun are minor to me since you sparkle brighter than all of them.',45,25),
('You are graceful.',21,47),
(' Surely you would have been arrested if looking immensely beautiful was a crime.',3,46),
('You’re an incredibly stunning, a really pretty, beautiful woman.',51,39),
(' I guess this is your best look, you look beautiful in this outfit.',37,47),
('You look mesmerizing.',68,22),
('I wonder how cute you would be looking when you sleep.',6,35),
('You are so much lovely.',29,47),
('I love your curly hair.',2,14),
 ('Your dressing sense is appreciable.',39,41),
 (' You are the sweetest girl I have ever seen.',40,33),
 ('. I love that straight hair of yours.',79,29),
 ('You are pleasing.',45,35),
('Just ‘WOW’ for your natural beauty.',41,33),
 ('You are cute.',18,49),
 ('I love how comfortable you are in your world.',45,14),
('You are very much adorable.',39,5),
 ('You look even more pretty without makeup.',47,45),
 ('I feel so happy to be with you.',85,13),
 ('You are my safest place.',51,35),
('You look beautiful in that dress.',99,15),
 ('. I wish I had your makeup.',5,23),
 ('You are stunning.',78,14),
 ('. That natural beauty tho.',25,14),
('You have the most beautiful, sparkling eyes.',86,46),
('You have the most beautiful smile.',70,10),
 ('. Your sense of fashion is great.',70,22),
 (' I like your hair.',25,32),
 ('. You look more beautiful than in the photo.',24,25),
 (' You look stunning.',94,15),
 ('You’re classy.',89,34),
('You’re very trendy',100,1),
 ('Landscape/Scenery:',75,40),
('Great shot!',82,29),
 ('Nice shot!!',93,6),
('Love the view.',74,31),
 ('Did you have fun up there?',46,11),
 ('Selfie/picture of themselves:',13,25),
 ('Looking good!',31,7),
 ('Pretty/beautiful!',57,44),
 ('Handsome!',58,39),
 ('OH MAH GOSH!!',35,7),
('?????? (three heart-eyed emojis)',20,43),
 ('Sexy pose of themselves:',98,31),
 ('MESSY!',84,36),
 ('OMG!',29,42),
('OMG! Be my wife or dad already!!',100,35),
 ('Hot',3,7),
 ('?????? (three heart-eyed emojis)',44,7),
 ('Wtf, how are you so pretty/handsome?',42,19), 
 ('Wow!! In love!!',32,19),
 ('Classic',59,6),
 ('Picture of their outfit or OOTD (outfit of the day):',99,9),
 ('Ou la la',25,32),
 ('Gorgeous!!',12,25),
 ('Love your outfit!!',71,1),
 ('Looking good, man.',2,33),
 ('A picture of their pet/pets:',26,20),
 ('Soooooo cute!!',48,44),
 ('cute!',18,25),
 ('lovely pet you got there!',22,25),
 ('An inspirational quote:',36,48),
 ('Inspired! Thanks for the share.',66,12),
 ('Needed that, thanks!',11,35),
 ('I agree/disagree.',13,21),
 ('Inspirational',94,13),
 ('A picture of their family or children:',28,26),
 ('Lovely children.',29,20),
 ('Adorable kids, you got there!',76,20),
 ('They will grow up so fast!',6,23),
 ('I remember when they were X small!! Time flies by to fast!',80,24),
 ('A picture of their meal:',27,18),
 ('Looks delish! Did you cook that?!?',5,30),
 ('Yummy in my tummy. Yum!',87,15),
 ('Enjoy!!',18,16),
 ('??????(the drooling mouth emoji)',73,5),
('Death of a loved one:',30,31),
 ('Sorry for your loss. My condolences go to you and your family.',26,37),
 ('Rip (person’s name).',80,49),
 ('Sorry for your loss, friend. If you need to talk, I’m always there for you.',48,43),
 ('My condolences.',56,5),
('Anniversary:',66,50),
 ('Congrats!',92,15),
('Congratulations on your X years of marriage/engagement!!',86,49),
 ('Woo!! Congrats newlywed!',26,44),
('I’m so happy for you.',16,24),
 ('Great shot!!',60,18),
 ('Clean shot!!',53,26),
('Crisp shot man.',88,11),
('I love the aesthetics of this picture.',39,13),
('The bookeh is dope',52,26),
 ('Great tones man',72,41),
 ('This one is classic',83,25),
 ('This one is fire',39,3),
 ('great concepts.',58,40),
('Beautiful picture, love the colors.',30,13),
 ('Woow!! Hands down!!',45,27),
 ('This is purely magic.',18,36),
('Your content is amazing.',19,6),
('Nice shot… etc etc :)',21,29),
 ('Your beauty is irresistible!!',49,25),
('You look energetic.',13,14),
 ('Impressive picture.',100,20),
 ('You look strong and confident.',95,49),
('This picture is lit!!',20,9),
('Adorable picture.',59,45),
 ('Your smile makes me Happy.',5,39),
 ('Looking Gorgeous .',83,43),
 ('This picture made my day.',59,45),
('Your beauty has no boundaries.',3,12),
 ('My word can’t describe your beauty!!',67,22),
("Your eyes sparkle like something I've never seen before.",27,8),
('Handsome hunk',35,15),
 ('That beard tho (if you go in for details)',86,50),
 ("That's dope",69,39),
 ('Nailed it',62,48),
 ('My squad',69,19),
 ('High af',67,11),
 ('Awesome',4,40),
('Bromantic',42,11),
 ('Hero',33,15),
('This boy is mine',94,18),
 ('My man',93,36),
 ('I own this male',49,8),
 ('He + me = forever',7,18),
('You mean the world to me',85,42),
('Cant get my eyes off',16,26),
('In nature, light creates the color. In the picture, color creates the light.',44,41),
('NICE GREAT',60,47),
('The beauty has no boundaries in this picture.',43,9),
('SUPER ',23,31),
('Your beauty is irresistible.',71,43),
('ADORABLE CHILL LIFE',83,30),
('Such a charming picture.',11,40),
('CHAL BE HERO',96,39),
 ('Elegant picture.',30,42),
('NICE PLACE AND WATVH',41,47),
 ('My words are less to describe this picture.',49,32),
 ('FDSAFDS',22,1),
('Beauty lies within for those who choose to see.',33,48),
 ('BASDHIYAYY',3,18),
('The power of beauty lies within the soul.',29,6),
('KICKASS LOKK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',15,23),
('This picture is worth a thousand words.',41,47),
('GREAT TO SEE U ALIVE ',8,33),
('Beauty is power; a smile is its sword.',1,24),
 ('MSRJAA AJJJRJKLFDSA',68,41),
('This place looks exotic.',2,46),
 ('DUBAI IS SLIVWE',61,36),
('I love how vibrant colors are in the picture.',10,18),
('GOOOD DATYYYYYYYYYYYYYYYYYYYYYYYYYYYYY',38,20),
 ('Such a scenic view ,looks great.',64,49),
('WONDERFUL IMORESSIVE',69,16),
('Impressive picture.',4,28),
('AAGT LGADI BHAI MAJA AA GYA ',78,39),
('Adorable picture and Your smile makes me Happy.',42,30),
('such a nice cute humbke kind gentke face',1,1),
 ('Looking Gorgeous and This picture made my day. ', 61,1),
 ("Never seen a selfie of yours that I don't like. ", 29,48),
 ('You are the coolest. ', 97,27),
('You are the coolest. ', 69,19),
('You are the coolest. ', 25,15),
 ('You are the coolest. ', 66,23),
('Friends forever. ', 6,5),
 ('They say love is beautiful, but I say friendship is better. ', 13,9),
('AAGT LGADI BHAI MAJA AA GYA  ', 26,32),
('Impressive picture. ', 72,39),
('MSRJAA AJJJRJKLFDSA ', 23,31),
('COOL PIC ', 58,4),
 ('You are the coolest. ', 68,34),
('xing of public record ', 93,48),
('GREAT JOB ', 10,6),
('GOOOD DAY !!!!!!!!!!!!!!!!!!!! ', 98,46);
 
INSERT INTO follows(follower_id, followee_id) VALUES 
(46, 2), (21, 9), (23, 44), (29, 19),(36, 16),(20, 12),(7, 43),(22, 41),(13, 28),(22, 44),(13, 15),(25, 9),
(18, 50),(25, 17),(6, 28),(11, 3),(11, 39),(41, 1),(41, 28),(44, 36),(6, 27),(42, 1),(42, 23),(8, 32),(11, 22),(33, 23),
(43, 40),(18, 42),(14, 50),(19, 30),(8, 26),(27, 11),(43, 33),(43, 7),(17, 35),(22, 13),(47, 10),(20, 32),(7, 22),(18, 18),
(33, 38),(32, 24),(48, 14),(8, 23),(6, 40),(9, 48),(19, 38),(46, 25),(36, 50),(40, 7),(27, 25),(14, 22),(26, 14),(10, 25),
(16, 33),(37, 50),(33, 3),(20, 30),(43, 43),(34, 49),(36, 18),(27, 46),(14, 12),(42, 10),(40, 9),(20, 4),(39, 28),(25, 16),
(27, 5),(11, 40),(7, 24),(23, 7),(16, 31),(27, 28),(22, 31),(32, 12),(11, 42),(41, 37),(23, 50),(33, 5),(32, 17),(30, 44),
(24, 2),(30, 1),(12, 38),(16, 47),(43, 5),(31, 46),(36, 22),(42, 50),(38, 15),(10, 50),(26, 43),(8, 17),(2, 28),(22, 7),(13, 50),
(40, 48),(21, 35),(16, 1),(3, 40),(31, 16),(8, 42),(7, 48),(29, 38),(13, 49),(30, 18),(1, 2),(20, 49),(15, 47),(8, 30),
(15, 20),(27, 13),(23, 11),(1, 37),(49, 38),(40, 6),(50, 41),(46, 29),(7, 17),(1, 41),(30, 15),(22, 21),(46, 35),(30, 17),
(31, 31),(14, 49),(15, 37),(26, 44),(50, 48),(21, 39),(24, 40),(33, 49),(47, 29),(10, 38),(41, 10),(29, 50),(2, 8),(42, 49),
(26, 35),(18, 21),(28, 49),(19, 20),(8, 49),(15, 21),(25, 27),(4, 5),(37, 37),(48, 31),(28, 39),(26, 30),(37, 8),(26, 20),(24, 8),
(44, 1),(36, 31),(12, 7),(19, 13),(7, 8),(37, 47),(28, 35),(20, 27),(39, 23),(18, 19),(36, 21),(12, 46),(28, 21),(45, 23),(35, 1),
(49, 30),(1, 25),(13, 46),(34, 37),(42, 35),(50, 29),(43, 25),(26, 4),(9, 45),(34, 18),(20, 3),(44, 3),(10, 20),(50, 22),(23, 16),
(2, 50),(48, 46),(44, 34),(17, 8),(31, 12),(33, 9),(15, 38),(43, 14),(27, 1),(39, 10),(39, 19),(42, 16),(34, 29),(33, 39),(13, 14),
(43, 13),(10, 16),(44, 50),(21, 8),(21, 15),(36, 14),(11, 24),(49, 32),(31, 44),(48, 29),(10, 31),(45, 33),(10, 46),(4, 2),(24, 16),
(48, 5),(48, 6),(16, 11),(20, 37),(27, 35),(12, 12),(34, 1),(37, 25),(21, 3),(46, 24),(2, 29),(18, 43),(15, 36),(16, 14),(41, 3),
(50, 2),(24, 20),(9, 14),(3, 43),(9, 19),(28, 32),(42, 41),(8, 11),(46, 11),(8, 27),(5, 47),(32, 25),(13, 9),(8, 3),(11, 9),
(25, 45),(33, 32),(15, 15),(5, 40),(36, 2),(28, 47),(36, 30),(43, 47),(19, 46),(44, 30),(23, 48),(50, 38),(23, 6),(48, 17),(7, 16),
(34, 34),(45, 14),(40, 20),(30, 8),(17, 3),(35, 48),(34, 13),(39, 38),(2, 47),(4, 30),(12, 41),(33, 18),(37, 6),(8, 6),(3, 24),
(40, 1),(16, 16),(32, 50),(40, 15),(29, 22),(5, 2),(48, 37),(33, 46),(5, 37),(24, 22),(46, 44),(12, 47),(6, 31),(37, 23),(24, 23),
(14, 21),(18, 10),(20, 28),(24, 17),(28, 19),(6, 13),(24, 24),(6, 19),(46, 41),(9, 25),(32, 37),(46, 39),(21, 41),(14, 40),(24, 33),
(41, 32),(15, 2),(42, 25),(14, 7),(35, 13),(2, 1),(35, 28),(45, 49),(35, 49),(18, 7),(45, 45),(2, 17),(4, 9),(23, 49),(30, 12),
(48, 2),(28, 7),(2, 12),(4, 45),(9, 8),(16, 19),(39, 32),(37, 31),(37, 9),(49, 17),(36, 46),(43, 50),(5, 48),(14, 5),(23, 25),
(47, 38),(14, 15),(23, 23),(47, 6),(26, 10),(7, 26),(8, 36),(33, 20),(48, 45),(40, 5),(8, 31),(49, 20),(44, 42),(20, 13),(29, 11),
(34, 32),(7, 23),(6, 36),(24, 44),(32, 39),(27, 36),(15, 46),(23, 36),(21, 49),(42, 4),(10, 22),(11, 14),(23, 21),(38, 20),(16, 26),
(8, 8),(10, 23),(45, 13),(42, 40),(6, 26),(10, 44),(40, 50),(6, 17),(13, 19),(6, 3),(45, 50),(11, 41),(30, 25),(44, 35),(44, 14),
(12, 29),(14, 38),(50, 28),(38, 1),(48, 10),(38, 29),(19, 29),(49, 35),(11, 34),(22, 36); 

show tables;
select*from login;
select*from users;
select*from photos;
select*from post; 
select*from COMMENTS;
select*from follows; 

-- queries 

-- retrieve all users account creation information
SELECT user_id,username,created_at FROM users ORDER BY created_at;

-- Retrieve the most active users
SELECT user_id, username As 'Most active User' FROM users WHERE user_id NOT IN (SELECT user_id FROM post); 

-- Get the number of posts each user has made
SELECT user_id, COUNT(*) AS post_count FROM post GROUP BY user_id;

-- Retrieve posts with more than 5 comments
SELECT post_id, COUNT(*) AS comments_count FROM comments GROUP BY post_id HAVING COUNT(*) > 5;

-- Retrieve posts with location 
SELECT * FROM post WHERE location IN ('agra' ,'maharashtra','west bengal');  

-- Calculate the total number of followers each user has:
SELECT user_id,username, COUNT(follower_id) AS total_followers FROM users 
LEFT JOIN follows ON user_id = follower_id GROUP BY user_id, username ORDER BY total_followers DESC;

-- Retrieve the posts made by a specific user (e.g., user_id = 1):
SELECT * FROM post WHERE user_id = 15;

-- Identify the most commented post:
SELECT post_id, COUNT(*) AS comment_count FROM comments GROUP BY post_id ORDER BY comment_count DESC LIMIT 1;

-- Find the user who has most comment on the posts:
SELECT user_id, COUNT(*) AS comments_count FROM comments
GROUP BY user_id ORDER BY comments_count DESC LIMIT 1;


