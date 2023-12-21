package com.pack.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	 @Autowired
	    private DataSource dataSource;
	     
	    @Autowired
	    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
	        auth.jdbcAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance())
	            .dataSource(dataSource)
	            .usersByUsernameQuery("select user_name, password, is_active from user where user_name=?")
	            .authoritiesByUsernameQuery("select user_name, roles from user where user_name=?")
	        ;
	    }
		  @Override
		    protected void configure(HttpSecurity http) throws Exception {
				  
			  http.authorizeRequests()
			  .antMatchers("/admin").hasRole("ADMIN")
	          .antMatchers("/user").hasAnyRole("USER")
	          .antMatchers("/all").permitAll()
	    	  .and()
	    	  .formLogin().permitAll()
	          .and()
	          .logout()
	          .permitAll();
		  
		
		  }

			
}
