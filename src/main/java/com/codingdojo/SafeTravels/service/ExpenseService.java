package com.codingdojo.SafeTravels.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.codingdojo.SafeTravels.models.ExpenseModel;
import com.codingdojo.SafeTravels.repositories.ExpenseRepo;


@Service
public class ExpenseService {

	@Autowired
	ExpenseRepo eRepo;
	
// get all expenses
	public List<ExpenseModel> allExpenses(){
		return eRepo.findAll();
	}
	
	// create new Expense 
		public ExpenseModel newExpense(ExpenseModel Expense) {
			return eRepo.save(Expense);
		}
		
	// Get one Expense 
		public ExpenseModel oneExpense(Long id) {
		    Optional<ExpenseModel> Expense = eRepo.findById(id);
	        if(Expense.isPresent()) {
	            return Expense.get();
	        } else {
	            return null;
	        }
	    }
		
		public void deleteExpense(Long id) {
			eRepo.deleteById(id);
		}
		
		public ExpenseModel updateExpense(ExpenseModel Expense) {
			return eRepo.save(Expense);
		}
	}


