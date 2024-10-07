/*
  Warnings:

  - You are about to drop the column `fim_semana` on the `calendario` table. All the data in the column will be lost.
  - You are about to drop the column `folhaPontoId` on the `folha_ponto` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Calendario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `calendarioId` to the `Folha_Ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `createdBy` to the `Folha_Ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Folha_Ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedBy` to the `Folha_Ponto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Folha_Ponto` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `folha_ponto` DROP FOREIGN KEY `Folha_Ponto_folhaPontoId_fkey`;

-- AlterTable
ALTER TABLE `calendario` DROP COLUMN `fim_semana`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `folha_ponto` DROP COLUMN `folhaPontoId`,
    ADD COLUMN `calendarioId` INTEGER NOT NULL,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `createdBy` INTEGER NOT NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    ADD COLUMN `updatedBy` INTEGER NOT NULL,
    ADD COLUMN `userId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Folha_Ponto` ADD CONSTRAINT `Folha_Ponto_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Folha_Ponto` ADD CONSTRAINT `Folha_Ponto_calendarioId_fkey` FOREIGN KEY (`calendarioId`) REFERENCES `Calendario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
