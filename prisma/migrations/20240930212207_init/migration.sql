-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `colaborador` VARCHAR(255) NOT NULL,
    `funcao` VARCHAR(255) NOT NULL,
    `admissao` DATETIME(3) NOT NULL,
    `jornada_trabalho` DOUBLE NOT NULL,
    `entradaAt` TIME NOT NULL,
    `saidaAt` TIME NOT NULL,
    `hora_base` TIME NOT NULL,
    `valor_base` DOUBLE NOT NULL,
    `dias_trab` INTEGER NOT NULL,
    `valor_dia` DOUBLE NOT NULL,
    `valor_hora` DOUBLE NOT NULL,
    `porcentagem` DOUBLE NOT NULL,

    UNIQUE INDEX `User_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Calendario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mes` VARCHAR(50) NOT NULL,
    `data` DATE NOT NULL,
    `dia` VARCHAR(191) NOT NULL,
    `feriado` BOOLEAN NOT NULL DEFAULT false,
    `fim_semana` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `Calendario_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Folha_Ponto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `folhaPontoId` INTEGER NOT NULL,

    UNIQUE INDEX `Folha_Ponto_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Folha_Ponto` ADD CONSTRAINT `Folha_Ponto_folhaPontoId_fkey` FOREIGN KEY (`folhaPontoId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
