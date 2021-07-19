
package com.seeyon.apps.gwxg.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.config.RequestConfig.Builder;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class RestTest {
    public RestTest() {
    }

    public static String getToken() {
        String token = "";
        String url = "http://127.0.0.1:80/seeyon/rest/token";
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = null;
        HttpResponse response = null;
        httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;charset=utf-8");
        String requestParams = "{\"userName\":\"daibanrest\",\"password\":\"69a23164-4105-4ea7-8de7-454355931c48\"}";
        StringEntity postingString = new StringEntity(requestParams, "utf-8");
        httpPost.setEntity(postingString);

        try {
            response = client.execute(httpPost);
            response.setHeader("Cache-Control", "no-cache");
            System.out.println(response.getStatusLine().getStatusCode());
            if (response.getStatusLine().getStatusCode() == 200) {
                String resultString = EntityUtils.toString(response.getEntity(), "utf-8").replaceAll(" ", "");
                JSONObject jsonObject = JSON.parseObject(resultString);
                token = (String)jsonObject.get("id");
            }
        } catch (IOException var9) {
            var9.printStackTrace();
        }

        return token;
    }




    public static void main(String[] args) {
        System.out.println(getToken());
        String token=getToken();
        //post请求“已办会议”数据
      //  String url = "http://127.0.0.1/seeyon/rest/aweekly/getListData";
        String url = "http://127.0.0.1/seeyon/rest/meetingInfo/getMyMeetingData";
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = null;
        HttpResponse response = null;

        httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;");
        httpPost.setHeader("token", token);
        String requestParams = "{\"loginname\":\"2019999\"}";
        StringEntity postingString = new StringEntity(requestParams, "utf-8");
        httpPost.setEntity(postingString);

        try {
            response = client.execute(httpPost);
            response.setHeader("Cache-Control", "no-cache");

            System.out.println(response.getStatusLine().getStatusCode());
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                String resultString = EntityUtils.toString(response.getEntity());
                System.out.println(resultString);
                Map<String, Object> m = (Map<String, Object>) JSONObject.parse(resultString);

                String data=m.get("datas").toString();
                String count=m.get("count").toString();//会议条数
                System.out.println("==会议个数=="+count);
                JSONArray json = JSONArray.parseArray(data); // 首先把字符串转成 JSONArray  对象

                if(json.size()>0){
                    for(int i=0;i<json.size();i++) {
                        JSONObject job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                        String loginname = job.get("loginname").toString();//登录code
                        String hymc = job.get("hymc").toString();//会议名称
                        String hysj = job.get("hysj").toString();//会议时间
                        String hydd = job.get("hydd").toString();//会议地点
                        System.out.println("count=="+count+"loginname=="+loginname+",hymc="+hymc+",hysj="+hysj+",hydd="+hydd);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        //get请求待办数据
       /* String url = "http://127.0.0.1/seeyon/rest/affairs/pending/code/2019999?ticket=2019999&token="+token;
        CloseableHttpClient client = HttpClients.createDefault();
        HttpGet httpGet = null;
        HttpResponse response = null;

        httpGet = new HttpGet(url);
        httpGet.setHeader("Content-Type", "application/json;");
        try {
            response = client.execute(httpGet);

            response.setHeader("Cache-Control", "no-cache");

            System.out.println(response.getStatusLine().getStatusCode());
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                String resultString = EntityUtils.toString(response.getEntity());
                System.out.println(resultString);
                Map<String, Object> m = (Map<String, Object>) JSONObject.parse(resultString);

                String data=m.get("data").toString();

                JSONArray json = JSONArray.parseArray(data); // 首先把字符串转成 JSONArray  对象

                if(json.size()>0){
                    for(int i=0;i<json.size();i++) {
                        JSONObject job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                        String summaryid = job.get("objectId").toString();
                        String affairid = job.get("id").toString();
                        String app = job.get("app").toString();
                        String formid = job.get("formRecordid").toString();
                        System.out.println("summaryid=="+summaryid+",affairid="+affairid+",app="+app+",formid="+formid);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }
}
