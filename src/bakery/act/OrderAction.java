package bakery.act;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class OrderAction extends Action {

	@Override
	public String execute(HttpServletRequest request) throws Exception {
		String name = request.getParameter("name");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("mail");

		HttpSession session = request.getSession(true);

		//バリデーション
		String namePattern = "[A-Z]{1}+[a-z]+\\s+[A-Z]{1}+[a-z]";
		Pattern NameP = Pattern.compile(namePattern);
		String zipPattern = "[0-9]{3}-[0-9]{4}";
		Pattern ZipP = Pattern.compile(zipPattern);
		String addressPattern = "[0-9a-zA-Z]";
		Pattern AddressP = Pattern.compile(addressPattern);
		String phonePattern = "[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}";
		Pattern PhoneP = Pattern.compile(phonePattern);
		String mailPattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";
		Pattern MailP = Pattern.compile(mailPattern);

		if(!name.isEmpty() && !zipcode.isEmpty() && !address.isEmpty() && !phone.isEmpty() && !mail.isEmpty()){
			if(NameP.matcher(name).find()){
				if(ZipP.matcher(zipcode).find()){
					if(AddressP.matcher(address).find()){
						if(PhoneP.matcher(phone).find()){
							if(MailP.matcher(mail).find() ){
								session.invalidate();
								return "/finish.jsp";
							}else{
								return "/mail_invalidated.jsp";
							}
						}else{
							return "/phone_invalidated.jsp";
						}
					}else{
						return "/address_invalidated.jsp";
					}
				}else{
					return "/zip_invalidated.jsp";
				}
			}else{
				return "/name_invalidated.jsp";
			}
		}else{
			return "/empty.jsp";
		}
	}
}
