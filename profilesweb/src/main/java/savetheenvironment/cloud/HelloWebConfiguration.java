package savetheenvironment.cloud;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.AbstractEnvironment;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;


interface HelloService {
    public String hello();
}

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class HelloWebConfiguration {


    public static void main(String[] args) throws Throwable {

        ApplicationContextInitializer<AnnotationConfigWebApplicationContext> aci =
                new ApplicationContextInitializer<AnnotationConfigWebApplicationContext>() {

                    public void initialize(AnnotationConfigWebApplicationContext appContext) {

                        String profile = System.getProperty("profile");

                        profile = StringUtils.hasText(profile) ? profile : AbstractEnvironment.DEFAULT_PROFILES_PROPERTY_NAME;
                        if (StringUtils.hasText(profile)) {
                            System.out.println(String.format("Current Profile: '%s'", profile));
                            appContext.getEnvironment().setActiveProfiles(profile);
                        }

                        appContext.refresh();

                    }
                };

        SpringApplication springApplication = new SpringApplication();
        springApplication.addInitializers(aci);
        springApplication.run(HelloWebConfiguration.class);


    }


}

@Controller
class CloudController {
    private HelloService helloService;

    @Autowired
    CloudController(HelloService hs) {
        this.helloService = hs;
    }

    @RequestMapping("/")
    @ResponseBody
    String render() {
        return helloService.hello();
    }

}

@Profile("bacon")
@Service
class HelloBaconService implements HelloService {
    public String hello() {
        return "bacon";
    }
}

@Profile("cat")
@Service
class HelloCatService implements HelloService {
    public String hello() {
        return "cat";
    }
}

@Profile("default")
@Service
class HelloDefaultService implements HelloService {
    @Override
    public String hello() {
        return "default";
    }
}
