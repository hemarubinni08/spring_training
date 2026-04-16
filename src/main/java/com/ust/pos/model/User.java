package com.ust.pos.model;

import jakarta.persistence.Entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
public class User extends CommonField {
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfBirth;
    private String role;
    private List<String> roles;

}
