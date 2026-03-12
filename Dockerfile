FROM stalwartlabs/stalwart:v0.15.5

LABEL maintainer="Triangle.s <cmars@triangles.co.kr>"
LABEL description="PolyON Mail — Stalwart Mail Server"

# entrypoint는 stalwart 공식 이미지 그대로 사용
# 설정(config.toml)은 K8s ConfigMap + initContainer로 PVC에 주입
