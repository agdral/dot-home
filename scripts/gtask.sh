#!/bin/bash

TASK_LIST_ID="MDY5NjIzOTY3NjM1NTY4MjUzNTg6MDow"
API_URL="https://tasks.googleapis.com/tasks/v1/lists/${TASK_LIST_ID}/tasks"
TOKEN=$(gcloud auth application-default print-access-token)

sqlite3 ~/Apps/TaskWarrior/taskchampion.sqlite3 "select * from tasks" | while read -r line; do
  json=$(echo "$line" | cut -d'|' -f2)
	status=$(echo "$json" | jq -r .status)
	if [[ "$status" == "pending" ]]; then
		id=$(echo "$line" | cut -d'|' -f1)
		description=$(echo "$json" | jq -r .description)
		project=$(echo "$json" | jq -r .project)
		curl -X POST \
			-H "Authorization: Bearer ${TOKEN}" \
			-H "Content-Type: application/json" \
			-d "{'title': '$description', 'id': '$id'}" \
			"$API_URL"
		echo "" # Add a blank line for readability
	fi
done

echo "Tareas creadas."
