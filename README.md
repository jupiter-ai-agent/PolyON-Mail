# PolyON Mail

PolyON Stalwart Mail Server.

## 기반 이미지
- `stalwartlabs/stalwart:v0.15.5`
- 커스터마이징 없음 — Dockerfile은 버전 고정 목적

## 설정 방식
K8s 배포 시 `initContainer`로 `config.toml`을 PVC에 복사:
```yaml
initContainers:
  - name: config-init
    image: busybox:1.36
    command: ["sh", "-c", "cp /config-source/config.toml /opt/stalwart/etc/config.toml"]
```

## 버전 정책
- stalwart v0.15.5 고정 (Operator 설치 기본값)
- ES 8.x 호환 필수 (v0.15.5는 ES 9.x 미호환)
- 버전 업그레이드 전 FTS 인덱스 호환성 확인 필요

## 빌드
```bash
docker build --platform linux/amd64,linux/arm64 -t jupitertriangles/polyon-mail:v1.0.0 .
```

## 주요 설정 (config.toml 참조)
- **Directory**: Samba AD LDAP (`polyon-dc:389`)
- **FTS**: OpenSearch (`polyon-search:9200`)
- **Blob**: RustFS S3 (`polyon-rustfs:9000`)
- **Fallback admin**: `STALWART_ADMIN` secret
