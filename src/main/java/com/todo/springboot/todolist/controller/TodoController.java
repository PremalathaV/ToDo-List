package com.todo.springboot.todolist.controller;

import com.todo.springboot.todolist.model.Todo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

@Controller
public class TodoController {
    

    private final List<Todo> todos = new ArrayList<>();
    private final AtomicLong idGen = new AtomicLong(1);

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("todos", todos);
        return "index"; // resolves to /WEB-INF/views/index.jsp
    }

    @PostMapping("/add")
    public String addTodo(@RequestParam("title") String title) {
        if (title != null && !title.trim().isEmpty()) {
            todos.add(new Todo(idGen.getAndIncrement(), title.trim()));
        }
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String deleteTodo(@RequestParam("id") Long id) {
        todos.removeIf(t -> Objects.equals(t.getId(), id));
        return "redirect:/";
    }

}








    
