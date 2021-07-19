package com.seeyon.apps.ext.ssoLogin.controller;

import com.seeyon.ctp.common.authenticate.sso.SSOTicketManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

public class OpenPendingController {

    private static Logger log = LoggerFactory.getLogger(OpenPendingController.class);
    public OpenPendingController() {
    }

    /**
     * 待办
     * @param request
     * @param response
     */
    public static void formSend(HttpServletRequest request, HttpServletResponse response) {
        /**
         * 1:是协同
         * 4:公文
         * 6：会议
         */
        try {
            String ticket = request.getParameter("ticket");
            String affairId = request.getParameter("affairId");
            String objectId="";
            if(null!=request.getParameter("objectId") && !("null".equals(request.getParameter("objectId")))){
                objectId = request.getParameter("objectId");
            }
            String app = request.getParameter("app");
            SSOTicketManager.getInstance().newTicketInfo(ticket, ticket, "xkdxSso");
            String url = "";
            if (Integer.parseInt(app) == 1) {
                url = "/seeyon/collaboration/collaboration.do?method=summary&openFrom=listPending&affairId=" + affairId;
            } else if (Integer.parseInt(app) == 4) {
                url = "/seeyon/govdoc/govdoc.do?method=summary&isFromHome=true&openFrom=listPending&affairId=" + affairId + "&app=4&summaryId=" + objectId + "";
            } else if (Integer.parseInt(app) == 6) {
                url = "/seeyon/mtMeeting.do?method=mydetail&id=" + objectId + "&affairId=" + affairId + "&state=10";
            }
            String path = "/seeyon/main.do?method=login&ticket=" + ticket + "&login.destination=" + URLEncoder.encode(url.substring(url.indexOf("seeyon") - 1));
            response.sendRedirect(path);
        } catch (IOException e) {
            log.error("中国矿业大学打开OA待办事项出错了，错误信息：" + e.getMessage());
        }
    }


    /**
     * 已办
     * @param request
     * @param response
     */
    public static void formDone(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ticket = request.getParameter("ticket");
            String affairId = request.getParameter("affairId");
            String objectId = "";
            if (null != request.getParameter("objectId") && !("null".equals(request.getParameter("objectId")))) {
                objectId = request.getParameter("objectId");
            }
            String app = request.getParameter("app");
            SSOTicketManager.getInstance().newTicketInfo(ticket, ticket, "xkdxSso");
            String url = "";
            if (Integer.parseInt(app) == 1) {//协同
                url = "/seeyon/collaboration/collaboration.do?method=summary&openFrom=listDone&affairId=" + affairId;
            } else if (Integer.parseInt(app) == 4) {//公文
                url = "/seeyon/govdoc/govdoc.do?method=summary&openFrom=listDone&affairId=" + affairId;
            }
            String path = "/seeyon/main.do?method=login&ticket=" + ticket + "&login.destination=" + URLEncoder.encode(url.substring(url.indexOf("seeyon") - 1));
            response.sendRedirect(path);
        } catch (IOException e) {
            log.error("中国矿业大学打开OA已办事项出错了，错误信息：" + e.getMessage());
        }
    }

    /**
     * 已发
      * @param request
     * @param response
     */
    public static void formSent(HttpServletRequest request, HttpServletResponse response) {
        /**
         * 1:是协同
         * 4:公文
         * 6：会议
         */
        try {
            String ticket = request.getParameter("ticket");
            String affairId = request.getParameter("affairId");
            String objectId = "";
            if (null != request.getParameter("objectId") && !("null".equals(request.getParameter("objectId")))) {
                objectId = request.getParameter("objectId");
            }
            String app = request.getParameter("app");
            SSOTicketManager.getInstance().newTicketInfo(ticket, ticket, "xkdxSso");
            String url = "";
            if (Integer.parseInt(app) == 1) {
                url = "/seeyon/collaboration/collaboration.do?method=summary&openFrom=listSent&affairId=" + affairId;
            } else if (Integer.parseInt(app) == 4) {
                url = "/seeyon/govdoc/govdoc.do?method=summary&isFromHome=true&openFrom=listSent&affairId=" + affairId + "&app=4&summaryId=" + objectId + "";
            }
            String path = "/seeyon/main.do?method=login&ticket=" + ticket + "&login.destination=" + URLEncoder.encode(url.substring(url.indexOf("seeyon") - 1));
            response.sendRedirect(path);
        } catch (IOException e) {
            log.error("中国矿业大学打开OA已发事项出错了，错误信息：" + e.getMessage());
        }

    }



    /**
     * 已办会议
     * @param request
     * @param response
     */
    public static void myMeetingData(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ticket = request.getParameter("ticket");
            SSOTicketManager.getInstance().newTicketInfo(ticket, ticket, "xkdxSso");
            //真实
            String url = "/seeyon/cap4/businessTemplateController.do?method=capUnflowList&srcFrom=bizconfig&businessId=-3670809159316847687&moduleId=2610274103067887667&formId=-584685312557562429&type=baseInfo&tag=1624002613936&portalId=1";
             //本地
           // String url = "/seeyon/cap4/businessTemplateController.do?method=capUnflowList&srcFrom=bizconfig&businessId=-3670809159316847687&moduleId=2610274103067887667&formId=-584685312557562429&type=baseInfo&tag=1618583844972&portalId=1";
            String path = "/seeyon/main.do?method=login&ticket=" + ticket + "&login.destination=" + URLEncoder.encode(url.substring(url.indexOf("seeyon") - 1));
            response.sendRedirect(path);
        } catch (IOException e) {
            log.error("中国矿业大学打开OA已办会议出错了，错误信息：" + e.getMessage());
        }

    }
}
