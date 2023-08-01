<?php

namespace App\Model;

final class AnimalModel {
    private $id;
    private $pet;
    private $raca;
    private $pelagem;
    private $porte;
    private $sexo;
    private $peso;
    private $nascimento;
    private $especie;
    private $altura;


    public function getId(): int {
        return $this->id;
    }

    public function setId(int $id): AnimalModel {
        $this->id = $id;
        return $this;
    }

    public function getPet(): string {
        return $this->pet;
    }

    public function setPet(string $pet): AnimalModel {
        $this->pet = $pet;
        return $this;
    }

    public function getRaca(): string {
        return $this->raca;
    }

    public function setRaca(string $raca): AnimalModel {
        $this->raca = $raca;
        return $this;
    }

    public function getPelagem(): string {
        return $this->pelagem;
    }

    public function setPelagem(string $pelagem): AnimalModel {
        $this->pelagem = $pelagem;
        return $this;
    }

    public function getPorte(): string {
        return $this->porte;
    }

    public function setPorte(string $porte): AnimalModel {
        $this->porte = $porte;
        return $this;
    }

    public function getSexo(): string {
        return $this->sexo;
    }

    public function setSexo(string $sexo): AnimalModel {
        $this->sexo = $sexo;
        return $this;
    }

    public function getPeso(): string {
        return $this->peso;
    }

    public function setPeso(string $peso): AnimalModel {
        $this->peso = $peso;
        return $this;
    }

    public function getNascimento(): string {
        return $this->nascimento;
    }

    public function setNascimento(string $nascimento): AnimalModel {
        $this->nascimento = $nascimento;
        return $this;
    }

    public function getEspecie(): string {
        return $this->especie;
    }

    public function setEspecie(string $especie): AnimalModel {
        $this->especie = $especie;
        return $this;
    }

    public function getAltura(): string {
        return $this->altura;
    }

    public function setAltura(string $altura): AnimalModel {
        $this->altura = $altura;
        return $this;
    }

}
