package com.rk3.springsecurity.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		//In memory users
		//UserBuilder users = User.withDefaultPasswordEncoder();
		//auth.inMemoryAuthentication().withUser(users.username("john").password("123").roles("EMPLOYEE"))
		//		.withUser(users.username("jane").password("123").roles("EMPLOYEE","MANAGER"))
		//		.withUser(users.username("jim").password("123").roles("EMPLOYEE", "ADMIN"));
		
		//JDBC authentication
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}

	//Custom login, comment out to use Spring's default login form
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/leaders/**").hasRole("MANAGER")
			.antMatchers("/systems/**").hasRole("ADMIN")
			.antMatchers("/css/**").permitAll()
			//.anyRequest().authenticated()
		.and()
			.formLogin()
			.loginPage("/showLogin")
			.loginProcessingUrl("/authenticateUser")
			.permitAll()
		.and()
			.logout().permitAll()
		.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}

}
