/*
  Warnings:

  - A unique constraint covering the columns `[author]` on the table `Post` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE `Role` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL DEFAULT '',
    `canManageContents` BOOLEAN NOT NULL DEFAULT false,
    `canManageUsers` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_Role_users` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_Role_users_AB_unique`(`A`, `B`),
    INDEX `_Role_users_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Post_author_key` ON `Post`(`author`);

-- AddForeignKey
ALTER TABLE `_Role_users` ADD CONSTRAINT `_Role_users_A_fkey` FOREIGN KEY (`A`) REFERENCES `Role`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Role_users` ADD CONSTRAINT `_Role_users_B_fkey` FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
