package Restful;

import Entities.Users;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.client.RestTemplate;
import pojo.Weather.*;
import pojo.location.Country;
import service.noteService;

import java.io.IOException;
import java.util.*;

/**
 * Created by fadie on 7/8/2017.
 */
public class start {


    //****************************** get 5  day weather by Location Key ********************
    public static HashMap<String, Object> get5DaysWheatherByKey(String locationId) {
        RestTemplate restTemplate = new RestTemplate();
        LinkedHashMap<String, Object> list = restTemplate.getForObject("http://dataservice.accuweather.com/forecasts/v1/daily/5day/"+locationId+"?apikey=GIdAcS4f3eAGBJ7kqm3Ntjv9gnbADHnF", LinkedHashMap.class);
        return list;
    }

    //****************************** get day weather by Location Key ********************
    public static HashMap<String, Object> getWheatherByKey(String locationId) {


        RestTemplate restTemplate = new RestTemplate();
//
        LinkedHashMap<String, Object> list = restTemplate.getForObject("http://dataservice.accuweather.com/forecasts/v1/daily/1day/" + locationId + "?apikey=GIdAcS4f3eAGBJ7kqm3Ntjv9gnbADHnF", LinkedHashMap.class);
        ObjectMapper mapper = new ObjectMapper();


        HashMap<String, Object> hashMap = new HashMap<String, Object>();

        for (Map.Entry m : list.entrySet()) {
            String key = m.getKey().toString();
            if (key.equalsIgnoreCase("Headline")) {
                Headline headline = mapper.convertValue(m.getValue(), Headline.class);
                hashMap.put(key, headline);
            }
            if (key.equalsIgnoreCase("DailyForecasts")) {


                List<LinkedHashMap<String, Object>> ll = (List<LinkedHashMap<String, Object>>) m.getValue();

                ObjectMapper ma = new ObjectMapper();
                for (LinkedHashMap<String, Object> o : ll) {
                    for (Map.Entry mm : o.entrySet()) {
                        String kkey = mm.getKey().toString();
                        if (kkey.equalsIgnoreCase("Temperature")) {

                            Temperature temperature = mapper.convertValue(mm.getValue(), Temperature.class);
                            hashMap.put("Minimum", temperature.getMinimum());
                            hashMap.put("Maximum", temperature.getMaximum());

                        }
                        if (kkey.equalsIgnoreCase("Day")) {
                            Day day = mapper.convertValue(mm.getValue(), Day.class);
                            hashMap.put("Day", day);
                        }
                        if (kkey.equalsIgnoreCase("Night")) {
                            Night night = mapper.convertValue(mm.getValue(), Night.class);
                            hashMap.put("Night", night);


                        }


                    }
                }


            }

        }


        return hashMap;


    }


    ///********************************************** get all cities when search **********************

    public static HashMap<String, String> GetLocation() {
        RestTemplate restTemplate = new RestTemplate();
        List<LinkedHashMap<String, Object>> list = restTemplate.getForObject("http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=GIdAcS4f3eAGBJ7kqm3Ntjv9gnbADHnF&q=cai", List.class);

        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String> hashMap = new HashMap<String, String>();
        for (LinkedHashMap<String, Object> o : list) {
            String key = "";
            for (Map.Entry m : o.entrySet()) {

                if (m.getKey().toString().equalsIgnoreCase("key")) {

                    key = m.getValue().toString();
                }

                if ("Country".equalsIgnoreCase(m.getKey().toString())) {
                    Country country = mapper.convertValue(m.getValue(), Country.class);
                    hashMap.put(key, country.getLocalizedName());

                }
            }
        }
        System.out.println(hashMap);


        return hashMap;

    }


}


