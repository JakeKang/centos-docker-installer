### Docker 오프라인 설치 가이드 (CentOS 7)

이 문서는 CentOS 7 시스템에서 Docker와 Docker Compose를 오프라인으로 설치하는 방법에 대한 가이드를 제공합니다.

#### 준비사항

- CentOS 7이 설치된 시스템
- 오프라인 환경에서 사용할 `docker-installer` 폴더와 해당 폴더 내에 `rpm` 서브폴더가 포함된 USB 드라이브 또는 외부 저장 장치
- 필요한 Docker 및 Docker Compose RPM 패키지, 그리고 `createrepo` 패키지가 `rpm` 폴더 내에 저장됨

#### 설치 절차

**필요한 파일 준비**

- 인터넷이 연결된 환경에서 Docker CE, Docker CE CLI, containerd.io, docker-buildx-plugin, docker-compose-plugin 및 `createrepo`의 RPM 패키지를 다운로드합니다.
- 다운로드한 패키지를 `docker-installer/rpm` 폴더에 저장합니다.

혹은

**오프라인 파일 확인**

- `docker-installer/rpm` 폴더에 createrepo 및 docker 설치와 관련된 `rpm` 파일이 존재하는지 확인합니다.

**`docker-installer` 폴더를 오프라인 CentOS 7 시스템으로 복사**

- USB 드라이브 또는 외부 저장 장치를 사용하여 `docker-installer` 폴더를 오프라인 CentOS 7 시스템으로 전송합니다.

---

3. **스크립트 실행 준비**
   ```bash
   cd /path/to/docker-installer
   chmod +x installer.sh
   ```
4. **Docker 설치 스크립트 실행**
   ```bash
   ./installer.sh
   ```
   스크립트가 실행되면 Docker 및 Docker Compose가 자동으로 설치되고 시작됩니다.

#### 문제 해결

- **`createrepo` 설치 실패**: `createrepo` 패키지가 `rpm` 폴더 내에 있는지 확인하세요. 패키지가 없거나 손상된 경우, 올바른 패키지를 다운로드하여 폴더에 다시 추가해야 합니다.
- **Docker 서비스 시작 실패**: Docker 서비스를 수동으로 시작하려면 `systemctl start docker` 명령어를 사용하세요. 서비스가 시작되지 않는 경우, 시스템 로그 (`journalctl -xe`)를 확인하여 문제를 진단할 수 있습니다.
- **Docker Compose 실행 실패**: `docker compose version` 명령어를 사용하여 Docker Compose가 정상적으로 설치되었는지 확인하세요. 설치되지 않았다면, 필요한 RPM 패키지가 `rpm` 폴더 내에 있는지 다시 확인하고 스크립트를 재실행하세요.

#### 추가 정보

이 가이드는 CentOS 7 환경에서 Docker와 Docker Compose를 오프라인으로 설치하는 기본 절차를 설명합니다. 환경에 따라 추가 구성이 필요할 수 있습니다. 오프라인 설치를 위해 필요한 모든 RPM 파일은 미리 준비해야 합니다.

#### 테스트 centos7 OS 두종류

`centos7-docker` 폴더의 docker-compose 로 테스트 해볼 수 있습니다. 해당 테스트는 온라인 환경에서만 실행해주세요.
