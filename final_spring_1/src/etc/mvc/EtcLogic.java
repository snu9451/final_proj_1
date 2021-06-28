package etc.mvc;

import org.apache.log4j.Logger;


public class EtcLogic {
	Logger logger = Logger.getLogger(EtcLogic.class);
	
	private EtcDao etcDao = null;

	public void setEtcDao(EtcDao etcDao) {
		this.etcDao = etcDao;
	}

}