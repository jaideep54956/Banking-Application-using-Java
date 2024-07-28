package com.bankapp.servlet;

import com.bankapp.model.Transaction;
import com.bankapp.service.TransactionService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer/generate-pdf")
public class GeneratePDFServlet extends HttpServlet {
    private TransactionService transactionService = new TransactionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("accountNo") != null) {
            String accountNo = (String) session.getAttribute("accountNo");
            try {
                int customerId = transactionService.getCustomerIdByAccountNo(accountNo);
                List<Transaction> transactions = transactionService.getLastTenTransactions(customerId);

                Document document = new Document();
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=transaction_history.pdf");
                PdfWriter.getInstance(document, response.getOutputStream());

                document.open();
                document.add(new Paragraph("Transaction History"));
                document.add(new Paragraph(" "));

                PdfPTable table = new PdfPTable(4);
                table.addCell(new PdfPCell(new Phrase("Transaction ID")));
                table.addCell(new PdfPCell(new Phrase("Type")));
                table.addCell(new PdfPCell(new Phrase("Amount")));
                table.addCell(new PdfPCell(new Phrase("Date")));

                for (Transaction transaction : transactions) {
                    table.addCell(String.valueOf(transaction.getTransactionId()));
                    table.addCell(transaction.getTransactionType());
                    table.addCell(transaction.getAmount().toString());
                    table.addCell(transaction.getTransactionDate().toString());
                }

                document.add(table);
                document.close();

            } catch (Exception e) {
                throw new ServletException("Error generating PDF", e);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        }
    }
}
