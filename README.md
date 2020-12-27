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

## WebRTC-Observer Configuration

Configuration related to change the behaviour of the observer is in the [values.yaml](https://github.com/ObserveRTC/helm/blob/main/webrtc-observer/values.yaml) 
under the `observer` property. 

`observer.pcObserver:`

| Parameter                    | Description                                                                                                                                                                                                                                                                                             | Default |
|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| peerConnectionMaxIdleTimeInS | Defines the maximum time a peer connection can be idle, If a peer connection does not send any update in this period then it is considered to be expired.                                                                                                                                               | 300     |
| mediaStreamUpdatesFlushInS   | Defines the flush period in seconds for the buffer collecting samples from peer connections. Higher number decreases the load, but delays the updates                                                                                                                                                   | 15      |
| mediaStreamsBufferNums       | The number of parallel buffers the samples from peer connections are collected. This is slightly important for performance reason, as each buffer uses a mutex when it receives sample updates. if the value is 0, then the number of parallel buffers are equal to the number of available processors. | 0       |


