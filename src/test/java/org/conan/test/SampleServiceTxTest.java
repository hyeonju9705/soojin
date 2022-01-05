package org.conan.test;

import org.conan.service.SampleTxService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleServiceTxTest {
	@Setter(onMethod_=@Autowired)
	private SampleTxService service;
	@Test
	public void testLong() {
		String str="straw staraw berry jam yeha dhdkslsjk pallet IU sing a song with me good nigh maan"+
	"hi bye hi ya ya murasaki ikitai tabetai oisii";
		log.info(str.getBytes().length);
		service.addData(str);
	}
}
