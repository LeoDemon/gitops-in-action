# clone example manifests
git clone https://github.com/lyzhang1999/kubernetes-example.git

# add github-workflows and push to my github repository
git remote set-url origin git@github.com:LeoDemon/kubernetes-github-action-eg.git

# modify `.github/workflows/build.yaml`

# create docker hub secret

# create github action secret

# trigger github action workflow
git commit --allow-empty -m "Trigger Build"
git push origin main

