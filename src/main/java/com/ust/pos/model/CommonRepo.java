package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface CommonRepo<T extends CommonClass, L extends Number> extends JpaRepository<T, Long> {
    T findByName(String name);
}
