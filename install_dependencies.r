pkgs = read.csv('r_requirements.txt', header=FALSE, stringsAsFactors=FALSE)$V1
install.packages(pkgs, repos='http://cloud.r-project.org/')
