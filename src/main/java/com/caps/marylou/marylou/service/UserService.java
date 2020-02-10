package com.caps.marylou.marylou.service;

import java.util.List;
import java.util.Optional;

import com.caps.marylou.marylou.model.*;

public interface UserService {

	Optional<Users> findByEmail(String email);
	
	List<Users> findByLastName(String lname);
}
