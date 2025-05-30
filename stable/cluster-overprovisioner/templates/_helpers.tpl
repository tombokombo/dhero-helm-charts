{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-overprovisioner.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster-overprovisioner.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-overprovisioner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for PriorityClass.
*/}}
{{- define "PriorityClass.apiVersion" -}}
{{- if semverCompare ">=1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "scheduling.k8s.io/v1" -}}
{{- else if semverCompare ">=1.11-0, <1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "scheduling.k8s.io/v1beta1" -}}
{{- else if semverCompare "<1.11-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "scheduling.k8s.io/v1alpha1" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cluster-overprovisioner.labels" -}}
app.kubernetes.io/name: {{ include "cluster-overprovisioner.name" . }}
helm.sh/chart: {{ include "cluster-overprovisioner.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.extraLabels }}
{{ toYaml . }}
{{- end }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cluster-overprovisioner.matchLabels" -}}
app.kubernetes.io/name: {{ include "cluster-overprovisioner.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Return the cluster-overprovisioner service account name
*/}}
{{- define "cluster-overprovisioner.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cluster-overprovisioner.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
