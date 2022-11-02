CREATE OR REPLACE TABLE `mailbox_mails` (
   `id` int NOT NULL AUTO_INCREMENT,
   `sender_id` varchar(50) COLLATE UTF8MB4_BIN NOT NULL references `users`(`identifier`),
   `sender_firstname` varchar(50),
   `sender_lastname` varchar(50),
   `receiver_id` varchar(50) COLLATE UTF8MB4_BIN NOT NULL references `users`(`identifier`),
   `receiver_firstname` varchar(50),
   `receiver_lastname` varchar(50),
   `message` text,
   `opened` tinyint DEFAULT 0,
   `received_at` datetime DEFAULT now(),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 ROW_FORMAT=DYNAMIC;