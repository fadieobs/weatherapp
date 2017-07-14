package service;

import Entities.Users;
import dao.userDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by fadie on 7/6/2017.
 */
@Service
public class userServiceImpl implements userService {
    userDao userDao;

    public dao.userDao getUserDao() {
        return userDao;
    }

    public void setUserDao(dao.userDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public Users check_db_VCode(String v_code) {
        return userDao.check_db_VCode(v_code);
    }
    @Transactional
    public boolean checkEmail(String Email) {
        return userDao.checkEmail(Email);
    }
    @Transactional
    public boolean saveUser(Users users) {
        return userDao.saveUser(users);
    }

    @Transactional
    public void updateEnabled(Users users) {
        userDao.updateEnabled(users);
    }
}
