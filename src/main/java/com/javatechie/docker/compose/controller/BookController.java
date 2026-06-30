package com.javatechie.docker.compose.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {
    @GetMapping("/books")
    public String test() {
        return "Book Controller Working!";
    }

}
