# ObserveRTC

ObserveRTC is an open source initiative aimed to provide tools to monitor and analyze applications for real-time communication. is an open source initiative aimed to 
provide tools to monitor and analyze applications for real-time communication.

## Introduction

This chart bootstraps the [Kubernetes](http://kubernetes.io) deployment of the applications 
developed by ObserveRTC.

## Prerequisites

* Kubernetes 1.10+ with Beta APIs enabled

## Install

1. Add the observertc helm repository to your local repos.

```shell
  helm repo add observertc https://observertc.github.io/helm/
```

2. Verify that observertc is added by typing `helm search repo observertc`.
   You should see something like this:
```shell
NAME                            CHART VERSION   APP VERSION     DESCRIPTION                                       
observertc/webrtc-observer      0.6.2           0.6-alpha       A microservice to
```

You probably need to configure the observer, so take a chance
and define your own `values.yaml` based on the [default one](https://github.com/ObserveRTC/helm/blob/main/webrtc-observer/values.yaml).

3. Install

If you saved your configuration into `values.yaml`, then:
```shell
  helm install my-release -f values.yaml observertc/webrtc-observer
```

## Uninstall

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete --purge my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release completely.

## Configuration

```shell
observer:
      # Static mapping between serviceUUID and serviceName for the reports.
      # the config key is the service name you want to see in the reports
      # and the uuid property points to the UUID, which is mapped to the name
      #  serviceMapping:
      #    desredServiceName:
      #      uuid: "VALID UUID"

      # Configuration related to use of the hazelcast in the observer
      hazelcast:
        # The path for the config file.
        # if it starts with classpath:, then resolver tries to find it
        # in the built esources, otherwise it looks for a path
        configFile: hazelcast.yaml

      # Configurations regarding to the evaluators of the observer
      #
      evaluators:
        # Configurations related to the evaluator evaluates the peer connections
        pcObserver:
          # Defines the maximum time a peer connection can be idle,
          # If a peer connection does not send any update in this period
          # then it is considered to be expired.
          peerConnectionMaxIdleTimeInS: 300
          # Defines the flush period in seconds for the buffer collecting
          # samples from peer connections.
          # Higher number decreases the load, but delays the updates
          mediaStreamUpdatesFlushInS: 15
          # The number of parallel buffers the samples from
          # peer connections are collected. This is
          # slightly important for performance reason, as
          # each buffer uses a mutex when it receives sample updates.
          # if the value is 0, then the number of parallel buffers are equal
          # to the number of available processors.
          mediaStreamsBufferNums: 0
      # Configurations for kafka topics
      # WARNING: If this is enabled, then the observer must have admin
      # privilege to check and create topics
      kafkaTopics:
        runAdminClient: False
        createIfNotExists: False
        reports:
          topicName: reports
          onCreatePartitionNums: 30
          onCreateReplicateFactor: 1
          retentionTimeInMs: 86400000

      # Configures the Reports forwarded to kafka.
      # In default all reports are forwarded, and it is not recommended
      # to turn this off, but if you know what you do and want to save some
      # throughput, than go ahead
#      outboundReports:
#        reportOutboundRTPs: True
#        reportInboundRTPs: True
#        reportRemoteInboundRTPs: True
#        reportTracks: True
#        reportMediaSources: True
#        reportCandidatePairs: True
#        reportLocalCandidates: True
#        reportRemoteCandidates: True
#        reportUserMediaErrors: True

      # By default we do not need a database at all, however
      # for backup purposes or configuration fetches purposes
      # it is remained here.
#      database:
#        enabled: False
#        username: root
#        password: password
#        minIdleInMs: 100
#        timeout: 1000
#        jdbcURL: jdbc:mysql://localhost:3306/WebRTCObserver?serverTimezone=EET&useLegacyDatetimeCode=false
#        jdbcDriver: "com.mysql.cj.jdbc.Driver"
#        maxPoolSize: 100
#        poolname: webrtc_observer
#        dialect: MySQL
```