package com.dfby.util;

/**
 * 响应结果方法
 */
public class Response {
    /****
     * 成功响应Msg中的信息
     **/
    private final static String SUCCESS = "success";

    /****
     * 失败响应Msg中的信息
     **/
    private final static String FAILED = "failed";

    public static <T> com.dfby.util.Result<T> success() {
        return new com.dfby.util.Result<T>().setCode(com.dfby.util.ResultsCode.SUCCESS).setMsg(SUCCESS);
    }

    public static <T> com.dfby.util.Result<T> success(T data) {
        return new com.dfby.util.Result<T>().setCode(com.dfby.util.ResultsCode.SUCCESS).setMsg(SUCCESS).setData(data);
    }

    public static <T> com.dfby.util.Result<T> error(com.dfby.util.ResultsCode resultsCode) {
        return new com.dfby.util.Result<T>().setCode(resultsCode.code).setMsg(resultsCode.message);
    }

    public static <T> com.dfby.util.Result<T> error(String message) {
        return new com.dfby.util.Result<T>().setMsg(message).setCode(com.dfby.util.ResultsCode.FAIL);
    }


    public static <T> com.dfby.util.Result<T> error(String message, com.dfby.util.ResultsCode resultsCode) {
        return new com.dfby.util.Result<T>().setMsg(message).setCode(resultsCode.code);
    }

    public static <T> com.dfby.util.Result<T> error() {
        return new com.dfby.util.Result<T>().setCode(com.dfby.util.ResultsCode.FAIL).setMsg(FAILED);
    }


}