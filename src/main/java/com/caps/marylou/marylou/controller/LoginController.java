package com.caps.marylou.marylou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.caps.marylou.marylou.model.Recipes;
import com.caps.marylou.marylou.model.Users;
import com.caps.marylou.marylou.repository.UserRepository;
import com.caps.marylou.marylou.validation.DataValidation;

@Controller
@SessionAttributes("loggedInUser")
public class LoginController {


	private UserRepository userRepository;

	@Autowired
	private DataValidation dataValidation;

	@Autowired
	public LoginController(UserRepository userRepository, DataValidation dataValidation) {
		super();
		this.userRepository = userRepository;
		this.dataValidation = dataValidation;
	}

	@GetMapping("profile")
	public String profile(Model model) {
		model.addAttribute("msg", "Welcome Back");
		return "profile";
	}

	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("msg", "Login");
		return "login";
	}
	

	@GetMapping("users")
	public String users(Model model) {
		model.addAttribute("msg", "All Users");
		model.addAttribute("alldb", userRepository.findAll());

		return "users";
	}

	@PostMapping("login")
	public String signin(@RequestParam String email, @RequestParam String password, Model model) {

		Users user= userRepository.findByEmail(email);
		if(user != null && password.equals(user.getPassword())) {
			model.addAttribute("msg", "Welcome " + user.getFname() + " " + user.getLname());
			model.addAttribute("loggedInUser", user);
		}
		else {
			model.addAttribute("error", "Invalid Credentials");
			return "login";
		}


		return "profile";
	}

	@GetMapping("logout")
	public String logout(Model model, WebRequest request, SessionStatus status, RedirectAttributes redirect) {
		status.setComplete();
		request.removeAttribute("loggedInUser", WebRequest.SCOPE_SESSION);
		redirect.addFlashAttribute("msg", "You have been signed out");
		return "redirect:/login";
	}

	@PostMapping("search")
	//@ResponseBody
	public String search(@RequestParam String name, Model model) {
		model.addAttribute("msg", userRepository.findByName(name).size() + " Found");
		model.addAttribute("alldb", userRepository.findByName(name));

		return "users";
	}

	@GetMapping("register")
	//@ResponseBody
	public String register(Model model) {
		model.addAttribute("msg", "Register");
		model.addAttribute("hidden", "");
		model.addAttribute("users", new Users());
		model.addAttribute("action", "register");
		return "register";
	}
	


	@PostMapping("register")
	public String register(@ModelAttribute Users user, 
			Model model, BindingResult result,
			RedirectAttributes redirect) {

		try {
			dataValidation.validate(user, result);
			if (result.hasErrors()) {
				model.addAttribute("error", "Required* fields");
				model.addAttribute("hidden", "");
				model.addAttribute("action", "register");
				return "register";
			}
			user.setRole("USER");
			userRepository.save(user);
			redirect.addFlashAttribute("success", "User "+user.getFname()+" saved");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return "redirect:/users";
	}

	@PostMapping("editrole")
	public String giverole(RedirectAttributes model, @RequestParam long id, @RequestParam String role) {

		Users user = userRepository.findById(id).get();
		if(user != null) {
			user.setRole(role);
			userRepository.save(user);
			model.addFlashAttribute("success", "Role Updated");
		}
		return "redirect:/users";
	}

	@GetMapping("delete")
	public String deleteuser(@RequestParam long id, RedirectAttributes redirect) {
		userRepository.deleteById(id);
		redirect.addFlashAttribute("success", "Delete Success");
		return "redirect:/users";
	}

	@GetMapping("update")
	public String updateuser(@RequestParam long id, Model model) {
		userRepository.findById(id);
		model.addAttribute("msg", "Update");
		model.addAttribute("users", userRepository.findById(id));
		model.addAttribute("hidden", "hidden");
		model.addAttribute("action", "updateUser");
		return "register";
	}
	//	ALTERNATE METHOD
	@PostMapping("updateUser")
	public String update(@ModelAttribute Users user, 
			Model model, BindingResult result) {
		dataValidation.validateUpdate(user, result);
		if (result.hasErrors()) {
			model.addAttribute("error", "Required* fields");
			model.addAttribute("hidden", "hidden");
			model.addAttribute("action", "updateUser");
			return "register";
		}
		try {
			Users usr= userRepository.findByEmail(user.getEmail());
			usr.setFname(user.getFname());
			usr.setLname(user.getLname());
			usr.setPhone(user.getPhone());
			userRepository.save(usr);     
			model.addAttribute("success", "User "+user.getFname()+" Updated");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return "redirect:/users";
	}

	@ModelAttribute("user")
	Users user() {
		return new Users();
	}
	
//	@ModelAttribute("recipe")
//	Recipes recipe() {
//		return new Recipes();
//	}
}
