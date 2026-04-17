package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserDto {
    boolean isSuccess = true;
    private Long id;
    private String name;
    private String userName;
    private int age;
    private String email;
    private String phoneNo;
    private String password;
    private Date dateOfBirth;
    private String role;
    private String roles;
}