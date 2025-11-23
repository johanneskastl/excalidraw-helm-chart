# excalidraw

![Version: 0.6.5](https://img.shields.io/badge/Version-0.6.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Virtual whiteboard for sketching hand-drawn like diagrams

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/excalidraw-helm-chart/issues/)**

## Source Code

* <https://github.com/excalidraw/excalidraw>

## Requirements

## TL;DR

```console
helm repo add johanneskastl-excalidraw https://johanneskastl.github.io/excalidraw-helm-chart/
helm repo update
helm install excalidraw johanneskastl-excalidraw/excalidraw
```

## Installing the Chart

To install the chart with the release name `excalidraw`

```console
helm install excalidraw johanneskastl-excalidraw/excalidraw
```

## Uninstalling the Chart

To uninstall the `excalidraw` deployment

```console
helm uninstall excalidraw
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install excalidraw \
  --set env.TZ="America/New York" \
    johanneskastl-excalidraw/excalidraw
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install excalidraw johanneskastl-excalidraw/excalidraw -f values.yaml
```

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 0.6.5

#### Added

* N/A

#### Changed

* update excalidraw digest to sha256:bb1a890daefaa223b914b49e183687f93c599b74065ac2acb0e52c7414cddd16

#### Fixed

* N/A

### Version 0.6.4

#### Added

* N/A

#### Changed

* generate README with helm-docs

#### Fixed

* N/A

### Version 0.6.3

#### Added

* N/A

#### Changed

* update excalidraw digest to sha256:62fbadfb9ad2f5ddb56f66e57295f0372abfcbe6b6ca4ae7713e1b13ad56985d

#### Fixed

* N/A

### Version 0.6.2

#### Added

* add the artifact annotation

#### Changed

* N/A

#### Fixed

* N/A

### Version 0.6.1

#### Added

* N/A

#### Changed

* update excalidraw digest to sha256:d7b4d7ebc517ccb250ba38f14dd1463573b422631046f96c725284f543bc5f1f

#### Fixed

* N/A

### Version 0.6.0

#### Added

* N/A

#### Changed

* pin excalidraw digest to sha256:178325161607e0446c2bc8104f2e7f051feb97db13022cd0778b0373871ea99c

#### Fixed

* N/A

## Support

Open an [issue](https://github.com/johanneskastl/excalidraw-helm-chart/issues/).
