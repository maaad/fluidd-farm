# Fluidd Farm
[![Build Docker Images](https://github.com/maaad/fluidd-farm/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/maaad/fluidd-farm/actions/workflows/docker-publish.yml)

Fluidd standalone install without klipper and moonraker for multiple printers farm. You need only klipper and moonraker installed on the printer side.

## Deployment

To deploy this project run

```bash
print.home:~# docker run -e PRINTER=v0.home,e3p.home -p80:80 ghcr.io/maaad/fluidd-farm:latesty
```

### fluidd configuration
![fluidd config](https://github.com/maaad/fluidd-farm/blob/main/docs/images/fluidd1.png?raw=true)
![fluidd config](https://github.com/maaad/fluidd-farm/blob/main/docs/images/fluidd2.png?raw=true)

### OrcaSlicer 
![orcaslicer config](https://github.com/maaad/fluidd-farm/blob/main/docs/images/orcaslicer.png?raw=true)

### moonraker.conf
Add your farm domain to cors_domains for every printer
```bash
[authorization]
cors_domains:
  *.local
  *.home
```
## Configuration

#### Environment variables

```bash
docker run -e PRINTER=printer1,printer2.local,printer3.home.lan
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `PRINTER` | `string` | **Required**. Comma separated list of your printer. |


## Known issues

If you use Device tab in OrcaSlicer you need to manually switch between printers

## References

[fluidd repository](https://github.com/fluidd-core/fluidd)

[fluidd documentation](https://docs.fluidd.xyz/configuration/multiple_printers)
