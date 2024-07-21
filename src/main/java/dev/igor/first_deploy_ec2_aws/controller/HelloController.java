package dev.igor.first_deploy_ec2_aws.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("hello")
public class HelloController {
    private List<String> users = List.of("Igor", "Livia", "Henry");

    @GetMapping
    public String hello() {
        int result = (int) (Math.random() * users.size());
        return String.format("Hello, %s!!!", users.get(result));
    }
}
