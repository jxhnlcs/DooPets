<?php

namespace App\DAO;
use App\Model\AnimalModel;
use App\Model\ClienteModel;
use App\Model\ClienteAnimalModel;

class  ClienteAnimalDAO extends ConexaoDAO{

    public function __contruct(){
        parent::__contruct();
    }

    public function getAllClienteAnimal(): array {
        $sql = 'SELECT * FROM cliente_animal';
        $clientesAnimais = $this->pdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
        
        return $clientesAnimais;
    }
    
    public function getClienteVinculadoById(AnimalModel $animalM): array {
        $sql = 'SELECT clientes.nome, clientes.id
        FROM clientes
        JOIN cliente_animal ON clientes.id = cliente_animal.cliente_id
        WHERE cliente_animal.animal_id = :id';
    
        $stm = $this->pdo->prepare($sql);
        $stm->execute([
            'id' => $animalM->getId()
        ]);
        $tabela = $stm->fetchAll(\PDO::FETCH_ASSOC);
        return $tabela;
    }

    public function getPetVinculadoById(ClienteModel $clienteM): array{
        $sql = 'SELECT animais.*
        FROM animais
        JOIN cliente_animal ON animais.id = cliente_animal.animal_id
        WHERE cliente_animal.cliente_id = :id';
    
        $stm = $this->pdo->prepare($sql);
        $stm->execute([
            'id' => $clienteM->getId()
        ]);

        $tabela = $stm->fetchAll(\PDO::FETCH_ASSOC);
        return $tabela;
    }

    public function deleteVinculo(ClienteAnimalModel $tabelaM): void{
        $sql = 'DELETE FROM cliente_animal
        WHERE cliente_id = :cliente_id AND animal_id = :animal_id';


        $stm = $this->pdo->prepare($sql);
        $stm->execute([
            'cliente_id' => $tabelaM->getTutor_id(),
            'animal_id' => $tabelaM->getAnimal_Id()
        ]);

    }

    public function adicionarVinculo(ClienteAnimalModel $tabelaM): void{
        $sql = 'INSERT INTO cliente_animal  values (:cliente_id, :animal_id)';

        $stm = $this->pdo->prepare($sql);

        $stm->execute([
            'cliente_id' => $tabelaM->getTutor_id(),
            'animal_id' => $tabelaM->getAnimal_Id()
        ]);
    }

    public function buscarClienteTabelaAuxiliar(){
        $sql = 'SELECT *
        FROM clientes
        WHERE id IN (SELECT DISTINCT cliente_id FROM cliente_animal);';
        $clientes = $this->pdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
        
        return $clientes;
    }
    
   
    

}