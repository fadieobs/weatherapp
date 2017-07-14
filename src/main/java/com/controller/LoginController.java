package com.controller;

import Encryption.passEncrypt;
import Entities.Authorities;
import Entities.Users;
import mail.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.authorizeService;
import service.userService;

import javax.validation.Valid;

/**
 * Created by fadie on 6/5/2017.
 */
@Controller
public class LoginController {

    //************* database *********************
    @Autowired(required = true)
    @Qualifier("userService")
    userService userService;
    @Autowired(required = true)
    @Qualifier("authorizeService")
    authorizeService authorizeService;


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView AdminPage() {

        ModelAndView modelAndView = new ModelAndView("admin");

        return modelAndView;

    }


    //    *************** Login url Request *********************
    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public ModelAndView Login(@RequestParam(value = "v_code", required = false) String v_code) {

        ModelAndView model = new ModelAndView("index");

        // check if vcode is null ...
        if (v_code != null) {
            // check v code in Database ******
            Users users = userService.check_db_VCode(v_code);
            if (users != null) {
                // change enabled = 1 in database to Enable Login
                users.setEnabled(1);
                userService.updateEnabled(users);


                String verfyMessage = "Done Verification Email ...";
                model.addObject("verify", verfyMessage);


            } else {
                ModelAndView modell = new ModelAndView("signup");
                return modell;

            }


        }
        return model;


    }


    @RequestMapping(value = "/loginFail.html", method = RequestMethod.GET)
    public ModelAndView LoginFail() {

        ModelAndView model = new ModelAndView("index");
        model.addObject("error", "true");
        return model;


    }

    @RequestMapping(value = "/logout.html", method = RequestMethod.GET)
    public ModelAndView Logout() {

        ModelAndView model = new ModelAndView("logout");
        return model;


    }

    @RequestMapping(value = "/signpage.html", method = RequestMethod.GET)
    public ModelAndView SignPage() {

        ModelAndView modelAndView = new ModelAndView("signup");

        return modelAndView;

    }


    //403.html
    @RequestMapping(value = "/403.html", method = RequestMethod.GET)
    public ModelAndView ErrorPage() {

        ModelAndView model = new ModelAndView("403");
        return model;


    }

    //    confirm_password
    @RequestMapping(value = "/adduser.html", method = RequestMethod.POST)
    public ModelAndView AddUser(@RequestParam("confirm_password") String confirm_password, @Valid @ModelAttribute("users") Users users, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            System.out.println("Exist Error .. ...");
            ModelAndView mm = new ModelAndView("signup");
            return mm;

        }

        if (confirm_password.equalsIgnoreCase(users.getPassword())) {

            boolean check = userService.checkEmail(users.getEmailaddress());

            if (check) {

                // *** save user into database *********** and send Email Confirm ***
                // encrypted password to store into database
                String Realpass = users.getPassword();
                String encryptedPass = passEncrypt.BCryptPassword(Realpass);
                users.setPassword(encryptedPass);
                // generate verification Code
                String VerificationCode = java.util.UUID.randomUUID().toString();

                // set user additional data
                users.setEnabled(0);
                users.setStatus(0);
                users.setVerifyCode(VerificationCode);

                // save user to database
                userService.saveUser(users);

                // save user authorization ***
                Authorities authorities = new Authorities();
                authorities.setUsername(users.getUsername());
                authorities.setEmailaddress(users.getEmailaddress());
                authorities.setAuthority("ROLE_USER");
                authorizeService.saveAuth(authorities);

                // send user Confirm Email
                String username = "fadieole";
                String password = "fadiemohamed";
                String to = users.getEmailaddress();//change accordingly
                String from = "fadieole@gmail.com";//change accordingly
                String host = "smtp.gmail.com";//or IP address
                // send confirm email *******
                SendEmail.SendEmail(to, from, host, username, password, VerificationCode);

                ModelAndView mm = new ModelAndView("index");
                mm.addObject("verify", "Send Confirmation to Email ..");
                return mm;


            } else {
                ModelAndView modelAndView = new ModelAndView("signup");
                modelAndView.addObject("errorEmail", "This Email Exists ... ");
                return modelAndView;
            }


        } else {

            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("passerror", "Two Passwords not matches .");
            return modelAndView;


        }


    }


}
