package com.ust.pos.dto;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;


@Table
@Getter
@Setter
public class CommonDto {
    private Long id;
    private String name;
}
