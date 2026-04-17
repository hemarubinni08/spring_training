package com.ust.pos.dto;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Table
@Getter
@Setter
public class UserDto {
    private long id;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private Date dateOfBirth;
    private boolean isSuccess;
    private String role;
    private List<String> roles;
}
