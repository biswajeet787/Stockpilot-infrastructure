import {
  SESClient,
  SendEmailCommand,
} from "@aws-sdk/client-ses";

const ses = new SESClient({
  region: process.env.AWS_REGION || "ap-south-1",
});

export const handler = async (event) => {
  console.log(
    "Received event:",
    JSON.stringify(event),
  );

  const {
    email,
    productName,
    sku,
    currentQuantity,
    minimumQuantity,
  } = event;

  if (!email) {
    throw new Error("Recipient email is required");
  }

  if (!productName) {
    throw new Error("Product name is required");
  }

  const command = new SendEmailCommand({
    Source: process.env.SES_FROM_EMAIL,

    Destination: {
      ToAddresses: [email],
    },

    Message: {
      Subject: {
        Data: `Low Stock Alert - ${productName}`,
      },

      Body: {
        Text: {
          Data: `
Hello,

This is a low stock alert from StockPilot.

Product: ${productName}
SKU: ${sku || "N/A"}

Current Quantity: ${currentQuantity}
Minimum Quantity: ${minimumQuantity}

Please restock this product.

Regards,
StockPilot
          `.trim(),
        },
      },
    },
  });

  const response = await ses.send(command);

  console.log(
    "SES Message ID:",
    response.MessageId,
  );

  return {
    success: true,
    message: "Low stock email sent successfully",
    messageId: response.MessageId,
  };
};