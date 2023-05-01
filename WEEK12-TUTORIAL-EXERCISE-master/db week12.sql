CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(10) NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_UN` (`token`),
  KEY `token_FK` (`user_id`),
  CONSTRAINT `token_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `file_path` varchar(200) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by_id` int(11) DEFAULT NULL,
  `main` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `follow_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`follower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `like` int(11) NOT NULL DEFAULT 0,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `status` enum('01','02') NOT NULL DEFAULT '01',
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `like` int(11) NOT NULL DEFAULT 0,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
SELECT `users`.`id`,
    `users`.`username`,
    `users`.`password`,
    `users`.`first_name`,
    `users`.`last_name`,
    `users`.`email`,
    `users`.`picture`,
    `users`.`mobile`,
    `users`.`join_date`,
    `users`.`role`
FROM `webpro`.`users`;

SELECT `tokens`.`id`,
    `tokens`.`user_id`,
    `tokens`.`token`
FROM `webpro`.`tokens`;

SELECT `images`.`id`,
    `images`.`blog_id`,
    `images`.`comment_id`,
    `images`.`file_path`,
    `images`.`upload_date`,
    `images`.`update_by_id`,
    `images`.`main`
FROM `webpro`.`images`;

SELECT `follow`.`user_id`,
    `follow`.`follower_id`,
    `follow`.`follow_date`
FROM `webpro`.`follow`;

SELECT `comments`.`id`,
    `comments`.`blog_id`,
    `comments`.`comment`,
    `comments`.`like`,
    `comments`.`comment_date`,
    `comments`.`comment_by_id`
FROM `webpro`.`comments`;

SELECT `blogs`.`id`,
    `blogs`.`title`,
    `blogs`.`content`,
    `blogs`.`status`,
    `blogs`.`pinned`,
    `blogs`.`like`,
    `blogs`.`create_date`,
    `blogs`.`create_by_id`
FROM `webpro`.`blogs`;
