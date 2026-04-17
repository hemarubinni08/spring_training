package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NodeDto {
    private Long id;
    private String name;
    private String path;
    private String message;
    private String role;
    private String roles;
}
