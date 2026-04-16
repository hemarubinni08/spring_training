package com.ust.pos.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table
public class User extends CommonFields {

    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private Date dateOfBirth;
    private String role;
    private List<String> roles;
}
