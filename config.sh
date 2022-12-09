acc_id=$1
region=$2
domain=$3
repos=$4

install_cmd="pip install -r requirements.txt"
if [ -z "$acc_id" ] || [ -z "$region" ] || [ -z "$domain" ] || [ -z "$repos" ]; then
  $install_cmd
  exit 0
fi

export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain $domain --domain-owner $acc_id --region $region --query authorizationToken --output text`

for repo in $repos
do
  install_cmd="$install_cmd --extra-index-url https://aws:$CODEARTIFACT_AUTH_TOKEN@$domain-$acc_id.d.codeartifact.$region.amazonaws.com/pypi/$repo/simple/"
done

echo $install_cmd
$install_cmd
