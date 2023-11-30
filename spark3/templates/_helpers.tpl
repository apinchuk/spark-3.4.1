{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "spark-history-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spark-history-server.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-" .Release.Name "history-server1" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-" .Release.Name $name "history-server1" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "spark-history-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use for spark history
*/}}
{{- define "spark-history-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "spark-history-server.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "spark.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default "spark" .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default1" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
