# {{jreleaserCreationStamp}}
apiVersion: jib/v1alpha1
kind: BuildFile

from:
  image: {{jibBaseImage}}

{{#jibCreationTime}}
creationTime: "{{.}}"
{{/jibCreationTime}}

format: {{jibFormat}}

{{#hasJibEnvironment}}
environment:
{{#jibEnvironment}}
  {{.}}
{{/jibEnvironment}}
{{/hasJibEnvironment}}

labels:
{{#jibLabels}}
  {{.}}
{{/jibLabels}}

{{#hasJibVolumes}}
volumes:
{{#jibVolumes}}
  - "{{.}}"
{{/jibVolumes}}
{{/hasJibVolumes}}

{{#hasJibExposedPorts}}
exposedPorts:
{{#jibExposedPorts}}
  - "{{.}}"
{{/jibExposedPorts}}
{{/hasJibExposedPorts}}

{{#jibUser}}
user: "{{.}}"
{{/jibUser}}

workingDirectory: "{{jibWorkingDirectory}}"

entrypoint: ["{{jibWorkingDirectory}}/{{distributionArtifactFileName}}/bin/{{distributionExecutableUnix}}"]

layers:
  entries:
    - name: {{distributionName}}
      files:
        - src: assembly
          dest: {{jibWorkingDirectory}}/{{distributionArtifactFileName}}/bin
          includes:
            - "{{distributionExecutableUnix}}"
          properties:
            filePermissions: 755
        - src: assembly
          dest: {{jibWorkingDirectory}}/{{distributionArtifactFileName}}/lib
          includes:
            - "{{distributionArtifactFile}}"
        - src: assembly
          dest: {{jibWorkingDirectory}}
          excludes:
            - "{{distributionExecutableUnix}}"
            - "{{distributionArtifactFile}}"
