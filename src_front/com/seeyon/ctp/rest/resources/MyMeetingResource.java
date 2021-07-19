package com.seeyon.ctp.rest.resources;

import com.seeyon.apps.gwxg.manager.DemoManager;
import com.seeyon.ctp.common.AppContext;
import com.seeyon.ctp.common.log.CtpLogFactory;
import com.seeyon.ctp.rest.resources.BaseResource;
import com.seeyon.ctp.util.FlipInfo;
import com.seeyon.ctp.util.annotation.RestInterfaceAnnotation;
import org.apache.commons.logging.Log;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Path("meetingInfo")
@Produces({MediaType.APPLICATION_JSON})
public class MyMeetingResource extends BaseResource {
    private static final Log LOG = CtpLogFactory.getLog(MyMeetingResource.class);

    private DemoManager demoManager=(DemoManager)AppContext.getBean("demoManager");

    public DemoManager getDemoManager() {
        return demoManager;
    }

    public void setDemoManager(DemoManager demoManager) {
        this.demoManager = demoManager;
    }

    @POST
    @Path("getMyMeetingData")
    @Produces({"application/json"})
    @RestInterfaceAnnotation

    public Response getMyMeetingListData(Map<String,String> params) {

        Map<String, Object> res = new HashMap<String, Object>();
        String loginname = params.get("loginname") + "";
        try {
            FlipInfo flipInfo = new FlipInfo();
            demoManager.getMyMeetingListData(flipInfo, loginname);
            res.put("success", true);
            res.put("syncTime", new Date());
            res.put("count", flipInfo.getTotal());
            res.put("datas", flipInfo.getData());
        } catch (Exception e) {
            e.printStackTrace();
            LOG.error("获得“我的会议”数据失败！", e);
            res.put("success", false);
            res.put("msg", e.getLocalizedMessage());
            res.put("datas", null);
        }
        return Response.ok(toJSON(res)).build();
    }
}
