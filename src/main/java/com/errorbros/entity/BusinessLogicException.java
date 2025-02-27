package com.errorbros.entity;

public class BusinessLogicException extends RuntimeException {
	private final ExceptionCode exceptionCode;

	public BusinessLogicException(ExceptionCode exceptionCode) {
		super(exceptionCode.getMessage());
		this.exceptionCode = exceptionCode;
	}

	public ExceptionCode getExceptionCode() {
		return exceptionCode;
	}

	public int getStatus() {
		return exceptionCode.getStatus();
	}
}