package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class UserDto extends CommonDto {
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private LocalDate dateOfBirth;
    private boolean success;
    private String message;
    private String role;
    private List<String> roles;
}