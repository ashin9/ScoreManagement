package Controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import Dao.AdministratorDao;
import Dao.StudentDao;
import Model.Administrator;
import Model.Student;
import Model.User;


/**
 * Servlet Filter implementation class AutoLoginFilter
 */
@WebServlet("/AutoLoginFilter")
public class AutoLoginFilter implements Filter {

    /**
     * @see Filter#destroy()
     */
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        //获取一个名为autologin的cookie
        Cookie[] cookies = request.getCookies();
        String autologin = null;
        for (int i=0; cookies != null && i<cookies.length; i++){
            if("autologin".equals(cookies[i].getName())){
                //找到了指定的cookie
                autologin = cookies[i].getValue();
                break;
            }
        }
        if(autologin != null){
            //做自动登陆
            System.out.println("进入过滤器。");
            String [] parts = autologin.split("-");
            String username = parts[0];
            String password = parts[1];
            String num = parts[2];
            User user = new User();
            int flag = 0;
            if(num == "1"){
                AdministratorDao adminDao = new AdministratorDao();
                Administrator admin = adminDao.find(username);
                if(admin != null) {
                    if (admin.getTcPassword().equals(password)){
                        flag = 1;
                        user.setIdentity("admin");
                    }
                }
            } else {
                StudentDao stuDao = new StudentDao();
                Student stu = stuDao.find(username);
                if (stu != null){
                    if (stu.getStuPassword().equals(password)){
                        flag = 1;
                        user.setIdentity("student");
                    }
                }
            }
            //检查用户名和密码
            if (flag == 1 ){
                //登陆成功，将用户状态user对象存入session域
                user.setUsername(username);
                user.setPassword(password);
                request.getSession().setAttribute("user", user);
            }
        }
        //放行
        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}