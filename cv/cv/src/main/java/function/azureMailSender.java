package function;

import com.azure.communication.email.models.*;
import com.azure.communication.email.*;
import com.azure.core.util.polling.LongRunningOperationStatus;
import com.azure.core.util.polling.PollResponse;
import com.azure.core.util.polling.SyncPoller;

import java.io.IOException;
import java.time.Duration;
import java.util.ArrayList;

//reference: https://learn.microsoft.com/en-us/azure/communication-services/quickstarts/email/send-email?pivots=programming-language-java
public final class azureMailSender {
	static final Duration POLLER_WAIT_TIME = Duration.ofSeconds(1);
	static final String
			conn = "endpoint=https://servcom.communication.azure.com/;accesskey=FVZ9zX01J5iJCZMqenkKGOhh3Ln17ceoL0W4Ob5H5qJfd4f7OOaChCm4adlGnmwzJoJVS0yYjRGPAvh6AUWFdA==",
			sender = "<Dinosaur.lol@41556261-6fe1-4af8-b8b6-688b6050d418.azurecomm.net>";
	static public boolean sendPlain(String dst, String subject, String plainText) {

	EmailMessage message = new EmailMessage()
			.setSenderAddress(sender)
			.setToRecipients(String.format("<%s>", dst))
			.setSubject(subject)
			.setBodyPlainText(plainText);

	try

	{
		EmailClient emailClient = new EmailClientBuilder()
		.connectionString(conn)
		.buildClient();
		SyncPoller<EmailSendResult, EmailSendResult> poller = emailClient.beginSend(message, null);

		PollResponse<EmailSendResult> pollResponse = null;

		Duration timeElapsed = Duration.ofSeconds(0);

		while (pollResponse == null
				|| pollResponse.getStatus() == LongRunningOperationStatus.NOT_STARTED
				|| pollResponse.getStatus() == LongRunningOperationStatus.IN_PROGRESS) {
			pollResponse = poller.poll();
			System.out.println("Email send poller status: " + pollResponse.getStatus());

			Thread.sleep(POLLER_WAIT_TIME.toMillis());
			timeElapsed = timeElapsed.plus(POLLER_WAIT_TIME);

			if (timeElapsed.compareTo(POLLER_WAIT_TIME.multipliedBy(18)) >= 0) {
				throw new RuntimeException("Polling timed out.");
			}
		}

		if (poller.getFinalResult().getStatus() == EmailSendStatus.SUCCEEDED) {
			System.out.printf("Successfully sent the email (operation id: %s)", poller.getFinalResult().getId());
			return true;
		} else {
			throw new RuntimeException(poller.getFinalResult().getError().getMessage());
		}
	}
catch(
	Exception exception)

	{
		System.out.println(exception.getMessage());
	}

	return false;

}

	static public boolean sendPy(String dst, String subject, String plainText, String imgPath)
	throws IOException, InterruptedException {

		String[] cmd = {
				Me.extern.pyInterpr, Me.extern.notify, subject, dst, plainText, imgPath, "1"
		};

		Process p = Runtime.getRuntime().exec(cmd);

		int rv = p.waitFor();

		print("exit with " + rv);

		if (rv >= 1)
			return false;
		return true;
	}

//	static public boolean sendPlain(String dst, String subject, String plainText) {
//		EmailClient cl = new EmailClientBuilder().connectionString(conn).buildClient();
//
//		EmailAddress dstAddr = null;
//		try {
//			dstAddr = new EmailAddress(dst);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		ArrayList<EmailAddress> reciptList = new ArrayList<>(1);
//		reciptList.add(dstAddr);
//		EmailRecipients allRecip = new EmailRecipients(reciptList);
//
//		EmailContent content = new EmailContent(subject).setPlainText(plainText);
//
//		EmailMessage msg = new EmailMessage(sender, content);
//		msg.setRecipients(allRecip);
//
//		SendEmailResult rs = cl.send(msg);
//		String rsStr = rs.getMessageId();
//
//		SendStatusResult status = cl.getSendStatus(rsStr);
//		print("Message id & status: ", rsStr, status.getStatus());
//
//		if (status.getStatus().toString().toLowerCase().equals(SendStatus.QUEUED.toString())) {
//			print("Message queued!");
//			return  true;
//		}
//
//		return false;
//	}

	static private void print(Object... vargs) {
		Object[] args = vargs;
		for (Object o : args) {
			System.out.println("=============================");
			System.out.println(o.toString());
		}
	}
}