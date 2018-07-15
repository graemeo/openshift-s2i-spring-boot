# spring-boot-s2i
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
# LABEL maintainer="Your Name <your@email.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="S2I for building Spring Boot enabled application" \
      io.k8s.display-name="Spring Boot" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,spring boot"

RUN yum install -y java-1.8.0-openjdk-devel && yum clean all -y

COPY ./s2i/bin/ /usr/libexec/s2i

USER 1001

