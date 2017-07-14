package dao;

import Entities.Notes;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by fadie on 7/9/2017.
 */
@Repository
public class notesDaoImpl implements noteDao {

    SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public List<String> GetrangeNotes(String rangeId, Date date) {
        Session session = sessionFactory.getCurrentSession();


        Query query = session.createQuery("select n.notes  from Notes n where n.rangeId=:id and n.date=:date");
        query.setParameter("id", Integer.parseInt(rangeId));
        query.setParameter("date", date);

        List<String> arrayList= query.list();

        System.out.println(arrayList+"   @@@@@@@@@@@@@@@@@@@@@@@@@");

        return arrayList;
    }

    public List<Notes> GEtSpecificNotes(int RangeId) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Notes n where n.rangeId=:id");
        query.setParameter("id", RangeId);
        List<Notes> list = query.list();

        return list;
    }

    public List<Notes> DeleteRanges(int noteId, int rangeId) {
        Session session = sessionFactory.getCurrentSession();
        Query query1 = session.createQuery("delete from Notes n where n.id=:id and n.rangeId=:rId");
        query1.setParameter("id", noteId);
        query1.setParameter("rId", rangeId);
        System.out.println(query1.executeUpdate());

        Query query2 = session.createQuery("from Notes n where n.rangeId=:id");
        query2.setParameter("id", rangeId);
        List<Notes> list = query2.list();

//        List<Notes> list = GEtSpecificNotes(rangeId);


        return list;
    }


    //**************** save Notes *******************************
    public void SaveNote(Notes notes) {
        Session session = sessionFactory.getCurrentSession();
        session.save(notes);


    }


}
