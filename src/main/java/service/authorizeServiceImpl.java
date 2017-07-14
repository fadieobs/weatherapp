package service;

import Entities.Authorities;
import dao.authorizeDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by fadie on 7/7/2017.
 */
@Service
public class authorizeServiceImpl implements authorizeService {

    authorizeDao authorizeDao;

    public dao.authorizeDao getAuthorizeDao() {
        return authorizeDao;
    }

    public void setAuthorizeDao(dao.authorizeDao authorizeDao) {
        this.authorizeDao = authorizeDao;
    }

    @Transactional
    public void saveAuth(Authorities authorities) {
        authorizeDao.saveAuth(authorities);

    }
}
