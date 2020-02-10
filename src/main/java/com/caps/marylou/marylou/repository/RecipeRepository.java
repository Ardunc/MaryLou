package com.caps.marylou.marylou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.caps.marylou.marylou.model.Recipes;


@Repository
public interface RecipeRepository extends JpaRepository<Recipes, Long>{
	
	Recipes findByrecipeid(long id);
}
