package dev.mvc.team4_v2sbm3c;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;

@SpringBootTest
class Team4V2sbm3cApplicationTests {
  @Autowired
  private SqlSessionTemplate sqlSession;
  
	@Test
	void contextLoads() {
	}
	
	 @Test
	  public void testSqlSession() throws Exception{
	    System.out.println(sqlSession.toString());
	  }

}
