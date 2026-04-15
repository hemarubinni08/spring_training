package com.ust.pos.model;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import java.util.List;

@Entity
public class Node extends CommonField {

    private String path;
    private String role;

    @ElementCollection
    private List<String> roles;

    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public List<String> getRoles() { return roles; }
    public void setRoles(List<String> roles) { this.roles = roles; }
}