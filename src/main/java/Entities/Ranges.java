package Entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by fadie on 7/10/2017.
 */
@Entity
public class Ranges {
    private int id;
    private int start;
    private int end;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "start")
    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    @Basic
    @Column(name = "end")
    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ranges ranges = (Ranges) o;

        if (id != ranges.id) return false;
        if (start != ranges.start) return false;
        if (end != ranges.end) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + start;
        result = 31 * result + end;
        return result;
    }
}
