package com.ust.pos.model;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
public class Node extends CommonEntity {
    private String path;

    private String role;
    private List<String> roles;

}
