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
import javax.persistence.Transient;
import javax.validation.constraints.Size;


@Entity
public class Instructions {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@OneToOne(mappedBy = "instructions")
	private Recipes recipe;

	@Column(name="ingredient")
	@Size(min=0, max=8000)
	private String ingredient;
	
//	@Column(name="amount")
//	private String amount;
	
//	@Column(name="measurement")
//	private String measurement;

	@Column(name="steps")
	@Size(min=0, max=8000)
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

}
