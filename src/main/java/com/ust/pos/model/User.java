package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
public class User extends CommonFields {
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private LocalDate dateOfBirth;
    private String role;
    private List<String> roles;
}