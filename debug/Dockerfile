# Use Fedora or CentOS as the base image
FROM fedora:latest
RUN dnf install telnet -y 
RUN dnf install mysql -y 
RUN dnf clean all
CMD ["sleep", "20000"]

# FROM almalinux:9
# RUN dnf install telnet -y
# RUN dnf install mysql -y
# CMD [ "sleep","20000" ]

# kubectl exec -it debug -n expense -- /bin/bash
# mysql -h mysql -u root -pExpenseApp@1