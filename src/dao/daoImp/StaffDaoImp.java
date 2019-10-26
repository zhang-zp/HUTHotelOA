package dao.daoImp;

import dao.StaffDao;
import entity.StaffInfo;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class StaffDaoImp implements StaffDao {

    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<StaffInfo> findAll() throws SQLException {
       String sql = "select * from staff_Info where staff_status='在职'";
       return queryRunner.query(sql,new BeanListHandler<StaffInfo>(StaffInfo.class));
    }

    @Override
    public StaffInfo findSelf(int id) throws SQLException {
        String sql = "select * from staff_Info where staff_id=?";
        return queryRunner.query(sql,new BeanHandler<StaffInfo>(StaffInfo.class),id);
    }

    @Override
    public void staffAdd(StaffInfo staffInfo) throws SQLException {
        String sql = "insert into staff_info(staff_id,staff_name,staff_num,staff_sex,dept_name," +
                "staff_job,staff_salary,entry_time,fire_time,staff_status,staff_age,staff_tel)values(?,?,?,?,?,?,?,?,?,?,?,?)";
        queryRunner.update(sql,staffInfo.getStaff_id(),staffInfo.getStaff_name(),staffInfo.getStaff_num(),
                staffInfo.getStaff_sex(),staffInfo.getDept_name(),staffInfo.getStaff_job(),staffInfo.getStaff_salary(),
                staffInfo.getEntry_time(),staffInfo.getFire_time(),staffInfo.getStaff_status(),staffInfo.getStaff_age(),staffInfo.getStaff_tel());
    }

    @Override
    public void deleteStaff(int staff_id) throws SQLException {
        String sql = "update staff_info set staff_status='离职' where staff_id=?";
        queryRunner.update(sql,staff_id);
    }

    @Override
    public boolean checkStaff_id(int staff_id) throws SQLException {
        String sql = "select *from staff_info where staff_id =?";
        StaffInfo staffInfo = queryRunner.query(sql,new BeanHandler<StaffInfo>(StaffInfo.class),staff_id);
        return staffInfo==null;
    }
}
