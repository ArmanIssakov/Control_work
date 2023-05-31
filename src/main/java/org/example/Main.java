package org.example;

import java.util.Scanner;

public class Main {
    static Programm app = new Programm();


    public static void menu(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Выберите пункт: (после выбора нужно ввести номер пункта)\n" +
                "1.Завести новое животное (распределение по классам происходит автоматически)\n" +
                "2.Увидеть список, которое выполняет животное\n" +
                "3.Обучить Животное новым командам");

        int choose = Integer.parseInt(scanner.nextLine());
        switch (choose){
            case 1:
                try {
                    app.addNewAnimal();
                } catch (EmptyStringException e){
                    System.out.println("Не должно быть пустых полей");
                }

                menu();
                break;
            case 2:
                System.out.println("Введите имя животного:");
                String name = scanner.nextLine();
                System.out.println(app.showCommands(name));
                menu();
                break;
            case 3:
                System.out.println("Введите имя животного:");
                String name1 = scanner.nextLine();
                app.learnNewCommands(name1);
                menu();
                break;
            default:
                System.exit(0);
        }
    }
    public static void main(String[] args) {
        menu();
    }
}