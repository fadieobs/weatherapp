package dao;

import Entities.Users;

/**
 * Created by fadie on 7/6/2017.
 */
public interface userDao {

    public Users check_db_VCode(String v_code);

    boolean checkEmail(String Email);

    boolean saveUser(Users users);


    public void updateEnabled(Users users);
}
