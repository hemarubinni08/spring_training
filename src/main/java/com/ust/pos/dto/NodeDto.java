package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class NodeDto extends CommonDto {
    private String path;
    private boolean success;
    private String message;
    private List<String> roles;
}