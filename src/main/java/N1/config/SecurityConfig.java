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
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;

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
    
    private static final String[] PUBLIC_MATCHERS = {
			"/resources/**",
			"/",
			"/**",
			"/san-pham",
			"/lien-he",
			"/danh-muc/**",
			"/san-pham/id=*",
			"/san-pham/tim-kiem",
			"/danh-muc/**"
	};

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
        http.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(1296000);
        http.authorizeRequests()
                .antMatchers(PUBLIC_MATCHERS).permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/user/**").hasAnyRole("CUSTOMER", "ADMIN")
				.antMatchers("/san-pham/id=*/them-vao-gio-hang").hasAnyRole("CUSTOMER", "ADMIN")
				.antMatchers("/san-pham/id=*/them-danh-gia").hasAnyRole("CUSTOMER", "ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/dang-nhap")
                .loginProcessingUrl("/authenticateLogin")
                .permitAll()
                .and()
                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/dang-xuat"))
                .logoutSuccessUrl("/").permitAll()
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