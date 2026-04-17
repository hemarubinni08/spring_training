package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NodeDto extends CommonField {
    private String path;
    private List<String> roles;
}
