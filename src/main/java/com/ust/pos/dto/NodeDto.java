package com.ust.pos.dto;

import java.util.List;

public class NodeDto extends CommonDto {

    private String path;
    private String role;
    private List<String> roles;

    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public List<String> getRoles() { return roles; }
    public void setRoles(List<String> roles) { this.roles = roles; }
}