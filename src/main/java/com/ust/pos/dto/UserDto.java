package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;

@Getter
@Setter
public class UserDto {
    private Long id;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private String dateOfBirth;
    private String message;
    private boolean success;
}
