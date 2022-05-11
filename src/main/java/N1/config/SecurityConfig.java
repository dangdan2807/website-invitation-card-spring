package N1.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource securityDataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(securityDataSource)
                .usersByUsernameQuery("SELECT tenDangNhap, matKhau, tinhTrang FROM TaiKhoan where tenDangNhap = ?")
                .authoritiesByUsernameQuery("select tk.tenDangNhap, cv.tenChucVu from ChucVu as cv, TaiKhoan as tk "
                		+ "where tk.maChucVu = cv.maChucVu and tk.tenDangNhap = ?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.authorizeRequests()
        .antMatchers("/resources/css/**").permitAll()
        .antMatchers("/resources/bootstrap/**").permitAll()
        .antMatchers("/resources/jquery/**").permitAll()
        .antMatchers("/resources/fonts/**").permitAll()
        //.antMatchers("/user/**").hasAnyRole("Khach hang", "Admin")
        //.antMatchers("/san-pham/id=*/them-vao-gio-hang").hasAnyRole("Khach hang", "Admin")
        //.antMatchers("/san-pham/id=*/them-danh-gia").hasAnyRole("Khach hang", "Admin")
        .antMatchers("/**").permitAll()
        .anyRequest().authenticated()
        .and()
        .formLogin()
        .loginPage("/dang-nhap")
        .loginProcessingUrl("/authenticateLogin")
        .permitAll()
        .and()
        .logout().permitAll()
        .and()
        .exceptionHandling().accessDeniedPage("/access-denied");
    
    }

    @Bean
    public UserDetailsManager userDetailsManager() {
        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
        jdbcUserDetailsManager.setDataSource(securityDataSource);
        return jdbcUserDetailsManager;
    }
}
