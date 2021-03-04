package Controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AdministratorDao;
import Dao.StudentDao;
import Dao.UserDao;
import Model.Administrator;
import Model.Student;
import Model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");
        String autoLogin = request.getParameter("autologin");
        String checkCode = request.getParameter("check_code");
        String savedCode = (String) request.getSession().getAttribute("check_code");

        System.out.println(username + " " + password + " " + checkCode + " "
                + savedCode + " " + identity);
        if(username != null && password != null){
            System.out.println("账号密码不为空");
            //账号密码不为空
            if(checkCode.equals(savedCode)) {
                //验证码正确
                System.out.println("验证码正确");
                if(identity !=null) {
                    if(identity.equals("admin")){		//教师
                        try{
                            System.out.println("进入教师");
                            AdministratorDao adminDao = new AdministratorDao();
                            Administrator admin = adminDao.find(username);
                            if (admin != null){
                                if (admin.getTcPassword().equals(password)) {
                                    System.out.println("ok");
                                    function1(username, password, autoLogin, 1, request, response);
                                }
                            } else {
                                request.setAttribute("errerMsg", "没有该教师");
                                request.getRequestDispatcher("jsp/Login.jsp").forward(request, response);
                            }
                        } catch (Exception ee) {
                            ee.printStackTrace();
                        }
                    } else if (identity.equals("student")){			//学生
                        try{
                            System.out.println("进入学生");
                            StudentDao stuDao = new StudentDao();
                            Student student = stuDao.find(username);
                            if (student != null) {
                                if (student.getStuPassword().equals(password)){
                                    System.out.println("ok");
                                    function1(username, password, autoLogin, 2, request, response);
                                }
                            } else {
                                request.setAttribute("errerMsg", "没有该学生");
                                request.getRequestDispatcher("jsp/Login.jsp").forward(request, response);
                            }
                        } catch (Exception ee) {
                            ee.printStackTrace();
                        }
                    }
                } else {
                    request.setAttribute("errerMsg", "身份为空");
                    request.getRequestDispatcher("jsp/Login.jsp").forward(request, response);
                }
            } else {
                //验证不正确
                request.setAttribute("errerMsg", "验证码错误");
                request.getRequestDispatcher("jsp/Login.jsp").forward(request, response);
            }
        } else {
            //账号或密码为空
            request.setAttribute("errerMsg", "用户名或密码不能为空");
            request.getRequestDispatcher("jsp/Login.jsp").forward(request, response);
        }
    }

    private void function1(String username, String password, String autoLogin, int num,
                           HttpServletRequest request, HttpServletResponse response) throws IOException{
        //将用户状态user对象存入session域
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        if (num == 1) {
            user.setIdentity("admin");

        } else if (num ==2) {
            user.setIdentity("student");
        }
        request.getSession().setAttribute("user", user);
        //登陆记录
        UserDao userDao = new UserDao();
        userDao.insert(user);
        //发送自动登陆的cookie
        if(autoLogin != null){
            //注意cookie中的密码要加密
            if(num == 1){
                Cookie cookie = new Cookie("autologin", username + "-" + password + "-" + "1");
                cookie.setMaxAge(Integer.parseInt(autoLogin));
                cookie.setPath(request.getContextPath());
                response.addCookie(cookie);
            }else if (num == 2){
                Cookie cookie = new Cookie("autologin", username + "-" + password + "-" + "2");
                cookie.setMaxAge(Integer.parseInt(autoLogin));
                cookie.setPath(request.getContextPath());
                response.addCookie(cookie);
            }

        }
        if (num == 1) {			//教师
            //跳转至首页
            response.sendRedirect(request.getContextPath() + "jsp/Admin.jsp");
        } else if (num == 2){	//学生
            //跳转至首页
            response.sendRedirect(request.getContextPath() + "jsp/Student.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}