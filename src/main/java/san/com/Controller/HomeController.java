package san.com.Controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.istack.internal.logging.Logger;

import model.User;

@Controller
public class HomeController {
	
	private static Logger log = Logger.getLogger(HomeController.class);
	
	@RequestMapping(value = "/",method=RequestMethod.GET)
	public String defaultMethod() {
		// to send text only to browser use @ResponseBody
		 return "index";		
}

		@RequestMapping(value = "/test",method=RequestMethod.GET)
		public String testMethod() {
			// to send text only to browser use @ResponseBody
			 return "test";		
	}
		
		@RequestMapping(value="/chkUser", method=RequestMethod.POST)
		@ResponseBody
		public String chk(@RequestBody  User user){
			
			String auth="success";
			//return "message:"+"valid";
			//get the forms value from model functios
			System.out.print(" Form User " + user.getUsername());
			System.out.print("form password"+user.getPassword());
			
			//return jason value to response in angular or jquery
			return "{\"authType\": \"" + auth + "\"}";
		}


}