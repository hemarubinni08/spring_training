package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
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
    private String role;
    private List<String> roles;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;
}
