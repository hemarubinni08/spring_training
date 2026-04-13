package com.ust.pos.dto;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Getter
@Setter
public class UserDto extends CommonDto {
    private int age;
    private LocalDate dateOfBirth;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;

}
