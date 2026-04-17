package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UserDto extends CommonDto {
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private String dateOfBirth;
    private String message;
    private String colour;
    private String message2;
    private String roleName;
    private List<String> roleNames;
}