package Restful;

import Entities.Notes;
import Entities.Users;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pojo.Weather.Temperature;
import service.noteService;
import service.userService;

import java.util.*;

/**
 * Created by fadie on 7/8/2017.
 */

@Controller
public class rest {
    // --------------------- hibernate AutoWired --------------------------------
    @Autowired(required = true)
    @Qualifier("userService")
    userService userService;

    @Autowired(required = true)
    @Qualifier("noteService")
    noteService note;

    //********************************** injection setter and getter ****************
    public noteService getNote() {
        return note;
    }

    public void setNote(noteService note) {
        this.note = note;
    }

    public service.userService getUserService() {
        return userService;
    }

    public void setUserService(service.userService userService) {
        this.userService = userService;
    }

    //*************************** weather web service ***********************
    @ResponseBody
    @RequestMapping(value = "/weather/ss", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String GetV() {

        return "";

    }

    @ResponseBody
    @RequestMapping(value = "/weather/1/{locationId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String GetWeatherOfDay(@PathVariable("locationId") String locationId) {

        System.out.println("weather web service");
        HashMap<String, Object> hashMap = start.getWheatherByKey(locationId);
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.valueToTree(hashMap);
        ObjectNode addedNode = ((ObjectNode) node).putObject("notes");
        List<String> list = note.GetrangeNotes(locationId, new Date());
        int note = 1;
        for (String gg : list) {
            addedNode
                    .put("note" + node, gg);

        }


        return node.toString();

    }

    // return json data weather by specific location id  ( 5 days )
    @ResponseBody
    @RequestMapping(value = "/weather/5/{locationId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String Get5WeatherOfDay(@PathVariable("locationId") String locationId) {

        System.out.println("weather web service");
        HashMap<String, Object> hashMap = start.get5DaysWheatherByKey(locationId);
        System.out.println(hashMap);
        ObjectMapper mapper = new ObjectMapper();

        ArrayList<Integer> TempIntegers = new ArrayList<Integer>();

        int temp;
        for (Map.Entry m : hashMap.entrySet()) {
            String key = m.getKey().toString();
            if (key.equalsIgnoreCase("DailyForecasts")) {


                List<LinkedHashMap<String, Object>> ll = (List<LinkedHashMap<String, Object>>) m.getValue();

                ObjectMapper ma = new ObjectMapper();
                for (LinkedHashMap<String, Object> o : ll) {
                    for (Map.Entry mm : o.entrySet()) {
                        String kkey = mm.getKey().toString();
                        if (kkey.equalsIgnoreCase("Temperature")) {

                            Temperature temperature = mapper.convertValue(mm.getValue(), Temperature.class);
                            TempIntegers.add(temperature.getMaximum().getValue());
                        }

                    }
                }


            }

        }
        String rangeId = "0";
        int temprature = TempIntegers.get(0);
        if (temprature <= 10) {
            rangeId = "1";

        }
        if (temprature <= 15) {
            if (temprature > 10) {

                rangeId = "2";

            }

        }
        if (temprature <= 20) {
            if (temprature > 15) {

                rangeId = "3";

            }

        }
        if (temprature > 20) {

            rangeId = "4";
        }


        //****************************************************** convert to json *************************************
        JsonNode node = mapper.valueToTree(hashMap);
        ObjectNode addedNode = ((ObjectNode) node).putObject("notes");


        List<String> list = note.GetrangeNotes(rangeId, new Date());
        int note = 0;
        for (String gg : list) {
            addedNode.put("note".concat(String.valueOf((note + 1))), gg);
            note++;

        }
        return node.toString();

    }

    // retuen all nodes by specific id
    @ResponseBody
    @RequestMapping(value = "/weather/notes/{noteId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String GetNotes(@PathVariable("noteId") String noteId) {


        List<Notes> list = note.GEtSpecificNotes(Integer.parseInt(noteId));
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.valueToTree(list);


        return node.toString();
    }

//    ********************** delete specific note by rage id and note id **********************

    @ResponseBody
    @RequestMapping(value = "/weather/notes/{noteId}/{rangeId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String GetNotes(@PathVariable("noteId") String noteId, @PathVariable("rangeId") String rangeId) {

        List<Notes> list = note.DeleteRanges(Integer.parseInt(noteId), Integer.parseInt(rangeId));
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.valueToTree(list);
        System.out.println(node);

        return node.toString();


    }
}


