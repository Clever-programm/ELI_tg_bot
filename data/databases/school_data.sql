CREATE TABLE `operations`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `teacher` BIGINT NOT NULL,
    `date` DATE NOT NULL,
    `student` BIGINT NOT NULL,
    `subject` BIGINT NOT NULL,
    `mark` BIGINT NOT NULL,
    `weight` BIGINT NOT NULL
);
CREATE TABLE `teachers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `surname` TEXT NOT NULL,
    `password` TEXT NOT NULL
);
CREATE TABLE `students`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `surname` TEXT NOT NULL,
    `class` BIGINT NOT NULL,
    `password` TEXT NOT NULL
);
CREATE TABLE `subjects`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subject` TEXT NOT NULL
);
CREATE TABLE `class`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `number` BIGINT NOT NULL,
    `letter` CHAR(255) NOT NULL,
    `main-teacher` BIGINT NOT NULL,
    `school` BIGINT NOT NULL
);
CREATE TABLE `School`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `number` BIGINT NOT NULL,
    `director` BIGINT NOT NULL,
    `password` TEXT NOT NULL
);
ALTER TABLE
    `class` ADD CONSTRAINT `class_school_foreign` FOREIGN KEY(`school`) REFERENCES `School`(`id`);
ALTER TABLE
    `class` ADD CONSTRAINT `class_main_teacher_foreign` FOREIGN KEY(`main-teacher`) REFERENCES `teachers`(`id`);
ALTER TABLE
    `students` ADD CONSTRAINT `students_class_foreign` FOREIGN KEY(`class`) REFERENCES `class`(`id`);
ALTER TABLE
    `School` ADD CONSTRAINT `school_director_foreign` FOREIGN KEY(`director`) REFERENCES `teachers`(`id`);
ALTER TABLE
    `operations` ADD CONSTRAINT `operations_teacher_foreign` FOREIGN KEY(`teacher`) REFERENCES `teachers`(`id`);
ALTER TABLE
    `operations` ADD CONSTRAINT `operations_subject_foreign` FOREIGN KEY(`subject`) REFERENCES `subjects`(`id`);
ALTER TABLE
    `operations` ADD CONSTRAINT `operations_student_foreign` FOREIGN KEY(`student`) REFERENCES `students`(`id`);