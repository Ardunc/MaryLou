package com.caps.marylou.marylou.controller;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.caps.marylou.marylou.repository.RecipeRepository;
import com.caps.marylou.marylou.repository.UserRepository;
import com.caps.marylou.marylou.validation.DataValidation;
import com.caps.marylou.marylou.*;
import com.caps.marylou.marylou.model.*;

@Controller
//@SessionAttributes("loggedInUser")
public class AppController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RecipeRepository recipeRepository;
	
	@Autowired 
	WebUtils webUtils;
	
	@Autowired
	private DataValidation dataValidation;

	@Autowired
	public AppController(UserRepository userRepository, RecipeRepository recipeRepository, DataValidation dataValidation) {
		super();
		this.userRepository = userRepository;
		this.dataValidation = dataValidation;
		this.recipeRepository = recipeRepository;
	}
	
	@GetMapping({"index", "/"})
	//@ResponseBody
	public String index(Model model) {
		model.addAttribute("msg", "Hello There...General Kenobi");
		model.addAttribute("alldb", userRepository.findAll());
		model.addAttribute("recipedb", recipeRepository.findAll());
		model.addAttribute("recipedbsize", recipeRepository.findAll().size()-1);
		return "index";
	}
	
	@GetMapping("about")
	//@ResponseBody
	public String about(Model model) {
		model.addAttribute("aboutme", "I killed them all. Not just the men, but the women and the children too.");
		return "about";
	}
	
	@GetMapping({"services"})
	//@ResponseBody
	public String services(Model model) {
		model.addAttribute("podracing", "Now THIS is podracing!");
		return "services";
	}
	
	@GetMapping("name")
	//@ResponseBody
	public String name(@RequestParam String id,Model model) {
		index(model);
		model.addAttribute("myname", id);
		return "index";
	}
	
	@GetMapping("getname-{id}")
	//@ResponseBody
	public String getname(@PathVariable String id,Model model) {
		model.addAttribute("getname", id);
		return "index";
	}
	
	@PostMapping("sendemail")
	public String sendemail(Model model, @RequestParam String email, @RequestParam String name, @RequestParam String subject, @RequestParam String message) {
		webUtils.sendMail(email, message, subject + " - " + name);
		model.addAttribute("msg", "Email Sent!");
		return "services";
	}
	
	@GetMapping("recipepage")
	public String recipePage(Model model, long recipeid) {
		Recipes recipe = recipeRepository.findByrecipeid(recipeid);
		List<String> ingredients = recipe.getInstructions().parseIngredients(recipe.getInstructions().getIngredient());
		List<String> instructions = recipe.getInstructions().parseSteps(recipe.getInstructions().getSteps());
		List<String> skus = recipe.getInstructions().parseSkus(recipe.getInstructions().getSkus());
		String[] prices = new String[skus.size()];
		List<String> urls = recipe.getInstructions().parseUrls(recipe.getInstructions().getUrl());


		for(int i=0; i < skus.size(); i++) {
		
		String sku = skus.get(i);
			
		final String url = "https://brickseek.com/walmart-inventory-checker/?sku=" + sku;
		
		try {
			 Document document = Jsoup.connect(url).get();
			
			Elements div = document.select(".item-overview__meta");
			
			String output = div.select(".price-formatted--style-normal.price-formatted").text();
			prices[i] = output;

			 
		}
		
		catch (Exception ex) {
			ex.printStackTrace();
		}
		}
		

		
		model.addAttribute("prices", prices);
		model.addAttribute("urls", urls);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("instructions", instructions);
		model.addAttribute("activerecipe", recipe);

		return "recipepage";
	}
	
	@GetMapping("newrecipe")
	public String newrecipe(Model model) {
		
		Recipes recipe = new Recipes();
		
		model.addAttribute("instructions", recipe.getInstructions());
		
		return "newrecipe";
	}


	@GetMapping("addrecipe")
	//@ResponseBody
	public String addrecipe(Model model) {
		model.addAttribute("msg", "Recipe Added");
		model.addAttribute("hidden", "");
		model.addAttribute("recipe", new Recipes());
		model.addAttribute("action", "addrecipe");
		return "addrecipe";
	}
	
	@PostMapping("addrecipe")
	public String addRecipe(Model model, @ModelAttribute Recipes recipe,
							BindingResult result, @RequestParam String[] ingredients, 
							@RequestParam String[] steps, @RequestParam String[] urls, @RequestParam String recipeName, 
							@RequestParam String summary, @RequestParam String servings, RedirectAttributes redirect) {
		
		String ing = new String();
		String step = new String();
		String skus = new String();
		String cost = new String();
		String myurls = new String();
		double totalPrice = 0;

		for(int i=0; i < ingredients.length; i++) {
			ing += ingredients[i];
			if(i!=ingredients.length-1) {
				ing+= "%";
			}
		}
		
		for(int j=0; j < steps.length; j++) {
			step += steps[j];
			if(j!=steps.length-1) {
				step+= "%";
			}
		}
		
		for(int k=0; k < urls.length; k++) {
			String[] temp = urls[k].split("/");
			skus += temp[temp.length-1];
			if(k!=urls.length-1) {
				skus+= "%";
			}
		}
		
		for(int m=0; m < urls.length; m++) {
			myurls += urls[m];
			if(m!=urls.length-1) {
				myurls+= "%";
			}
		}
		
		recipe.getInstructions().setSkus(skus);
		List<String> skuparsed = recipe.getInstructions().parseSkus(recipe.getInstructions().getSkus());
		
		for(int l=0; l < skuparsed.size()-1; l++) {		
			
				
				String sku = skuparsed.get(l);
					
				final String url = "https://brickseek.com/walmart-inventory-checker/?sku=" + sku;
				System.out.println(url);
				try {
					 Document document = Jsoup.connect(url).get();
					
					Elements div = document.select(".item-overview__meta");
					
					String output = div.select(".price-formatted--style-normal.price-formatted").text();
					cost += output;
					if(l!=recipe.getInstructions().getSkus().length()-1) {
						cost+= "%";
					}
					System.out.println(cost);
					double price = Double.parseDouble(output.substring(1));
					totalPrice += price;
								 
				}
				
				catch (Exception ex) {
					ex.printStackTrace();
				}
				
				
		}
		
		String totalstring = String.valueOf(totalPrice);
		recipe.getInstructions().setIngredient(ing);
		recipe.getInstructions().setSteps(step);
		recipe.getInstructions().setUrl(myurls);
		recipe.getInstructions().setPrices(cost);
		recipe.getInstructions().setTotalprice(totalstring);
		recipe.setSummary(summary);
		recipe.setName(recipeName);
		recipe.setServings(servings);
		
		
		recipeRepository.save(recipe);
		return "redirect:/recipepage?recipeid=" + String.valueOf(recipe.getRecipeid());
	}
	
	@GetMapping("deleterecipe")
	public String deleterecipe(@RequestParam long recipeid, RedirectAttributes redirect) {
		recipeRepository.deleteById(recipeid);
		redirect.addFlashAttribute("success", "Delete Success");
		return "redirect:/index";
	}
	
//	@PostMapping("login")
//	//@ResponseBody
//	public String login(@RequestParam String fname, @RequestParam String lname, Model model) {
//		model.addAttribute("name", "First Name: " + fname +"<br>Last Name: "+lname);
//		return "index";
//	}
	

	@ModelAttribute("user")
	Users user() {
		return new Users();
	}
	
//	@ModelAttribute("recipe")
//	Recipes recipe() {
//		return new Recipes();
//	}
}
