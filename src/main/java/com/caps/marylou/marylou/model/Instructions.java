package com.caps.marylou.marylou.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;


@Entity
@Table(name="instructions")
public class Instructions {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@OneToOne(mappedBy = "instructions")
	private Recipes recipe;

	@Column(name="ingredient", columnDefinition ="TEXT")
//	@Size(min=0, max=6000)
	private String ingredient;
	
	@Column(name="prices")
	@Size(min=0, max=500)
	private String prices;
	
	@Column(name="totalprice")
	private String totalprice;
	
	@Column(name="url", columnDefinition="TEXT")
	private String url;
	
//	@Column(name="amount")
//	private String amount;
	
//	@Column(name="measurement")
//	private String measurement;

	@Column(name="skus")
	@Size(min=0, max=500)
	private String skus;

	@Column(name="steps", columnDefinition ="TEXT")
	private String steps;
	
//	@Transient
//	private String[] mytext;
//	
//	public String[] getMytext() {
//		return mytext;
//	}
//
//	public void setMytext(String[] mytext) {
//		this.mytext = mytext;
//	}
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}


	public String getPrices() {
		return prices;
	}

	public void setPrices(String prices) {
		this.prices = prices;
	}

	public String getSkus() {
		return skus;
	}

	public void setSkus(String skus) {
		this.skus = skus;
	}
	
	public String getSteps() {
		return steps;
	}

	public void setSteps(String steps) {
		this.steps = steps;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Recipes getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipes recipe) {
		this.recipe = recipe;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

//	public String getAmount() {
//		return amount;
//	}
//
//	public void setAmount(String amount) {
//		this.amount = amount;
//	}
//
//	public String getMeasurement() {
//		return measurement;
//	}
//
//	public void setMeasurement(String measurement) {
//		this.measurement = measurement;
//	}

	public List<String> parseSteps(String steps){
		String[] temp = steps.split("%");
		
		List<String> inst = new ArrayList<String>();
		inst= Arrays.asList(temp);
		
		return inst;
	}
	
	public List<String> parseIngredients(String ingredients){
		String[] temp = ingredients.split("%");
		
		List<String> ingr = new ArrayList<String>();
		ingr= Arrays.asList(temp);
		
		return ingr;
	}
	
	public List<String> parseSkus(String skus){
		String[] temp = skus.split("%");
		
		List<String> sku = new ArrayList<String>();
		sku= Arrays.asList(temp);
		
		return sku;
	}
	
	public List<String> parsePrices(String prices){
		String[] temp = prices.split("%");
		
		List<String> price = new ArrayList<String>();
		price= Arrays.asList(temp);
		
		return price;
	}
	
	public List<String> parseUrls(String urls){
		String[] temp = urls.split("%");
		
		List<String> url = new ArrayList<String>();
		url= Arrays.asList(temp);
		
		return url;
	}

}
