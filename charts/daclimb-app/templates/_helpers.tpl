{{/*
Expand the name of the chart.
*/}}
{{- define "daclimb-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "daclimb-app.fullname" -}}
{{- .Values.appName }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "daclimb-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "daclimb-app.labels" -}}
helm.sh/chart: {{ include "daclimb-app.chart" . }}
{{ include "daclimb-app.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "daclimb-app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.appName }}
app.kubernetes.io/instance: {{ .Values.appName }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "daclimb-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "daclimb-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
