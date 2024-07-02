 package com.codingdojo.SafeTravels.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;



import com.codingdojo.SafeTravels.models.ExpenseModel;
import com.codingdojo.SafeTravels.service.ExpenseService;


import jakarta.validation.Valid;


@Controller
public class HomeController {
	
	
	private final ExpenseService eService;
	
	public HomeController(ExpenseService eService) {
		this.eService = eService;
	}
	
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("expense") ExpenseModel expense){
		model.addAttribute("TheExpenses",eService.allExpenses());
		return "index.jsp";
	}

	@PostMapping("/newExpense")
	public String createNewExpense(@Valid @ModelAttribute("expense") ExpenseModel expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("TheExpenses",eService.allExpenses());
            return "index.jsp";
        } else {
            eService.newExpense(expense);
            return "redirect:/";
        }
	}
	@GetMapping("/expense/{id}")
	public String getOneExpense(Model model, @PathVariable("id") Long id) {
		ExpenseModel expense = eService.oneExpense(id);
		model.addAttribute(expense);
		return "oneExpense.jsp";
	}

	
	@DeleteMapping("expense/delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		eService.deleteExpense(id);
		return "redirect:/";
	}
	
	
	
    @GetMapping("/expense/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        ExpenseModel expense = eService.oneExpense(id);
        model.addAttribute(expense);
        return "edit.jsp";
    }
	
    @PutMapping("/expense/{id}/update")
    public String updateExpense(@Valid @ModelAttribute("expense") ExpenseModel expense, BindingResult result, Model model) {
    	if (result.hasErrors()) {
			model.addAttribute("expense", expense);
            return "edit.jsp";
        } else {
            eService.updateExpense(expense);
            return "redirect:/";
        }
    }
}
   