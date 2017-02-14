FROM oraclelinux:7.2

MAINTAINER https://github.com/TecHunter/subgit-linux

ENV SUBGIT_VERSION=3.2.3
RUN yum -y install wget && \
 yum -y install git && \
 yum -y install subversion && \
 yum -y install mod_dav_svn && \
 yum clean all -y
RUN wget https://subgit.com/download/subgit-3.2.3.zip
RUN unzip subgit-$SUBGIT_VERSION.zip -d /opt/

ENV PATH=$PATH:/opt/subgit-$SUBGIT_VERSION/bin \
    GIT_REPO_PATH=/var/opt/gitlab/git-data/repositories/USER/REPOS.git \
    SVN_PROJECT_URL=http://svn.company.com/repos/project

CMD["/bin/bash"]