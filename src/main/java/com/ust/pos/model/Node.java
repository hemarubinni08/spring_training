package com.ust.pos.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter

public class Node extends CommonData {
    private String path;
    private String role;
    private List<String> roles;
}
