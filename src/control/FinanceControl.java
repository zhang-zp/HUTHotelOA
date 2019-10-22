package control;

import dao.daoImp.FinanceImp;
import entity.RentRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("*.finance")
public class FinanceControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FinanceImp financeImp=new FinanceImp();
        String uri = req.getRequestURI();
        if(uri.indexOf("findiincome")>=0){
            String start=req.getParameter("starttime");
            String end=req.getParameter("endtime");
            try {
                List<RentRoom> rentRoomList=financeImp.findorderBytime(start,end);
                req.setAttribute("order",rentRoomList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
