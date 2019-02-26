package bakery.act;

import javax.servlet.http.HttpServletRequest;

public abstract class Action {
	abstract public String execute(HttpServletRequest request) throws Exception;
}
