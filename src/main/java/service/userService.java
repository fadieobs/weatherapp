package service;

import Entities.Users;
import org.springframework.stereotype.Service;

/**
 * Created by fadie on 7/6/2017.
 */
public interface userService {

    public Users check_db_VCode(String v_code);
    boolean checkEmail(String Email);
    public boolean saveUser(Users users);


    public void updateEnabled(Users users);
}
