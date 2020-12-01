# CentOS7 RPM build

## Python 3.8

```bash
docker build -t rpmbuild .
docker run --rm -v $HOME/rpmbuild:/root/rpmbuild -t rpmbuild:latest python3
```
