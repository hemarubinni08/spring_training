package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Node extends CommonAttributes {
    private String path;
    private String role;
    private String roles;
}
