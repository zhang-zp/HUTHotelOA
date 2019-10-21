package control;

import dao.StaffDao;
import dao.daoImp.StaffDaoImp;
import entity.StaffInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.staff")
public class StaffControl extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        StaffDao staffDao = new StaffDaoImp();

        if(uri.indexOf("allInfo")>=0){
            try {
                List<StaffInfo> list = staffDao.findAll();
                req.setAttribute("staffInfo",list);
                req.getRequestDispatcher("staff_AllInfo.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
