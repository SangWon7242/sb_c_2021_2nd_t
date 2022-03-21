package com.psw.exam.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;


@SpringBootApplication
@EnableEncryptableProperties
public class DemoTest1Application {

	public static void main(String[] args) {
		SpringApplication.run(DemoTest1Application.class, args);
	}
	
}
