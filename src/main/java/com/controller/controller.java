package com.controller;

import Entities.Notes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.noteService;

import java.util.Date;

/**
 * Created by fadie on 6/5/2017.
 */
@Controller
public class controller {
    @Autowired(required = true)
    @Qualifier("noteService")
    noteService noteService;

    @RequestMapping(value = {"/", "/hello.html"}, method = RequestMethod.GET)
    public ModelAndView Main(@RequestParam(value = "v_code", required = false) String v_code) {
        UserDetails userDetails =
                (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String authority = userDetails.getAuthorities().toString();

        if (authority.equalsIgnoreCase("[ROLE_ADMIN]")) {
            ModelAndView mm = new ModelAndView("admin");
            return mm;
        }
        ModelAndView modelAndView = new ModelAndView("Home-User");

        return modelAndView;

    }


    //    ******************* save notes from admin panel ******************
    @ResponseBody
    @RequestMapping(value = "/saveNote.html", method = RequestMethod.POST)
    public ModelAndView SaveNotes(@RequestParam("rangeId") String rangeId, @RequestParam("note") String note) {

//
        Notes notes = new Notes();
        notes.setRangeId(Integer.parseInt(rangeId));
        notes.setNotes(note);
        notes.setDate(new java.sql.Date(new Date().getTime()));
        noteService.SaveNote(notes);

        ModelAndView modelAndView = new ModelAndView("admin");

        return modelAndView;

    }

}


