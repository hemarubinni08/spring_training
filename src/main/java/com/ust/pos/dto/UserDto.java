package com.ust.pos.dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserDto {
    private Long id;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private Date dateOfBirth;

}
