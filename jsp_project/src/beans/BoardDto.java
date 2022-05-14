package beans;

import java.util.Date;

public class BoardDto {
    private Integer id;
    private String title;
    private String contents;
    private String writer;
    private Integer reedCount;
    private Date createDay;
    private Date updateDay;

    public BoardDto() {}

    public BoardDto(Integer id, String title, String contents, String writer, Integer reedCount, Date createDay, Date updateDay) {
        this.id = id;
        this.title = title;
        this.contents = contents;
        this.writer = writer;
        this.reedCount = reedCount;
        this.createDay = createDay;
        this.updateDay = updateDay;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Integer getReedCount() {
        return reedCount;
    }

    public void setReedCount(Integer reedCount) {
        this.reedCount = reedCount;
    }

    public Date getCreateDay() {
        return createDay;
    }

    public void setCreateDay(Date createDay) {
        this.createDay = createDay;
    }

    public Date getUpdateDay() {
        return updateDay;
    }

    public void setUpdateDay(Date updateDay) {
        this.updateDay = updateDay;
    }
}
