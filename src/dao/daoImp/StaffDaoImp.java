package dao.daoImp;

import dao.StaffDao;
import entity.StaffInfo;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class StaffDaoImp implements StaffDao {

    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<StaffInfo> findAll() throws SQLException {
       String sql = "select * from staff_Info";
       return queryRunner.query(sql,new BeanListHandler<StaffInfo>(StaffInfo.class));
    }
}
