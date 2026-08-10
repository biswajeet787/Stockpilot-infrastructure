import {
  SESClient,
  SendEmailCommand,
} from "@aws-sdk/client-ses";

const ses = new SESClient({
  region: process.env.AWS_REGION,
});

export const handler = async (event) => {

  console.log("Received event:", JSON.stringify(event));

  const recipientEmail = event.email;

  const command = new SendEmailCommand({

    Source: process.env.SES_FROM_EMAIL,

    Destination: {
      ToAddresses: [recipientEmail],
    },

    Message: {

      Subject: {
        Data: "StockPilot Test Email",
      },

      Body: {

        Text: {
          Data:
            "Hello! This is a test email sent from StockPilot Lambda using Amazon SES.",
        },

      },

    },

  });

  const response = await ses.send(command);

  console.log("SES Message ID:", response.MessageId);

  return {

    success: true,

    message: "Email sent successfully",

    messageId: response.MessageId,

  };
};
