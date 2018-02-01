package net.yozo.core.exception;

/**
 * Created by li-ju on 2017/5/4.
 */
public class SystemException extends Exception {
    public int errorCode;

    public SystemException() {
    }

    public SystemException(String s) {
        super(s);
    }

    public SystemException(int errcode) {
        this.errorCode = errcode;
    }
}
