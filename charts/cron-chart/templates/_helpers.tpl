{{/*
Expand the name of the chart.
*/}}
{{- define "cron-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cron-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Progressive Delivery
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cron-chart.fullnameCanaryDelivery" -}}
beta-{{ include "cron-chart.fullname" . }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cron-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cron-chart.labels" -}}
helm.sh/chart: {{ include "cron-chart.chart" . }}
{{ include "cron-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Progressive Delivery Common labels
*/}}
{{- define "cron-chart.labelsCanaryDelivery" -}}
helm.sh/chart: {{ include "cron-chart.chart" . }}
{{ include "cron-chart.selectorLabelsCanaryDelivery" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cron-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cron-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
canaryDelivery: "false"
{{- end }}

{{/*
Progressive Delivery Selector labels
*/}}
{{- define "cron-chart.selectorLabelsCanaryDelivery" -}}
app.kubernetes.io/name: {{ include "cron-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
canaryDelivery: "true"
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cron-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cron-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
