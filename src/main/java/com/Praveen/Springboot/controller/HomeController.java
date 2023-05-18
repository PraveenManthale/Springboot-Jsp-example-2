package com.Praveen.Springboot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.Praveen.Springboot.entity.Product;
import com.Praveen.Springboot.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

@Autowired
public ProductRepository productRepo;
@GetMapping("/")
public String home(Model m) {
// List<Product> list=productRepo.findAll();
// m.addAttribute("all_products",list);
return findPaginateAndSorting(0, m);
}

@GetMapping("/page/{pageNo}")
public String findPaginateAndSorting(@PathVariable(value="pageNo")int pageNo, Model m) {
Pageable pageable=PageRequest.of(pageNo,3);
Page<Product> page=productRepo.findAll(pageable);
List<Product> list=page.getContent();
m.addAttribute("pageNo", pageNo);
m.addAttribute("totalElements",page.getTotalElements());
m.addAttribute("totalPage", page.getTotalPages());
m.addAttribute("all_products", list);
return "index";
}

@GetMapping("/load_form")
public String loadform() {
return "add";
}

@GetMapping("/edit_form/{id}")

public String editform(@PathVariable(value="id")long id,Model m) {
Optional<Product> product=productRepo.findById(id);
Product pro=product.get();
m.addAttribute("product",pro);
return "edit";
}
@PostMapping("/save_products")
public String saveProduct(@ModelAttribute Product product, HttpSession session) {

productRepo.save(product);
session.setAttribute("msg", "Product Added Sucessfully");

return "redirect:/load_form";
}

@PostMapping("/update_products")
public String updateProduct(@ModelAttribute Product product, HttpSession session) {

productRepo.save(product);
session.setAttribute("msg", "Product update Sucessfully");

return "redirect:/";
}
@GetMapping("/delete/{id}")
public String deleteProduct(@PathVariable(value="id")long id,HttpSession session) {
productRepo.deleteById(id);
session.setAttribute("msg", "Product Deleted Sucessfully");
return "redirect:/";
}
}