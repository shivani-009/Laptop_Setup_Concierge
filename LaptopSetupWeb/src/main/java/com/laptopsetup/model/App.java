package com.laptopsetup.model;

public class App {
    private String name;
    private String link;

    public App(String name, String link) {
        this.name = name;
        this.link = link;
    }

    public String getName() { return name; }
    public String getLink() { return link; }
}
