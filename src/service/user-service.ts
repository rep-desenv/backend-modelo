import { Prisma, PrismaClient, User } from "@prisma/client";

const prisma = new PrismaClient()

export const getUsers = async () => {    
    return await prisma.user.findMany()
};

export const getUser = async (userId: number): Promise<User | null> => {

    const user = await prisma.user.findUnique({
        where: { id: userId },
    });

    return user;

};

export const createUser = async (dados: User) => {

    const createUser = await prisma.user.create({
        data: {
            createdAt: dados.createdAt,
            updatedAt: dados.updatedAt,
            colaborador: dados.colaborador,
            funcao: dados.funcao,
            admissao: dados.admissao,
            jornada_trabalho: dados.jornada_trabalho,            
            porcentagem: dados.porcentagem,
            entradaAt: dados.entradaAt,
            saidaAt: dados.saidaAt, 
            hora_base: dados.hora_base, 
            valor_base: dados.valor_base,
            dias_trab: dados.dias_trab, 
            valor_dia: dados.valor_dia, 
            valor_hora: dados.valor_hora
        }
    })
    
    return createUser

}


export const deleteUser = async(userId: number)=>{

    const deleteUser = await prisma.user.delete({
        where: { id: userId}
    })

    return deleteUser

}


export const updateUser = async (userId: number, dados:User) => {

    const updateUser = await prisma.user.update({
        where: {id: userId},
        data:{
            createdAt: dados.createdAt,
            updatedAt: dados.updatedAt,
            colaborador: dados.colaborador,
            funcao: dados.funcao,
            admissao: dados.admissao,
            jornada_trabalho: dados.jornada_trabalho,            
            porcentagem: dados.porcentagem,
            entradaAt: dados.entradaAt,
            saidaAt: dados.saidaAt, 
            hora_base: dados.hora_base, 
            valor_base: dados.valor_base,
            dias_trab: dados.dias_trab, 
            valor_dia: dados.valor_dia, 
            valor_hora: dados.valor_hora
        }
    })

    return updateUser

}
