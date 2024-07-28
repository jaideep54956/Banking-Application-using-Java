package com.bankapp.service;

import java.math.BigDecimal;

public interface NotificationService {
    void sendAccountDetails(String email, String mobileNo, String accountNo, String tempPassword);
    void sendDepositNotification(String email, String accountNo, BigDecimal amount, BigDecimal newBalance);
    void sendWithdrawalNotification(String email, String accountNo, BigDecimal amount, BigDecimal newBalance);
	void sendAccountClosureNotification(String email, String accountNo);
}