package com.errorbros.entity;

public enum ExceptionCode {
	PAY_CANCEL(400, "Payment has been canceled."), PAY_FAILED(400, "Payment has failed.");

	private final int status;
	private final String message;

	ExceptionCode(int status, String message) {
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public String getMessage() {
		return message;
	}
}