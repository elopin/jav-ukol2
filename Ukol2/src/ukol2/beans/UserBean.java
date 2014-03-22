package ukol2.beans;

public class UserBean {
	
	private Long id;
	

	private String name;
	private String surname;
	private int year;

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getSurname() {
	return surname;
    }

    public void setSurname(String surname) {
	this.surname = surname;
    }

    public int getYear() {
	return year;
    }

    public void setYear(int year) {
	this.year = year;
    }
	
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

}
