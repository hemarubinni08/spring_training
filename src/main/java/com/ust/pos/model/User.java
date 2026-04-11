package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.*;

import java.util.Date;
@Entity
@Getter
@Setter


public class User extends CommonField {

    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private Date dateOfBirth;
}
