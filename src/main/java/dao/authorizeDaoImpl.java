package dao;

import Entities.Authorities;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 * Created by fadie on 7/7/2017.
 */
@Repository
public class authorizeDaoImpl implements authorizeDao{
    SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void saveAuth(Authorities authorities) {

        sessionFactory.getCurrentSession().save(authorities);
    }
}
