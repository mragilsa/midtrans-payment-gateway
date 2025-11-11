package com.midtranspaymentgateway.midtrans_payment.controller;

import com.midtrans.Config;
import com.midtrans.ConfigFactory;
import com.midtrans.httpclient.error.MidtransError;
import com.midtrans.service.MidtransSnapApi;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
public class PaymentController {

    @Value("${midtrans.server.key}")
    private String serverKey;

    @Value("${midtrans.client.key}")
    private String clientKey;

    private MidtransSnapApi snapApi;

    @PostConstruct
    public void init() {
        snapApi = new ConfigFactory(new Config(serverKey,clientKey, false)).getSnapApi();
    }

    @PostMapping("/pay")
    public String pay(@RequestParam int amount, @RequestParam String customerEmail) throws MidtransError {
        Map<String, Object> transactionDetails = new HashMap<>();
        transactionDetails.put("order_id", "ORDER-" + UUID.randomUUID());
        transactionDetails.put("gross_amount", amount);

        Map<String, Object> creditCard = new HashMap<>();
        creditCard.put("secure", true);

        Map<String, Object> customerDetails = new HashMap<>();
        customerDetails.put("email", customerEmail);

        Map<String, Object> params = new HashMap<>();
        params.put("transaction_details", transactionDetails);
        params.put("credit_card", creditCard);
        params.put("customer_details", customerDetails);

        String redirectURL = snapApi.createTransactionRedirectUrl(params);

        return redirectURL;
    }

}
