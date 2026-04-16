package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
public class User extends Common {
    private int age;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private Date dateOfBirth;
    private String role;
    private List<String> roles;
}