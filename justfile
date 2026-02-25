fmt:
    stylua .

uploadall:
    git remote | xargs -L1 git push --all
