package control;

import com.alibaba.fastjson.JSON;
import dao.UserDao;
import dao.daoImp.UserDaoImp;
import entity.Login;
import entity.StaffInfo;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("*.user")
public class UserControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDaoImp userDao=new UserDaoImp();
        String uri = req.getRequestURI();
        PrintWriter out=resp.getWriter();
        if(uri.indexOf("check")>=0){
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            try {
               List<User> userList=userDao.user(Integer.parseInt(username),password);

               String json=JSON.toJSONString(userList);


               out.write(json);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("main")>=0){
//            String staff=req.getParameter("staff");
            String dept=req.getParameter("dept_name");
            String name=req.getParameter("staff_name");
//            req.setAttribute("staffInfo",staff);
            req.setAttribute("dept",dept);
            req.setAttribute("name",name);
            req.getRequestDispatcher("main.jsp").forward(req,resp);
        }
    }
}
