# Set the phone number and email address to send the notifications to
PHONE_NUMBER="+1234567890"
EMAIL_ADDRESS="user@example.com"

function send_notification() {
    message=$1

    # Send the SMS notification
    aws sns publish --phone-number $PHONE_NUMBER --message "$message"

    # Send the email notification
    echo "$message" | mail -s "File Transfer Notification" $EMAIL_ADDRESS
}
