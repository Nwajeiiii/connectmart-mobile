package com.ecommerce.mobile.services;

import com.ecommerce.mobile.entities.User;
import com.ecommerce.mobile.models.LoginRequest;
import com.ecommerce.mobile.models.LoginResponse;
import com.ecommerce.mobile.models.RegisterRequest;
import com.ecommerce.mobile.models.RegisterResponse;

import java.util.List;

public interface UserService {

    RegisterResponse registerUser(RegisterRequest request);

    LoginResponse loginUser(LoginRequest request);

    List<User> findAllUsers();

}
