package org.example;

public class Animal {
    private String type;
    private String name;
    private String commands;
    private String birthday;

    public Animal(String type, String name, String commands, String birthday) {
        this.type = type;
        this.name = name;
        this.commands = commands;
        this.birthday = birthday;
    }

    public Animal() {
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCommands() {
        return commands;
    }

    public void setCommands(String commands) {
        this.commands = commands;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}
