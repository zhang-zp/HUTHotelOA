package dao.daoImp;

import dao.UserDao;
import entity.*;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.util.List;

public class UserDaoImp implements UserDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<User> user(int user,String pwd) throws Exception {

        String sql="select *" +
                " from (select staff_id as staff_id,password " +
                "from login where staff_id=? and password=?)," +
                "(select staff_id as sid,staff_num,staff_sex,staff_status,staff_name,staff_salary,staff_job,entry_time,fire_time,dept_name " +
                "from staff_info where staff_id=?)";
        return queryRunner.query(sql,new BeanListHandler<User>(User.class),user,pwd,user);

    }

    @Override
    public List<StaffInfo> staff(String user) throws Exception {
        String sql="select * from staff_info where  staff_id = ? ";
        return queryRunner.query(sql,new BeanListHandler<StaffInfo>(StaffInfo.class),user);
    }
}
