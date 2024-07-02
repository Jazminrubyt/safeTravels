package com.codingdojo.SafeTravels.repositories;



import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.SafeTravels.models.ExpenseModel;



@Repository
public interface ExpenseRepo extends CrudRepository<ExpenseModel, Long>{
	List<ExpenseModel> findAll(); // get all query: we are overwriting the return type for our benefit
}