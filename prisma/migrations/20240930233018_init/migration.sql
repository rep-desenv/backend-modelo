/*
  Warnings:

  - You are about to drop the `folha_ponto` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `folha_ponto` DROP FOREIGN KEY `Folha_Ponto_calendarioId_fkey`;

-- DropForeignKey
ALTER TABLE `folha_ponto` DROP FOREIGN KEY `Folha_Ponto_userId_fkey`;

-- DropTable
DROP TABLE `folha_ponto`;

-- CreateTable
CREATE TABLE `Folha_Ponto_Mov_Tipo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdBy` INTEGER NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `updatedBy` INTEGER NOT NULL,
    `tipo_desc` VARCHAR(191) NOT NULL,
    `tipo_mov` LONGBLOB NOT NULL,
    `perfilId` INTEGER NOT NULL,

    UNIQUE INDEX `Folha_Ponto_Mov_Tipo_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Folha_Ponto_Mov` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdBy` INTEGER NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `updatedBy` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `calendarioId` INTEGER NOT NULL,
    `hora_ini` TIME NOT NULL,
    `hora_fim` TIME NOT NULL,

    UNIQUE INDEX `Folha_Ponto_Mov_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Folha_Ponto_Fecham` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdBy` INTEGER NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `updatedBy` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `calendarioId` INTEGER NOT NULL,
    `hora_ini` TIME NOT NULL,
    `hora_fim` TIME NOT NULL,

    UNIQUE INDEX `Folha_Ponto_Fecham_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Perfil` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdBy` INTEGER NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `updatedBy` INTEGER NOT NULL,
    `perfil_desc` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Perfil_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Folha_Ponto_Mov_Tipo` ADD CONSTRAINT `Folha_Ponto_Mov_Tipo_perfilId_fkey` FOREIGN KEY (`perfilId`) REFERENCES `Perfil`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Folha_Ponto_Mov` ADD CONSTRAINT `Folha_Ponto_Mov_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Folha_Ponto_Mov` ADD CONSTRAINT `Folha_Ponto_Mov_calendarioId_fkey` FOREIGN KEY (`calendarioId`) REFERENCES `Calendario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Folha_Ponto_Fecham` ADD CONSTRAINT `Folha_Ponto_Fecham_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Folha_Ponto_Fecham` ADD CONSTRAINT `Folha_Ponto_Fecham_calendarioId_fkey` FOREIGN KEY (`calendarioId`) REFERENCES `Calendario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
