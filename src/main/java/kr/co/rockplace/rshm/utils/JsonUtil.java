package kr.co.rockplace.rshm.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.json.JsonReadFeature;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * JSON Utility
 * @author wonsunlee
 */
public class JsonUtil {

	/**
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Map<String, Object> convertJSONStringToMap(String jsonString) {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = null;

		try {

			// convert JSON string to Map
			//Map<String, String> map = mapper.readValue(jsonString, Map.class); 
			mapper.configure(JsonReadFeature.ALLOW_UNESCAPED_CONTROL_CHARS.mappedFeature(), true);

			// it works 
			map = mapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {}); 
		} catch (IOException e) {
			e.printStackTrace();
		}

		return map;
	}

	/**
	 * 
	 * @param map
	 * @return
	 */
	public static String convertMapToJSONString(Map<String, ?> map) {

		ObjectMapper mapper = new ObjectMapper();
		String json = "";

		try { 

			// convert map to JSON string 
			//json = mapper.writeValueAsString(map); // compact-print

			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map); // pretty-print
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}

	/**
	 * 
	 * @param jsonString
	 * @return
	 */
	public static List<Map<String, Object>> convertJSONStringToList(String jsonString) {

		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> list = null;

		try {

			// convert JSON string to Map
			//List<?> list = mapper.readValue(jsonString, List.class); 

			// it works 
			list = mapper.readValue(jsonString, new TypeReference<List<Map<String, Object>>>() {}); 
		} catch (IOException e) {
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * 
	 * @param map
	 * @return
	 */
	public static String convertListToJSONString(List<Map<String, Object>> list) {

		ObjectMapper mapper = new ObjectMapper();
		String json = "";

		try { 

			// convert map to JSON string 
			//json = mapper.writeValueAsString(list); // compact-print

			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list); // pretty-print
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return json;
	}

	public static Map<String, Object> convertXmlToMap(String xml) {

		JSONObject xmlJSONObj = XML.toJSONObject(xml);
		String xmlJSONObjString = xmlJSONObj.toString();

		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return map;
	}
}