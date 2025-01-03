
ZJ_SESSIONS=$(zellij list-sessions)
NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

if [[ -z "$ZELLIJ" ]]; then
    if [ "${NO_SESSIONS}" -eq 1 ]; then
        zellij attach -c
    else
        zellij
    fi

    if [ "${ZELLIJ_AUTO_EXIT}" = "true" ]; then
        exit
    fi
fi
