package com.etoak.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mvc.xml" })
public class BookControllerTest {

	@Autowired
	WebApplicationContext context;

	MockMvc mockMvc;

	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testQueryBookList() throws Exception {
		String contentAsString = mockMvc.perform(MockMvcRequestBuilders.get("/books"))
				// .andExpect(jsonPath("$.rows.length()").value(2))
				// .andExpect(jsonPath("$.total").value(4))
				.andReturn().getResponse().getContentAsString();
		System.out.println(contentAsString);
	}

}
