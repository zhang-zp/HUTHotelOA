package control;

import com.alibaba.fastjson.JSON;
import dao.daoImp.FinanceImp;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("*.finance")
public class FinanceControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FinanceImp financeImp=new FinanceImp();
        String uri = req.getRequestURI();
        PrintWriter out=resp.getWriter();
        //按时间段查找工资
        if(uri.indexOf("findincome")>=0){
            String start=req.getParameter("starttime");
            String end=req.getParameter("endtime");
            try {
                List<RentRoom> rentRoomList=financeImp.findorderBytime(start,end);
                String jsonstr0= JSON.toJSONString(rentRoomList);
                out.print(jsonstr0);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //查询支出明细
        }else if(uri.indexOf("findexpend")>=0){
            try {
                List<Expend> purchaseList=financeImp.findexpend();
                String jsonstr1=JSON.toJSONString(purchaseList);
                out.print(jsonstr1);

            } catch (Exception e) {
                e.printStackTrace();
            }
            //查询工资支出
        }else if(uri.indexOf("findsalary")>=0){
            List<Payoff> payoffList= null;
            try {
                payoffList = financeImp.payoff();
                String jsonstr2=JSON.toJSONString(payoffList);
                out.print(jsonstr2);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }else if(uri.indexOf("statementmonth")>=0){
            try {
                List<Statistic> statisticList=financeImp.statistic();
                String jsonstr3=JSON.toJSONString(statisticList);
                out.print(jsonstr3);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("statementyear")>=0){
            try {
                List<StatisticYear> statisticList=financeImp.statisticyear();
                String jsonstr4=JSON.toJSONString(statisticList);
                out.print(jsonstr4);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("histogrammonth")>=0){
            String selectyear=req.getParameter("selectyear");
            try {
                List<Statistic> statisticList1=financeImp.selectyear(selectyear);
                String jsonstr5=JSON.toJSONString(statisticList1);
                out.write(jsonstr5);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
