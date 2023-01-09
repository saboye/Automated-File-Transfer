### <h1 align="center" style="color:blue;" id="heading">Automated File Transfer with Bash</h1>

![GitHub contributors](https://img.shields.io/github/contributors/saboye/Automated-File-Transfer-with-Bash?color=blue&logo=github&style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/saboye/Automated-File-Transfer-with-Bash?logo=github&style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues-raw/saboye/Automated-File-Transfer-with-Bash?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/saboye/Automated-File-Transfer-with-Bash?label=license&style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/saboye/Automated-File-Transfer-with-Bash?style=for-the-badge)

## Automated File Transfer
This script automates the process of transferring files from a source directory to a destination directory. It can be run on a schedule or ad hoc, and sends notifications via SMS and email in the event of a failure or success.

## Prerequisites
- AWS CLI
- aws command should be added to PATH, run aws --version to check if installed
- An AWS account with the Simple Notification Service (SNS) and Simple Email Service (SES) services set up
- A phone number and email address to send the notifications to

#### Usage
1. Clone the repository:

```sh
git clone git@github.com:saboye/Automated-File-Transfer.git


```

2. Navigate to the cloned directory:
```sh
cd Automated-File-Transfer

```

3. Set the phone number and email address to send the notifications to in the PHONE_NUMBER and EMAIL_ADDRESS variables at the top of the script.

4. Set the paths for the source and destination directories in the source_dir and destination_dir variables.

5. Set the path for the log file in the log_file variable.

6. Run the script:

```sh
./transfer.sh

```
You can also pass a date parameter to the script to transfer a file for a specific date, in the format YYYY-MM-DD:

```sh
./transfer.sh 2022-01-01

```

## Scheduling
To run the script on a schedule, you can use a tool like cron on Linux. Edit the crontab file by running the following command:

```sh
crontab -e
```

Add a line to the file to run the script at the desired frequency. For example, to run the script every day at 8 AM, add the following line:

```sh
0 8 * * * /path/to/transfer.sh
```

Save and exit the file. The script will now be run automatically at the specified frequency.

Logging
The script logs events to a log file specified in the log_file variable. The log file contains timestamped messages for each run of the script, including success and failure messages and any notifications that were sent.


Troubleshooting
- Make sure that the aws command is in your PATH
- Check the AWS account's permissions to ensure that the necessary services (SNS and SES) are enabled
- Check the phone number and email address to make sure they are correct and properly formatted
- Check the paths for the source, destination, and log files to ensure they are correct and the directories exist
- Check the log file for any error messages that may help identify the issue

#### Author

👤 **SABOYE**

* Twitter: [@saboye1](https://twitter.com/saboye1)
* Github: [@saboye](https://github.com/saboye)


#### 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/saboye/animation/issues).

#### Show your support

Give a ⭐️ if this project helped you!

#### 📝 License


This project is [MIT](https://github.com/saboye/Automated-File-Transfer/blob/main/LICENSE) licensed.

***



