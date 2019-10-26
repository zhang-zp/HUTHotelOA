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

    /**
     * 查看个人信息
     * @param id
     * @return
     */
    StaffInfo findSelf(int id) throws SQLException;

    /**
     * 添加员工
     * @param staffInfo
     */
    void staffAdd(StaffInfo staffInfo) throws SQLException;

    /**
     * 删除员工
     * @param staff_id
     */
    void deleteStaff(int staff_id) throws SQLException;

    /**
     * 员工工号检查，返回True表示工号可以用
     * @param staff_id
     * @return
     * @throws SQLException
     */
    boolean checkStaff_id(int staff_id) throws SQLException;
}
