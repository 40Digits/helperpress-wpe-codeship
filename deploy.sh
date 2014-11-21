# write HP config
HPCONF=~/.helperpress
echo "{\"environments\": {\"local\": {\"db\": {\"host\": \"127.0.0.1\",\"user\": \"$MYSQL_USER\",\"pass\": \"$MYSQL_PASSWORD\"},\"home_url\": \"codeship-temp-domain.org\"},\"staging\": {\"ssh\": {\"pass\": \"$WPE_SSH_PASS\",\"user\": \"$WPE_SSH_USER\"},\"deploy_method\": \"wpe\"}}}" > $HPCONF

# Setup Git identity
git config --global user.email "ci@codeship.io"
git config --global user.name "Codeship.io CI"

# build it
grunt deploy:$BRANCH --force --stack --debug