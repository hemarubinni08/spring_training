package com.ust.pos;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@SpringBootApplication
@ComponentScan(
        {
                "com.ust.pos.web.controller",
                "com.ust.pos"
        }
)
public class PosApplication {
    @Autowired
    private Environment environment;


    public static void main(String[] args) {
        SpringApplication.run(PosApplication.class, args);
    }

    @Bean
    ModelMapper getModelMapper() {
        return new ModelMapper();
    }

    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(getDataSource());

    }

    @Bean
    DataSource getDataSource() {
        DriverManagerDataSource dc = new DriverManagerDataSource();
        dc.setUrl(environment.getProperty("spring.datasource.url"));
        dc.setUsername(environment.getProperty("spring.datasource.username"));
        dc.setPassword(environment.getProperty("spring.datasource.password"));
        dc.setDriverClassName(environment.getProperty("spring.datasource.driver-class-name"));
        return dc;
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}
