#!/bin/sh
set -e
targetBranch=$1
if [ -n "$REPO_BRANCH" ]; then
    targetBranch="$REPO_BRANCH"
fi
if [ -z "$targetBranch" ]; then
    targetBranch="master"
fi

echo -e "$KEY" >/root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

cloneRepo() {
    repoName=$1
    repoUrl=$2
    branchName=$3
    if [ ! -d "/${repoName}/.git" ]; then
        echo "█未检查到${repoName}仓库，clone..."
        git clone "${repoUrl}" /"${repoName}"
        git -C "/${repoName}" fetch --all
        git -C "/${repoName}" checkout "${branchName}"
    else
        echo "█更新${repoName}仓库..."
        git -C "/${repoName}" fetch --all
        git -C "/${repoName}" checkout "${branchName}"
        git -C "/${repoName}" reset --hard origin/"${branchName}"
        git -C "/${repoName}" pull origin "${branchName}" --rebase
    fi
}

ssh-keyscan "$REPO_DOMAIN" >/root/.ssh/known_hosts
cloneRepo surgio git@gogs.mynetgear.com:lowking/my-rule-store.git "$targetBranch"

cp -f ./docker-entrypoint.sh /usr/local/bin
cp -f ./surgio-id-rsa /root/.ssh/id_rsa

npm config delete registry
npm config set registry http://registry.npmjs.org
npm install

sh start.sh
