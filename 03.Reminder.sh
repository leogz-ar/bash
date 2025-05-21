#!/bin/bash

echo -n "⏳ How many minutes should I wait? "
read MINUTES

# Verificar si el valor ingresado es un número entero positivo
if ! echo "$MINUTES" | grep -qE '^[0-9]+$'; then
    echo "❌ Error: please enter a valid positive number."
    exit 1
fi

# Convertir minutos a segundos
SECONDS=$((MINUTES * 60))

# Esperar en segundo plano y notificar
(
    sleep "$SECONDS"
    echo "⏰ Time's up!" "$MINUTES minute(s) have passed."
) &

echo "✅ Reminder set for $MINUTES minute(s). Terminal is free for use."
