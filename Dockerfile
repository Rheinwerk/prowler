FROM toniblyx/prowler:stable

ARG USERNAME=prowler
ARG USERID=34000

# switch to root
USER 0

# modified entrypoint script
COPY entrypoint.sh /entrypoint.sh

USER ${USERNAME}

ENTRYPOINT ["/entrypoint.sh"]