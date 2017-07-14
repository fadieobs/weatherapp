package Entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by fadie on 7/11/2017.
 */
@Entity
public class Notes {
    private int id;
    private String notes;
    private int rangeId;
    private Date date;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "notes")
    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Basic
    @Column(name = "range_id")
    public int getRangeId() {
        return rangeId;
    }

    public void setRangeId(int rangeId) {
        this.rangeId = rangeId;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Notes notes1 = (Notes) o;

        if (id != notes1.id) return false;
        if (rangeId != notes1.rangeId) return false;
        if (notes != null ? !notes.equals(notes1.notes) : notes1.notes != null) return false;
        if (date != null ? !date.equals(notes1.date) : notes1.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (notes != null ? notes.hashCode() : 0);
        result = 31 * result + rangeId;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
