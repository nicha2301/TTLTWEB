package vn.edu.hcmuaf.fit.model;

import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.DashedBorder;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import vn.edu.hcmuaf.fit.service.impl.DeliveryService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GeneratePdf {

    public static void generateInvoice(Order order, List<OrderItem> item, String ip, OutputStream outputStream) {
        PdfWriter writer = new PdfWriter(outputStream);
        PdfDocument pdfDocument = new PdfDocument(writer);
        pdfDocument.setDefaultPageSize(PageSize.A4);
        Document document = new Document(pdfDocument);

        DeliveryAddress address = DeliveryService.getInstance().loadAddressByOrder(order);

        float threecol = 190f;
        float twocols = 285f;
        float twocols150 = twocols + 150f;
        float twocolumnWidth[] = {twocols150, twocols};
        float threeColumnWidth[] = {threecol, threecol, threecol};
        float fullwidth[] = {threecol*3};
        Paragraph onesp = new Paragraph("\n");

        Table table = new Table(twocolumnWidth);
        table.addCell(new Cell().add("Invoice").setFontSize(20f).setBorder(Border.NO_BORDER).setBold());
        Table nestedTable = new Table(new float[]{twocols/2, twocols/2});
        nestedTable.addCell(getHeaderTextCell("Invoice No."));
        nestedTable.addCell(getHeaderTextCellValue(order.getId()+ ""));
        nestedTable.addCell(getHeaderTextCell("Invoice Date Time"));
        nestedTable.addCell(getHeaderTextCellValue(order.getDateCreated() + ""));

        table.addCell(new Cell().add(nestedTable).setBorder(Border.NO_BORDER));

        Border gb = new SolidBorder(Color.GRAY, 2f);
        Table divider = new Table(fullwidth);
        divider.setBorder(gb);
        document.add(table);
        document.add(onesp);
        document.add(divider);
        document.add(onesp);

        Table twoColTable = new Table(twocolumnWidth);
        twoColTable.addCell(getBillingAndShippingCell("Billing Information: "));
        twoColTable.addCell(getBillingAndShippingCell("Shipping Information: "));
        document.add(twoColTable.setMarginBottom(12f));

        Table twocolTable2 = new Table(twocolumnWidth);
        twocolTable2.addCell(getCell10Left("Company", true));
        twocolTable2.addCell(getCell10Left("Name", true));
        twocolTable2.addCell(getCell10Left("Công ty Thuốc thú y The Pet", false));
        twocolTable2.addCell(getCell10Left(address.getFullName(), false));
        document.add(twocolTable2);

        Table twocolTable3 = new Table(twocolumnWidth);
        twocolTable3.addCell(getCell10Left("Name, Phone", true));
        twocolTable3.addCell(getCell10Left("Address", true));
        twocolTable3.addCell(getCell10Left(address.getFullName() + ", " + address.getPhone(), false));
        twocolTable3.addCell(getCell10Left(address.getDetailAddress() + ", " + address.getWard() + ",\n" + address.getDistrict() + ", " + address.getProvince(), false));
        document.add(twocolTable3);

        float oneColumnwidth[] = {twocols150};
        Table oneColTable1 = new Table(oneColumnwidth);
        oneColTable1.addCell(getCell10Left("Address", true));
        oneColTable1.addCell(getCell10Left(address.getDetailAddress() + ", " + address.getWard() + ",\n" + address.getDistrict() + ", " + address.getProvince(), false));
        oneColTable1.addCell(getCell10Left("Email", true));
        oneColTable1.addCell(getCell10Left("email@gmail.com", false));
        document.add(oneColTable1.setMarginBottom(10f));

        Table tableDivider2 = new Table(fullwidth);
        Border dgb = new DashedBorder(Color.GRAY, 0.5f);
        document.add(tableDivider2.setBorder(dgb));
        Paragraph productPara = new Paragraph("Products");
        document.add(productPara.setBold());

        Table threeColTable1 = new Table(threeColumnWidth);
        threeColTable1.setBackgroundColor(Color.GRAY, 0.7f);

        threeColTable1.addCell(new Cell().add("Description").setBold().setFontColor(Color.WHITE).setBorder(Border.NO_BORDER));
        threeColTable1.addCell(new Cell().add("Quantity").setBold().setFontColor(Color.WHITE).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable1.addCell(new Cell().add("Price").setBold().setFontColor(Color.WHITE).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));
        document.add(threeColTable1);

//        List<Productsssssss> productList = new ArrayList<Productsssssss>();
//        productList.add(new Productsssssss("apple", 2, 159));
//        productList.add(new Productsssssss("mango", 4, 20f));
//        productList.add(new Productsssssss("banana", 2, 20f));
//        productList.add(new Productsssssss("Product A", 3, 20f));
//
//        productList.add(new Productsssssss("coconut", 2, 20f));
//        productList.add(new Productsssssss("cherry", 1, 20f));
//        productList.add(new Productsssssss("kiwi", 3, 20f));


        Table threeColTable2 = new Table(threeColumnWidth);

        float totalSum = 0f;
        for (OrderItem oi : item) {
            float total = oi.getQuantity()*oi.getOrderPrice();
            totalSum += total;
            Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(oi.getProduct(), ip, "generatePdf.java");
            for (Product p : products.keySet()) {
                threeColTable2.addCell(new Cell().add(p.getProductName()).setBorder(Border.NO_BORDER).setMarginLeft(10f));
            }
            threeColTable2.addCell(new Cell().add(String.valueOf(oi.getQuantity())).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
            threeColTable2.addCell(new Cell().add(String.valueOf(total)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));
        }
        document.add(threeColTable2.setMarginBottom(20f));
        float onetwo[] = {threecol+125f, threecol*2};
        Table threeColTable4 = new Table(onetwo);
        threeColTable4.addCell(new Cell().add("").setBorder(Border.NO_BORDER));
        threeColTable4.addCell(new Cell().add(tableDivider2).setBorder(Border.NO_BORDER));
        document.add(threeColTable4);

        Table threeColTable3 = new Table(threeColumnWidth);
        threeColTable3.addCell(new Cell().add("").setBorder(Border.NO_BORDER)).setMarginLeft(10f);
        threeColTable3.addCell(new Cell().add("Total").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable3.addCell(new Cell().add(String.valueOf(totalSum)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        document.add(threeColTable3);
        document.add(tableDivider2);
        document.add(new Paragraph("\n"));
        document.add(divider.setBorder(new SolidBorder(Color.GRAY, 1)).setMarginBottom(15f));

        Table tb = new Table(fullwidth);
        tb.addCell(new Cell().add("TERMS AND CONDITIONS\n").setBold().setBorder(Border.NO_BORDER));
        List<String> TncList = new ArrayList<>();
        TncList.add("1. This Agreement shall be governed by and construed in accordance with the laws of the Republic of Vietnam, without regard to its conflict of laws provisions.");
        TncList.add("2. The parties hereto agree that this Agreement shall be binding upon and inure to the benefit of the parties and their respective successors, assigns, and permitted assigns.");

        for (String tnc: TncList) {
            tb.addCell(new Cell().add(tnc).setBorder(Border.NO_BORDER));
        }
        document.add(tb);
        document.close();
    }

    static Cell getHeaderTextCell(String textValue) {
        return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT);
    }

    static Cell getHeaderTextCellValue(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    static Cell getBillingAndShippingCell(String textValue) {
        return new Cell().add(textValue).setFontSize(12f).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    static  Cell getCell10Left(String textValue, Boolean isBold) {
        Cell cell = new Cell().add(textValue).setFontSize(10f).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
        return isBold?cell.setBold():cell;
    }
}