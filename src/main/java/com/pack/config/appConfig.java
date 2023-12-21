package com.pack.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan(basePackages = {"Registration"})
public class appConfig extends WebMvcConfigurationSupport {
	
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("css/**","js/**")
		.addResourceLocations("classpath:/static/css","classpath:/static/js");
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver jspResolver=new InternalResourceViewResolver();
		jspResolver.setPrefix("/WEB-INF/jsp/");
		jspResolver.setSuffix(".jsp");
		jspResolver.setViewClass(JstlView.class);
		
		return jspResolver;
	}

}
