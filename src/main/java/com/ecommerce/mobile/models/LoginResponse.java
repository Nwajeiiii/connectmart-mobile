package com.ecommerce.mobile.models;

import lombok.Data;

@Data
public class LoginResponse {

    private String responseCode;
    private String responseMessage;
    private String userId;
    private String userType;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;

}
