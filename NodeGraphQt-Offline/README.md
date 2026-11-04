# NodeGraphQt 폐쇄망 설치 패키지 (Windows x64 / Python 3.10)

**상태: 설치 도구만 준비됨. 실제 Wheelhouse 미포함 — 현재 바로 설치할 수 없음.**

인터넷에 연결할 수 없는 PC를 위한 구성입니다. `pip install` 시 외부 패키지 저장소를 사용하지 않습니다.

## 폴더 구성

```text
NodeGraphQt-Offline/
  01_check_offline.bat
  02_install_offline.bat
  03_verify.bat
  requirements.txt
  scripts/check_wheels.py
  wheelhouse/              # 이 폴더에 모든 의존성 .whl 파일을 넣어야 함
  source/                  # 선택: NodeGraphQt 원본 소스
```

## 설치

1. Windows 64비트 Python 3.10 설치 (Python 자체는 포함되지 않음).
2. NodeGraphQt 및 의존성에 맞는 **Windows/Python 3.10용** wheel 파일을 `wheelhouse/`에 복사.
3. `01_check_offline.bat` 실행. 누락된 패키지가 있으면 설치를 진행하지 않음.
4. `02_install_offline.bat` 실행. 별도 `.venv`에 설치하며 **--no-index** 적용.
5. `03_verify.bat` 실행하여 Qt 초기화 및 NodeGraphQt import 확인.

`requirements.txt`의 NodeGraphQt 버전은 실제로 확보한 Wheel 파일의 버전과 맞춰야 합니다. 현재 0.6.44는 이전 대화에서 지정된 값으로, 다운로드 가능 여부가 확인되지 않았습니다.

**주의:** 본 GitHub 폴더에는 실제 wheel 파일, 완성 ZIP, Python 설치파일이 없습니다. 이 파일들이 없으면 오프라인 설치할 수 없습니다. GitHub Actions는 사용하지 않습니다.
