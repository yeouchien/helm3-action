# Helm 3 docker action

This action run helm command in docker with provided `KUBE_CONFIG_DATA` and optional `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`.

## Inputs

### `command`

**Required** helm command to execute

## Environment

- `KUBE_CONFIG_DATA` -- **Required** A base64-encoded kubeconfig. i.e. `cat ~/.kube/config | base64 | pbcopy`

## Example usage

```
uses: yeouchien/helm3-action
with:
  command: 'list'
env:
  KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```
