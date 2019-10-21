package dao;

import entity.StaffInfo;

import java.sql.SQLException;
import java.util.List;

public interface StaffDao {

    /**
     * 查看所有员工
     * @return
     * @throws SQLException
     */
    List<StaffInfo> findAll() throws SQLException;
}
