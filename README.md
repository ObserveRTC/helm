## Introduction


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
observertc/webrtc-observer      21.3.0          0.7.0        
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

## Configurations

TBD