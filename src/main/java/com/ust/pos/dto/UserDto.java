package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class UserDto extends CommonDto {
    private int age;
    private LocalDate dateOfBirth;
    private String roleName;
    private List<String> roles;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;

}
