package com.course.evaluation.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;

public class EncodeRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request = null;

    public EncodeRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    @Override
    public String getParameter(String name) {
        String val = this.request.getParameter(name);
        if (val == null) {
            return null;
        }
        try {
            val = new String(val.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return val;
    }
}
