package org.example;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Programm {



    List<Animal> packanimals = new ArrayList<Animal>();

    List<Animal> pets = new ArrayList<Animal>();

    Scanner scanner = new Scanner(System.in);
    public void addNewAnimal() throws EmptyStringException{

        System.out.println("Введите тип животного: ");
        String type = scanner.nextLine();
        if (type.isEmpty()){
            throw new EmptyStringException("Строка является пустой");
        }
        System.out.println("Введите имя животного: ");
        String name = scanner.nextLine();
        System.out.println("Введите команды, которые может исполнять животное: ");
        String commands = scanner.nextLine();
        System.out.println("Введите дату рождения: ");
        String birthday = scanner.nextLine();

        Animal animal = new Animal(type, name, commands, birthday);

        sortAnimal(animal);
    }

    public void sortAnimal(Animal animal){

        switch (animal.getType().toLowerCase()){
            case "собака":
                pets.add(animal);
                break;
            case "кошка":
                pets.add(animal);
                break;
            case "хомяк":
                pets.add(animal);
                break;
            case "лошадь":
                packanimals.add(animal);
                break;
            case "осел":
                packanimals.add(animal);
                break;
            case "верблюд":
                packanimals.add(animal);
                break;
            default:
                System.out.println("Этого типа нет в нашем питомнике");
        }
    }

    /**
     * Метод показывает команды выбранного животного
     * @param name - Имя по которому будет производиться поиск.
     */
    public String showCommands(String name){
        Animal animal = findAnimal(name);
        return animal.getCommands();
    }

    /**
     * Метод для поиска животного оп имени.
     * @param name - Имя по которому будет производиться поиск.
     * @return - Возвращает объект класса Animal.
     */
    public Animal findAnimal(String name){
        List<Animal> allAnimal = new ArrayList<Animal>();
        allAnimal.addAll(pets);
        allAnimal.addAll(packanimals);

        Animal animal = new Animal();

        for (int i = 0;i < allAnimal.size(); i++){
            if (allAnimal.get(i).getName().equals(name)){
                animal = allAnimal.get(i);
                i = allAnimal.size();
            }
        }
        return animal;
    }

    /**
     * Метод добавляет новые команды животному.
     * @param name - Имя по которому будет производиться поиск.
     */
    public void learnNewCommands(String name){
        Animal animal = findAnimal(name);

        System.out.println(name + " умеет " + animal.getCommands() + ". \n" +
                "Чему ещё научился(ась) " + name + ":");

        String newCommands = scanner.nextLine();
        newCommands = newCommands + ", " + animal.getCommands();

        animal.setCommands(newCommands);

        for (int i = 0; i < pets.size(); i++){
            if(pets.get(i).getName().equals(name)){
                pets.remove(i);
                pets.add(animal);
                i = pets.size();
            }
        }

        for (int i = 0; i < packanimals.size(); i++){
            if(packanimals.get(i).getName().equals(name)){
                packanimals.remove(i);
                packanimals.add(animal);
                i = packanimals.size();
            }
        }
    }
}
