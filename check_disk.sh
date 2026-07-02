#!/bin/bash


THRESHOLD=30
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Текущее использование диска: $USAGE%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ВНИМАНИЕ: диск заполнен более чем на $THRESHOLD%!"
else
    echo "Всё в порядке, места достаточно."
fi


MAXMEMORY=80
MEMORY=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

echo "Текущее использование памяти: $MEMORY%"

if [ "$MEMORY" -gt "$MAXMEMORY" ]; then
    echo "ВНИМАНИЕ: память заполнена более чем на $MAXMEMORY%!"
else
    echo "Всё в порядке, места достаточно."
fi


UPTIME=$(uptime -p)
echo "Аптайм сервера: $UPTIME"

echo "Проверка завершена"
