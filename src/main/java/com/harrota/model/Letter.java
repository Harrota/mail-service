package com.harrota.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Letter {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String subject;

    private String text;

    public Letter() {
    }

    public Letter(String subject, String text) {
        this.subject = subject;
        this.text = text;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
