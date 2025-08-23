#!/usr/bin/env bash


k=$(headsetcontrol --output json)
level=$(echo "$k" | jq '.devices[0].battery.level')
status=$(echo "$k" | jq -r '.devices[0].battery.status')

if [[ -z "$level" || "$level" == "null" ]]; then
    echo '{"text": "󰋐 ", "tooltip": "No headset", "class": "disconnected", "percentage": 0}'
    exit 0
fi

# Se estiver carregando, usar ícone de carregamento
if [[ "$status" == "BATTERY_CHARGING" ]]; then
    if (( level >= 90 )); then
        icon="󰂋"
        css_class="full"
    elif (( level >= 80 )); then
        icon="󰂊"
        css_class="high"
    elif (( level >= 70 )); then
        icon="󰢞"
        css_class="high"
    elif (( level >= 60 )); then
        icon="󰂉"
        css_class="medium"
    elif (( level >= 50 )); then
        icon="󰢝"
        css_class="medium"
    elif (( level >= 40 )); then
        icon="󰂈"
        css_class="medium"
    elif (( level >= 30 )); then
        icon="󰂇"
        css_class="low"
    elif (( level >= 20 )); then
        icon="󰂆"
        css_class="low"
    elif (( level >= 1 )); then
        icon="󰢟"
        css_class="critical"
    else
        echo '{"text": "󰋐 ", "tooltip": "No headset", "class": "disconnected", "percentage": 0}'
        exit 0
    fi
else
    # Ícone e classe baseados no nível de bateria
    if (( level >= 90 )); then
        icon="󰂂"
        css_class="full"
    elif (( level >= 80 )); then
        icon="󰂁"
        css_class="high"
    elif (( level >= 70 )); then
        icon="󰂀"
        css_class="high"
    elif (( level >= 60 )); then
        icon="󰁿"
        css_class="medium"
    elif (( level >= 50 )); then
        icon="󰁾"
        css_class="medium"
    elif (( level >= 40 )); then
        icon="󰁽"
        css_class="medium"
    elif (( level >= 30 )); then
        icon="󰁼"
        css_class="low"
    elif (( level >= 20 )); then
        icon="󰁻"
        css_class="low"
    elif (( level >= 1 )); then
        icon="󰂃"
        css_class="critical"
    else
        echo '{"text": "󰋐 ", "tooltip": "No headset", "class": "disconnected", "percentage": 0}'
        exit 0
    fi
fi

echo "{\"text\": \"$icon $level%\", \"tooltip\": \"Battery: $level%\", \"class\": \"$css_class\", \"percentage\": $level, \"status\": \"$status\"}"
