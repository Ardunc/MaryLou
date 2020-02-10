package com.caps.marylou.marylou.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="recipes")
public class Recipes {
	
	public Recipes() {
		this.instructions = new Instructions();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="recipeid")
	private long recipeid;



	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="instructions_id", referencedColumnName = "id")
	private Instructions instructions;
	
	@Column(name="name")
	private String name;
	
	@Column(name="summary")
	@Size(min=0, max=8000)
	private String summary;
	
	@Column(name="servings")
	private String servings;

	public String getServings() {
		return servings;
	}

	public void setServings(String servings) {
		this.servings = servings;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public long getRecipeid() {
		return recipeid;
	}
	
	@Transient
	MultipartFile file;
	private String image;
	
	

	
	public void setRecipeid(long recipeid) {
		this.recipeid = recipeid;
	}

	public Instructions getInstructions() {
		return instructions;
	}

	public void setInstructions(Instructions instructions) {
		this.instructions = instructions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


	
}
