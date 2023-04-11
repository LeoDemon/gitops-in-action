# clone example manifests
git clone https://github.com/lyzhang1999/kubernetes-example.git

# add github-workflows and push to my github repository
git remote set-url origin git@gitlab.com:jwkljh/kubernetes-gitlab-action-eg.git

# modify `.gitlab-ci.yaml`

# create docker hub secret

# create gitlab CI Variables

# trigger gitlab action workflow
# git commit --allow-empty -m "Trigger Build"
git push -u origin main

