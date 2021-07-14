package dev.mvc.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfiguration implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    // URL에 "/member/"가 들어간 요청은 MemberInterceptor 작동함.
    registry.addInterceptor(new MemberInterceptor()).addPathPatterns("/member/**");  

    // URL에 "/admin/"이 들어간 요청은 AdminInterceptor 작동함.
    registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**"); 
    // .excludePathPatterns("/admin/**", "/membe/**", "/pay/**"");
  }
  
}
 