package ukol2.beans;

import java.util.ArrayList;
import java.util.List;

public class UsersBean {
	
	private List<UserBean> users = new ArrayList<UserBean>();

	public List<UserBean> getUsers() {
		return users;
	}

	public void setUsers(List<UserBean> users) {
		this.users = users;
	}

}
