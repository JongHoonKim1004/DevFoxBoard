package com.board.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.UsersVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UsersMapperTests {
	@Autowired
	private UsersMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	public void insertTest() {
		UsersVO test = UsersVO.builder().
				username("test").
				nickname("nickname").
				password(encoder.encode("1234")).
				email("zima0412@gmail.com").build();
		
		log.info("Insert Test start");
		mapper.createUser(test);
		
		UsersVO record = mapper.read(test.getUsername());
		
		mapper.createUsersAuth(record.getUno());
		log.info("Insert Test End");
		
		UsersVO result = mapper.read(test.getUsername());
		
		log.info(result);
		
	}
}
