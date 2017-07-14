package service;

import Entities.Notes;
import dao.noteDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by fadie on 7/9/2017.
 */

@Service
public class noteServiceImpl implements noteService {
    dao.noteDao noteDao;

    public noteDao getNoteDao() {
        return noteDao;
    }

    public void setNoteDao(noteDao noteDao) {
        this.noteDao = noteDao;
    }


    @Transactional
    public List<String> GetrangeNotes(String rangeId, Date date) {
        return noteDao.GetrangeNotes(rangeId, date);
    }

    @Transactional
    public List<Notes> GEtSpecificNotes(int RangeId) {


        return noteDao.GEtSpecificNotes(RangeId);
    }

    @Transactional
    public List<Notes> DeleteRanges(int noteId, int rangeId) {


        return noteDao.DeleteRanges(noteId, rangeId);
    }
    @Transactional
    public void SaveNote(Notes notes) {

        noteDao.SaveNote(notes);

    }
}
