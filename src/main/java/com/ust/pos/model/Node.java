package com.ust.pos.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Table(name = "node")
@Entity
@Getter
@Setter
public class Node extends CommonAttributes {

    private String path;
    private String role;
    private String roles;

}
