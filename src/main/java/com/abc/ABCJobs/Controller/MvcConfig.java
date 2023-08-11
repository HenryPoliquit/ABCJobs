package com.abc.ABCJobs.Controller;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MvcConfig implements WebMvcConfigurer{
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        Path postUploadDir = Paths.get("./post-photo");
	        String postUploadPath = postUploadDir.toFile().getAbsolutePath();
	        
	        registry.addResourceHandler("/post-photo/**").addResourceLocations("file:/"+ postUploadPath + "/");
	    }

}
