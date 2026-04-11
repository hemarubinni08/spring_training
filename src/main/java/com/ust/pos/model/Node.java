package com.ust.pos.model;

import jakarta.persistence.Entity;

@Entity
public class Node extends CommonField{
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    private String path;
}
