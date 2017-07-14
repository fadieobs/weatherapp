package dao;

/**
 * Created by fadie on 7/6/2017.
 */

import Entities.Users;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class userDaoImpl implements userDao {
    SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public Users check_db_VCode(String v_code) {

        Users users = (Users) sessionFactory.getCurrentSession().createCriteria(Users.class)
                .add(Restrictions.eq("verifyCode", v_code)).uniqueResult();
        if (users != null) {
            return users;
        }


        return null;

    }

    public boolean checkEmail(String Email) {
        Users users = (Users) sessionFactory.getCurrentSession().createCriteria(Users.class)
                .add(Restrictions.eq("emailaddress", Email)).uniqueResult();
        if(users ==null){
            return  true;
        }

        return false;
    }

    public boolean saveUser(Users users) {
        boolean f=false;

        try{

            sessionFactory.getCurrentSession().save(users);
            f=true;
        }
        catch(Exception e){
            f=false;
            e.printStackTrace();
        }

        return f;
    }

    public void updateEnabled(Users users) {
        sessionFactory.getCurrentSession().update(users);
    }


}
