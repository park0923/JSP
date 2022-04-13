package beans;

public class UserDto {
    private String id;
    private String pw;
    private String name;
    private String grade;

    public UserDto(String id, String pw, String name, String grade) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.grade = grade;
    }

    public UserDto() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}