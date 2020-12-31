{{/*
Expand the name of the chart.
*/}}
{{- define "webrtc-observer.name" -}}
{{- default .Chart.Name .Values.observer.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webrtc-observer.fullname" -}}
{{- if .Values.observer.fullnameOverride }}
{{- .Values.observer.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.observer.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "webrtc-observer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "webrtc-observer.labels" -}}
helm.sh/chart: {{ include "webrtc-observer.chart" . }}
{{ include "webrtc-observer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "webrtc-observer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "webrtc-observer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "webrtc-observer.serviceAccountName" -}}
{{- if .Values.observer.serviceAccount.create }}
{{- default (include "webrtc-observer.fullname" .) .Values.observer.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.observer.serviceAccount.name }}
{{- end }}
{{- end }}





{{/*
Expand the name of the chart.
*/}}
{{- define "hzelman.name" -}}
{{- $name := default .Chart.Name .Values.hzelman.nameOverride }}
{{- $newName := printf "%s-hzelman" $name }}
{{- default $newName | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hzelman.fullname" -}}
{{- if .Values.hzelman.fullnameOverride }}
{{- .Values.hzelman.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.hzelman.nameOverride }}
{{- $newName := printf "%s-hzelman" $name }}
{{- if contains $newName .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $newName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "hzelman.labels" -}}
helm.sh/chart: {{ include "webrtc-observer.chart" . }}
{{ include "hzelman.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hzelman.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hzelman.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

