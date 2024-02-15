package com.ecommerce.mobile.controllers;

import com.ecommerce.mobile.entities.User;
import com.ecommerce.mobile.models.LoginRequest;
import com.ecommerce.mobile.models.LoginResponse;
import com.ecommerce.mobile.models.RegisterRequest;
import com.ecommerce.mobile.models.RegisterResponse;
import com.ecommerce.mobile.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/users")
@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/register")
    public RegisterResponse registerUser(@RequestBody RegisterRequest request){
        return this.userService.registerUser(request);
    }

    @PostMapping("/login")
    public LoginResponse loginUser(@RequestBody LoginRequest request){
        return this.userService.loginUser(request);
    }

    @GetMapping
    public List<User> findAllUser(){
        return this.userService.findAllUsers();
    }

}
