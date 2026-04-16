package com.ust.pos.model;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Entity
@Getter
@Setter
public class Node extends Common {
    private String path;
    private String role;
    private List<String> roles;
}
