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
{{- printf "%s-%s" .Release.Name "history-server" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spark.fullname" -}}
{{- default "spark" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "spark.chart" -}}
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
    {{ default "spark" }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}



{{/*
Create history server clusterrole name
*/}}
{{- define "spark-history-server.clusterrole" -}}
{{- printf "%s-%s" (include "spark-history-server.fullname" .) "role" | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create history server clusterrolebinding name
*/}}
{{- define "spark-history-server.clusterrolebinding" -}}
{{- printf "%s-%s" (include "spark-history-server.fullname" .) "crb" | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create  clusterrole name
*/}}
{{- define "spark.clusterrole" -}}
{{- printf "%s-%s" (include "spark.fullname" .) "role" | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create  clusterrolebinding name
*/}}
{{- define "spark.clusterrolebinding" -}}
{{- printf "%s-%s" (include "spark.fullname" .) "crb" | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
