package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class UserDto {
    private long id;
    private int age;
    private LocalDate dateOfBirth;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;

    private String message;
    private String colour;
    private String message2;

}
