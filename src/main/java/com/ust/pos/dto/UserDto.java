package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class UserDto {
    private Long id;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private String newPassword;
    private int age;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfBirth;
    private String message;
    private boolean success;
    private String role;
    private List<String> roles;
}
