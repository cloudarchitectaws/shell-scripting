source components/common.sh

echo "Setup NodeJS repo"
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>$LOG_FILE

echo "Install NodeJS"
yum install nodejs gcc-c++ -y &>>$LOG_FILE

echo "Create App User"
useradd roboshop &>>$LOG_FILE

echo "Download Catalogue Code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE

echo "Extract Catalogue Code"
cd /tmp/
unzip -o catalogue.zip &>>$LOG_FILE

echo "Clean Old Catalogue"
rm -rf /home/roboshop/catalogue

echo "Copy Catalogue Content"
cp -r catalogue-main /home/roboshop/catalogue &>>$LOG_FILE

echo "Install NodeJS Dependencies"
cd /home/roboshop/catalogue
npm install &>>$LOG_FILE

chown roboshop:roboshop /home/roboshop/ -R &>>$LOG_FILE

echo "Update SystemD file"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service &>>$LOG_FILE

echo "Setup Catalogue SystemD file"
mv /home/roboshop/catalogue/systemd.service  /etc/systemd/system/catalogue.service &>>$LOG_FILE

echo "Start Catalogue"
systemctl daemon-relaod  &>>$LOG_FILE
systemctl enable catalogue &>>$LOG_FILE
systemctl start catalogue &>>$LOG_FILE


