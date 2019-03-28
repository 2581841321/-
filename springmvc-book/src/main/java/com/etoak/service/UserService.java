package com.etoak.service;

import com.etoak.bean.User;

public interface UserService {

	User queryUser(String name, String password);

}
