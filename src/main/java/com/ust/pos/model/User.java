package com.ust.pos.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;
}
