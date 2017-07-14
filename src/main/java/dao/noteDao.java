package dao;

import Entities.Notes;

import java.util.Date;
import java.util.List;

/**
 * Created by fadie on 7/9/2017.
 */
public interface noteDao {

    public List<String> GetrangeNotes(String RangeId, Date date);

    public List<Notes> GEtSpecificNotes(int RangeId);

    public List<Notes> DeleteRanges(int noteId, int rangeId);

    public void SaveNote(Notes notes);


}
