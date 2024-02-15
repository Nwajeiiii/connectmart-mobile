package com.ecommerce.mobile.services;

import com.ecommerce.mobile.entities.User;
import com.ecommerce.mobile.models.LoginRequest;
import com.ecommerce.mobile.models.LoginResponse;
import com.ecommerce.mobile.models.RegisterRequest;
import com.ecommerce.mobile.models.RegisterResponse;
import com.ecommerce.mobile.repositories.UserRepository;
import com.ecommerce.mobile.utilities.UserType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public RegisterResponse registerUser(RegisterRequest request) {
        RegisterResponse response = new RegisterResponse();
        User user = new User();

        // verify no field is null
        if (request.getEmail() == null || request.getPassword() == null || request.getFirstName() == null ||
                request.getLastName() == null || request.getPhoneNumber() == null) {
            response.setResponseMessage("No field must be null");
            response.setResponseCode("999");
            response.setUserId(null);
            return response;
        }

        // verify email contains @ symbol
        if (!verifyEmail(request.getEmail())) {
            response.setUserId(null);
            response.setResponseCode("999");
            response.setResponseMessage("Email must contain @ symbol");
            return response;
        }

        // verify phone number
        if(!verifyPhonenumber(request.getPhoneNumber())){
            response.setUserId(null);
            response.setResponseCode("999");
            response.setResponseMessage("Email a valid phone number");
            return response;
        }

        // get user id from email
        String userId = request.getEmail().substring(0, request.getEmail().indexOf('@'));

        // save new user to database
        user.setUserId(userId);
        user.setPassword(request.getPassword());
        user.setEmail(request.getEmail());
        user.setPhoneNumber(request.getPhoneNumber());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setUserType(UserType.valueOf(request.getUserType()));

        try{
            this.userRepository.save(user);
        } catch (Exception e) {
            response.setUserId(null);
            response.setResponseCode("999");
            response.setResponseMessage(e.toString());
            return response;
        }

        response.setResponseMessage("success");
        response.setResponseCode("000");
        response.setUserId(userId);
        response.setUserType(request.getUserType());
        response.setEmail(user.getEmail());
        response.setFirstName(user.getFirstName());
        response.setLastName(user.getLastName());
        response.setPhoneNumber(user.getPhoneNumber());

        return response;
    }

    @Override
    public LoginResponse loginUser(LoginRequest request) {
        LoginResponse response = new LoginResponse();
        User user = this.userRepository.findByEmail(request.getEmail());

        // check if user exists
        if(user == null) {
            response.setUserId(null);
            response.setResponseCode("999");
            response.setResponseMessage("no such user exists");
            return response;
        }

        // check if password is correct
        if(!user.getPassword().equals(request.getPassword())){
            response.setUserId(null);
            response.setResponseCode("999");
            response.setResponseMessage("the password is incorrect");
            return response;
        }

        // log user in
        response.setResponseMessage("success");
        response.setResponseCode("000");
        response.setUserId(user.getUserId());
        response.setUserType(user.getUserType().toString());
        response.setFirstName(user.getFirstName());
        response.setEmail(user.getEmail());
        response.setLastName(user.getLastName());
        response.setPhoneNumber(user.getPhoneNumber());

        return response;
    }

    @Override
    public List<User> findAllUsers() {
        return this.userRepository.findAll();
    }

    private boolean verifyEmail(String email) {
        return email.contains(Character.toString('@'));
    }

    private boolean verifyPhonenumber(String phoneNumber){
        return (phoneNumber.length() == 11 && phoneNumber.matches("0\\d{10}"));
    }
}
