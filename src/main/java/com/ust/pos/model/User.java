package com.ust.pos.model;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Getter
@Setter
public class User extends CommonModel{

    private int age;
    private LocalDate dateOfBirth;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;

}
