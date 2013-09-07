package savetheenvironment.refresh;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import savetheenvironment.Cat;
import savetheenvironment.CatAdmin;

import javax.inject.Provider;


@Configuration
 public class CatConfiguration {

    @Bean
    public CatAdmin catAdmin() {
        return new CatAdmin();
    }

    @Bean
    public Cat refreshableCat(final CatAdmin catAdmin) throws Throwable {
        RefreshableBeanFactoryBean<Cat> catRefreshableBeanFactoryBean =
                new RefreshableBeanFactoryBean<Cat>(new Provider<Cat>() {
                    @Override
                    public Cat get() {
                        return catAdmin.getCat();
                    }
                });
        return catRefreshableBeanFactoryBean.getObject();
    }

}