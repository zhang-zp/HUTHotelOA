package dao;

import entity.Login;
import entity.StaffInfo;
import entity.User;

import java.util.List;

public interface UserDao {
    List<User> user(int user, String pwd) throws Exception;
    List<StaffInfo> staff(String user) throws Exception;
}
