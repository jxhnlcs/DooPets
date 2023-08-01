<?php

namespace App\DAO;

use App\Model\AnimalModel;
use App\Model\ClienteAnimalModel;
class AnimalDAO extends ConexaoDAO{

    public function __construct(){
        parent::__construct();
    }

    public function getAllAnimais(): array{
        $sql = 'SELECT * from animais';
        $animais = $this->pdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        return $animais;
    }

    public function getAnimal(AnimalModel $animalModel): array{
        $sql = 'SELECT * from animais WHERE id = :id';
    
        $stm = $this->pdo->prepare($sql);
        $stm->execute([
            'id' => $animalModel->getId()
        ]);
        $animal = $stm->fetch(\PDO::FETCH_ASSOC);
        return $animal;
    }

    public function insertAnimal(AnimalModel $animalModel): void {
        
        $sql = 'INSERT INTO animais VALUES (null, :nome_pet, :data_nascimento, :sexo, :altura, :peso, :especie, :raca, :pelagem, :porte)';

        $stm = $this->pdo
        ->prepare($sql);
        
        $stm->execute([
            'nome_pet' => $animalModel->getNome_pet(),
            'data_nascimento' => $animalModel->getData_nascimento(),
            'sexo' => $animalModel->getSexo(),
            'altura' => $animalModel->getAltura(),
            'peso' => $animalModel->getPeso(),
            'especie' => $animalModel->getEspecie(),
            'raca' => $animalModel->getRaca(),
            'pelagem' => $animalModel->getPelagem(),
            'porte' => $animalModel->getPorte(),
        ]);

        $cliente_id = $animalModel->getTutor_id();
        $animal_id = $this->pdo->lastInsertId();
     
        var_dump($animal_id);
        
        $sql02 = 'INSERT INTO cliente_animal VALUES (:cliente_id, :animal_id)';
        $stm = $this->pdo->prepare($sql02);
        $stm->execute([
            'cliente_id' => $cliente_id,
            'animal_id' => $animal_id
        ]);

    }

    public function updateAnimal(AnimalModel $animalModel): void {
        $sql = 'UPDATE animais SET nome_pet = :nome_pet, data_nascimento = :data_nascimento, sexo = :sexo, altura = :altura, peso = :peso, especie = :especie, raca = :raca, pelagem = :pelagem, porte = :porte WHERE id = :id';

        $stm = $this->pdo->prepare($sql);

        $stm->execute([
            'nome_pet' => $animalModel->getNome_pet(),
            'data_nascimento' => $animalModel->getData_nascimento(),
            'sexo' => $animalModel->getSexo(),
            'altura' => $animalModel->getAltura(),
            'peso' => $animalModel->getPeso(),
            'especie' => $animalModel->getEspecie(),
            'raca' => $animalModel->getRaca(),
            'pelagem' => $animalModel->getPelagem(),
            'porte' => $animalModel->getPorte(),
            'id' => $animalModel->getId()
        ]);
    }

    public function deleteAnimal(AnimalModel $animalModel): void{
        $sql = 'DELETE FROM animais WHERE id = :id';

        $stm = $this->pdo->prepare($sql);

        $stm->execute(['id' => $animalModel->getId()]);
    }


    public function buscarRaca(AnimalModel $animalModel): array{
        $sql = 'SELECT * FROM racas WHERE especie = :especie';

        $stm = $this->pdo->prepare($sql);

        $stm->execute(['especie' => $animalModel->getEspecie()]);
        $animal = $stm->fetchAll(\PDO::FETCH_ASSOC);
        return $animal;
    }

    public function buscarPorte(): array{
        $sql = 'SELECT * from tipo_porte';

        $portes = $this->pdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        return $portes;
    }

    public function buscarPelagem(): array{
        $sql = 'SELECT * from tipo_pelagem';

        $pelagens = $this->pdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        return $pelagens;
    }


}